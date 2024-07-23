#!/bin/bash

# pretty prompt
color_a="33"
color_b="30"
color_bg_a=$((color_a+10))
color_bg_b=$((color_b+10))
fga="\[\e[${color_a};49m\]"
fgb="\[\e[${color_b};49m\]"
bga="\[\e[${color_bg_a};39m\]"
bgb="\[\e[${color_bg_b};39m\]"
ab="\[\e[${color_a};${color_bg_b}m\]"
ba="\[\e[${color_b};${color_bg_a}m\]"
bold="\[\e[1m\]"
reset="\[\e[0m\]"
sep="$(printf '\ue0b0')"

PS1_BASIC=$"\n$bold$fga[$fgb\u$fga@$fgb\h$fga] $fgb\w $fga\$ $reset"
PS1_PRETTY=$"\n$bold$ba$sep$ab$sep \u@\h $ba$sep \w $reset$fga$bold$sep \$ $reset"

if [[ "$LANG" == *".UTF-8"* ]] && [[ "$(tty)" != "/dev/tty"* ]]; then
    echo $PS1_PRETTY
else
    echo $PS1_BASIC
fi
