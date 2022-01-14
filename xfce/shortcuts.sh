#!/usr/bin/env bash

declare -A dict=(
  ['/xfwm4/custom/<Primary><Alt>u']=workspace_1_key
  ['/xfwm4/custom/<Primary><Alt>i']=workspace_2_key
  ['/xfwm4/custom/<Primary><Alt>o']=workspace_3_key
  ['/xfwm4/custom/<Primary><Alt>p']=workspace_4_key
  ['/xfwm4/custom/<Primary><Alt>h']=left_workspace_key
  ['/xfwm4/custom/<Primary><Alt>l']=right_workspace_key
  ['/xfwm4/custom/<Super>Left']=tile_left_key
  ['/xfwm4/custom/<Super>Right']=tile_right_key
  ['/xfwm4/custom/<Super>Up']=tile_up_key
  ['/xfwm4/custom/<Super>Down']=tile_down_key
  ['/xfwm4/custom/<Super>d']=show_desktop_key
  ['/xfwm4/custom/<Super>f']=fullscreen_key
  ['/commands/custom/<Primary><Alt>z']=xfce4-terminal
  ['/commands/custom/<Super>e']=thunar
  ['/commands/custom/<Super>z']='xfce4-terminal --execute zsh -c "tmux new-session -A -s main"'
)

for key in "${!dict[@]}"; do
  echo "add $key --> ${dict[$key]}"
  xfconf-query --create -c xfce4-keyboard-shortcuts -p $key -t string -s "${dict[$key]}"
done
