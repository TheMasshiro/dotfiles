#!/bin/bash

if [[ -z "$ZELLIJ" ]] && [[ -z "$SSH_CONNECTION" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi
    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

$SHELL
