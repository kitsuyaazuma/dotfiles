# Inspired by https://github.com/jonmosco/kube-ps1
function kubeon() {
  export STARSHIP_KUBE=1
}

function kubeoff() {
  unset STARSHIP_KUBE
}
