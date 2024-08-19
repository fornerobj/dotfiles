#!/bin/bash

upower --dump | grep -A 15 Mouse | awk '/percentage:/ {print $2}'
