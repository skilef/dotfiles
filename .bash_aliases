## commands

# NeoVim
alias vim="nvim"
alias vi="nvim"

# Tool replacements
alias cat="bat"
alias top="btop"
alias ls="exa"
alias dig="dog"
alias find="fdfind"
alias df="duf"

# Shortcuts
alias pn="pnpm"
alias c="clear"

# Granted
alias assume="source /usr/local/bin/assume"

# terraform shortcuts
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias cctx="curl -sL https://raw.githubusercontent.com/cloudposse/terraform-null-label/master/exports/context.tf -o context.tf"

## aws environments
alias mgmt="assume Captains-eye/AdministratorAccessV2"
alias dev="assume Development/AdministratorAccessV2"
alias prod="assume Production/AdministratorAccessV2"
alias fin="assume Finance/AdministratorAccessV2"
alias ai="assume AI/AdministratorAccess"

## fixes
# fix ip forwarding problem
alias ipfix="sudo sysctl -w net.ipv4.ip_forward=1"

## ssh shortcuts
# gitlab runner
alias runner="ssh root@172.22.129.145"

## Tmux shortcuts
alias tkill="tmux kill-session"

## project shortcuts

alias infra="cd ~/workspace/Backend/captain-infra && mgmt && . ./helpers/env.sh"
# captain-agent
alias agent='cd ~/workspace/Backend/captain-agent && source $(poetry env info --path)/bin/activate'
# dotfiles directory
alias dotfiles="cd ~/workspace/dotfiles"
