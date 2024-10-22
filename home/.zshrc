setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ENV vars
export PNPM_HOME="$HOME/.local/share/pnpm"
export NX_NO_CLOUD=true
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export JAVA_HOME="/usr/lib/jvm/jdk-22.0.2-oracle-x64"
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven

# PATH modification
export PATH="${M2_HOME}/bin:${PATH}"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"

############### Aliases ################

## commands

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# NeoVim
alias vim="nvim"
alias vi="nvim"

# Tool replacements
# alias cat="bat"
# alias top="btop"
# alias ls="exa"
# alias dig="dog"
# alias find="fdfind"
# alias df="duf"

# Shortcuts
alias pn="pnpm"
alias cl="clear"

# Granted
alias assume="source /usr/local/bin/assume"

# terraform shortcuts
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

# generate Cloud-Posse context.tf file
alias cctx="curl -sL https://raw.githubusercontent.com/cloudposse/terraform-null-label/master/exports/context.tf -o context.tf"

## assume aws environments
alias mgmt="assume Captains-eye/AdministratorAccess"
alias dev="assume Development/AdministratorAccess"
alias prod="assume Production/AdministratorAccess"
alias fin="assume Finance/AdministratorAccess"
alias ai="assume AI/AdministratorAccess"

## fixes
# fix ip forwarding problem
alias ipfix="sudo sysctl -w net.ipv4.ip_forward=1"

## ssh shortcuts
# gitlab runner
alias runner="ssh root@172.22.129.145"

## Tmux shortcuts
alias tkill="tmux kill-session"

# dotfiles directory
alias dotfiles="cd ~/workspace/dotfiles"

############################################

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "$HOME/.cargo/env"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export LANG=en_US.UTF-8

# Fuzzy finder
source <(fzf --zsh)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)
