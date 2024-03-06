## commands
alias vim="nvim"
alias vi="nvim"
alias pn="pnpm"
alias cat="bat"
alias assume="source /usr/local/bin/assume"

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
# captain-infra
alias infra="cd ~/workspace/Backend/captain-infra && mgmt && . ./helpers/env.sh"
# captain-agent
alias agent='cd ~/workspace/Backend/captain-agent && source $(poetry env info --path)/bin/activate'
# dotfiles directory
alias dotfiles="cd ~/workspace/dotfiles"
