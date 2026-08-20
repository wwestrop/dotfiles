
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'     # case insensitive tab completion
setopt nocaseglob                                                                     # case insensitive globbing
zstyle ':completion:*' rehash true                                                    # automatically find new executables in path

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt INTERACTIVE_COMMENTS

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh                             # git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/git clone https://github.com/zsh-users/zsh-autosuggestions


# Aliases
alias l=ls
alias ll="ls -l"
alias la="ls -a"
alias la="lla -aa"
alias h=history
alias cls=clear
alias venv="if [ -f "./.venv/bin/activate" ]; then source .venv/bin/activate; else echo 'Creating venv' && python -m venv .venv && source .venv/bin/activate; fi"
alias vexit=deactivate
alias py=python3
alias python=python3
alias tf=terraform
alias npm=pnpm
alias npx=pnpx
# alias start="nohup dolphin &"

function start() {
  if [ "$1" = "" ]; then
    nohup dolphin "$(pwd)" >/dev/null 2>&1 &
  else
    nohup dolphin $1 >/dev/null 2>&1 &
  fi
}


# Keybinds
#
# ESC
bindkey "\033" kill-whole-line
export KEYTIMEOUT=1   # So it reacts immediately to ESC

# Ctrl-delete
bindkey "^[[3;5~" backward-kill-word    # Can be bound explicitly in Konsole as \E[3;5~
bindkey "^H" backward-kill-word         # default for Konsole/xterm, though I don't undderstand how this isn't just backspace (no ctrl)

# Ctrl-left
bindkey "^[[1;5D" backward-word
# Ctrl-right
bindkey "^[[1;5C" forward-word




source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh                     # git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=blue'
# #66d9ef light blue
# #ae81ff purple
# #f92672 red
# #75715e grey
# #e6de74 yellow
# #a6e22e green





# Docker functions
function dsh() {
  if [ -z "$1" ]; then
    echo "Error: Container identifier is required"
    return 1
  fi

  local containerIdentifier="$1"
  local matchingContainers=($(docker container ls -q -f "id=$containerIdentifier"))

  echo "Found ${#matchingContainers[@]} containers matching '$containerIdentifier'"

  # TODO: If 0, use image name filter

  if [ ${#matchingContainers[@]} -eq 1 ]; then
    echo "Shelling into existing container"
    docker exec -it "$containerIdentifier" sh
  elif [ ${#matchingContainers[@]} -eq 0 ]; then
    echo "Booting new container"
    docker run -it --entrypoint "sh" "$containerIdentifier"
  else
    echo "Error: Ambiguous container reference - please be more specific"
    return 1
  fi
}

function dkill() {
  local containerIdentifier="$1"

  if [ -z "$containerIdentifier" ]; then
    echo "Error: Container identifier is required"
    return 1
  fi

  docker rm -f "$containerIdentifier"

  # echo "Stopping container...."
  # docker container stop "$containerIdentifier"

  # echo "Deleting container...."
  # docker container rm "$containerIdentifier"
}

alias dlogs="docker logs"
alias dlog=dlogs
alias dps="docker ps"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias drun="docker run"
alias dc="docker compose"
alias dprun="docker system prune"
alias dprune="docker system prune"

alias kc="kubectl"
