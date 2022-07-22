#! /usr/bin/env bash

{
  sudo apt update
  sudo apt install tmux
  sudp apt install python3
  sudo apt install cool-retro-term
  sudo apt install tmux
  sudo apt install neovim
  sudo apt install nnn
  sudo apt install xcape
} &&  cp -rv config/ ~/.config/ && {

alias python='python3'
alias e='neovim'
alias n='nnn'
alias crt='cool-retro-term'

setxkbmap -layout fr -option caps:ctrl_modifier && xcape -e Caps_Lock=Escape

} && {
  echo 'success!'
  exit 0
}

echo 'failed!'
exit 1
