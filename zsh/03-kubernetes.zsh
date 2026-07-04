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
