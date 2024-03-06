alias vim="nvim"
alias vi="nvim"
alias pn="pnpm"
alias cat="bat"

alias assume="source /usr/local/bin/assume"
alias dev="assume Development/AdministratorAccessV2"
alias mgmt="assume Captains-eye/AdministratorAccessV2"
alias prod="assume Production/AdministratorAccessV2"
alias ipfix="sudo sysctl -w net.ipv4.ip_forward=1"
alias runner="ssh root@lab10dev.ships.development.captain-eye.net"

alias infra="cd ~/workspace/Backend/captain-infra && mgmt && . ./helpers/env.sh"
alias agent='cd ~/workspace/Backend/captain-agent && source $(poetry env info --path)/bin/activate'
