# Go bin path
export PATH="$HOME/go/bin:$PATH"

# Disable NX cloud on my local machine
export NX_NO_CLOUD=true

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias pn=pnpm

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# Terramate
complete -C $HOME/go/bin/terramate terramate

alias assume="source /usr/local/bin/assume"
alias dev="assume Development/AdministratorAccessV2"
alias mgmt="assume Captains-eye/AdministratorAccessV2"
alias prod="assume Production/AdministratorAccessV2"
alias ipfix="sudo sysctl -w net.ipv4.ip_forward=1"
alias runner="ssh root@lab10dev.ships.development.captain-eye.net"

alias infra="cd ~/workspace/Backend/captain-infra && mgmt && . ./helpers/env.sh"
alias agent='cd ~/workspace/Backend/captain-agent && source $(poetry env info --path)/bin/activate'
