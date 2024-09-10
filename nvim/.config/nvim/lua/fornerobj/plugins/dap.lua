return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({})

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }

      -- local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
      -- if elixir_ls_debugger ~= "" then
      --   dap.adapters.mix_task = {
      --     type = "executable",
      --     command = elixir_ls_debugger,
      --   }
      --
      --   dap.configurations.elixir = {
      --     {
      --       type = "mix_task",
      --       name = "phoenix server",
      --       task = "phx.server",
      --       request = "launch",
      --       projectDir = "${workspaceFolder}",
      --       exitAfterTaskReturns = false,
      --       debugAutoInterpretAllModules = false,
      --     },
      --   }
      -- end

      ui.setup({
        layouts = {
          {
            -- Left sidebar with variables (scopes) and watches
            elements = {
              { id = "scopes", size = 0.75 },  -- Shows variables and their values
              { id = "watches", size = 0.25 }, -- Optional: to watch specific variables
            },
            size = 40,  -- Width of the sidebar
            position = "left",  -- Open on the left side
          },
          {
            -- Bottom panel with repl and console
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",  -- Open at the bottom
          },
        },
      })

      dap.configurations.cpp = {
        {
          name = "C++ Debug And Run",
          type = "codelldb",
          request = "launch",
          program = function()
            -- First, check if exists CMakeLists.txt
            local fileName = vim.fn.expand("%:t:r")
            -- create this directory
            local cmd = "!g++ -g *.cpp -o " .. fileName
            -- First, compile it
            vim.cmd(cmd)
            -- Then, return it
            return "${fileDirname}/" .. fileName
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          runInTerminal = true,
          console = "integratedTerminal",
        },
      }

      local mason_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb'
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = mason_path,
          args = { "--port", "${port}" },
          options = {
            terminal = "/usr/bin/env bash",
          },
        }
      }

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
