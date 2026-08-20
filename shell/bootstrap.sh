#!/usr/bin/env bash

echo "Configuring shell"


# Install + configure Starship
curl -fsSL https://starship.rs/install.sh -o /tmp/starship.sh
sh /tmp/starship.sh --yes -b ~/.local/bin
rsync -a shell/starship.toml ~/.config/
