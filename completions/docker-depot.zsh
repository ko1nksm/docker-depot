_docker-depot() {
  compadd -- $(docker-depot completions ${words[2, $CURRENT-1]})
}

compdef _docker-depot docker-depot
