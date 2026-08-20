#!/usr/bin/env bash

echo "Configuring Git"

rsync -a git/.gitconfig ~/
rsync -a git/.gitignore_global ~/