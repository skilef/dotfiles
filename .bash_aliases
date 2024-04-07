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
alias tmg="terramate generate"

## aws environments
alias mgmt="assume Captains-eye/AdministratorAccessV2"
alias dev="assume Development/AdministratorAccessV2"
alias prod="assume Production/AdministratorAccessV2"

## fixes
# fix ip forwarding problem
alias ipfix="sudo sysctl -w net.ipv4.ip_forward=1"

## ssh shortcuts
# gitlab runner
alias runner="ssh root@lab10dev.ships.development.captain-eye.net"


## project shortcuts

# alias infra="cd ~/workspace/Backend/captain-infra && mgmt && . ./helpers/env.sh"
# captain-agent
alias agent='cd ~/workspace/Backend/captain-agent && source $(poetry env info --path)/bin/activate'
# dotfiles directory
alias dotfiles="cd ~/workspace/dotfiles"
