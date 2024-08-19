export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/opt/zig

ZSH_THEME="kphoen"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
alias v="nvim"
alias cls="clear"
alias py="python3"

export JAVA_HOME=/usr/java/jdk-17.0.11/
PATH=$PATH:$JAVA_HOME/bin

M2_HOME=/opt/apache-maven-3.9.7
PATH=$M2_HOME/bin:$PATH
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.nvm/nvm.sh
