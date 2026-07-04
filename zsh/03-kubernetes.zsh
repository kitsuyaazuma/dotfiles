# Inspired by https://github.com/jonmosco/kube-ps1
function kubeon() {
  export STARSHIP_KUBE=1
}

function kubeoff() {
  unset STARSHIP_KUBE
}

# https://kubecolor.github.io/
if command -v kubecolor >/dev/null 2>&1; then
  alias kubectl='kubecolor'
fi

# https://k9scli.io/
if command -v k9s >/dev/null 2>&1; then
  alias k9s='LANG=en_US.UTF-8 k9s'
fi
