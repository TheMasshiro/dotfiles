#!/usr/bin/env bash

sudo dnf update -y && sudo dnf autoremove -y
mise self-update -y && mise up && mise prune
