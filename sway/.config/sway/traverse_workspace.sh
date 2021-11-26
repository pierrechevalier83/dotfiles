#!/bin/bash

set -x

CUR_DISPLAY=$(swaymsg -t get_tree | jq -r --unbuffered --compact-output '
(
    select(.name == "root") |
        first(.focus[]) )')

CUR_WORKSPACE_NAME=$(swaymsg -t get_tree | jq -r --unbuffered --compact-output "
(
    select(.name == \"root\") |
    .nodes[] |
    select(.id == $CUR_DISPLAY) |
   .current_workspace )")

CUR_WORKSPACE_NUM=$(echo $CUR_WORKSPACE_NAME | sed 's/[^0-9]*//g')

MAX_WORKSPACE=$(swaymsg -t get_workspaces -p | rg Workspace | sed "s/[^0-9]//g" | tail -n 1)

if [[ "$1" == "next" &&
     "$CUR_WORKSPACE_NUM" == "$MAX_WORKSPACE" &&
     "$CUR_WORKSPACE_NAME" != "$CUR_WORKSPACE_NUM" ||
     "$1" == "prev" &&
     "$CUR_WORKSPACE_NUM" == "1" ]]; then
   TO_WORKSPACE=$(expr $MAX_WORKSPACE + 1)
   swaymsg workspace number $TO_WORKSPACE
   exit 0
fi

swaymsg workspace $1

