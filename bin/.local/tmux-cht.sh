#!/usr/bin/env bash
config_dir=~/.config/tmux
selected=`cat $config_dir/tmux-cht-languages.txt $config_dir/tmux-cht-command.txt | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" $config_dir/tmux-cht-languages.txt; then
    query=`echo $query | tr ' ' '+'`
    # tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
    # echo "curl cht.sh/$selected/$query | less"
    tmux neww bash -c "curl cht.sh/$selected/$query | less"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
    # echo "curl -s cht.sh/$selected~$query | less"
fi
