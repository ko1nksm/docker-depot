_docker-depot() {
  local cur
  _get_comp_words_by_ref -n : cur

  COMPREPLY=( $( compgen -W "$(docker-depot completions ${COMP_WORDS[@]:1:$COMP_CWORD-1})" -- "$cur") )

  __ltrim_colon_completions "$cur"
}

complete -F _docker-depot docker-depot
