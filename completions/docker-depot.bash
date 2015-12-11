_docker-depot() {
  local fallback=""
  type _get_comp_words_by_ref >/dev/null 2>&1 || fallback=1
  type __ltrim_colon_completions >/dev/null 2>&1 || fallback=1

  local cur
  local line=${COMP_WORDS[@]:1:$COMP_CWORD-1}

  if [[ $fallback ]]; then
    cur=${COMP_WORDS[$COMP_CWORD]}
    COMPREPLY=( $( compgen -W "$(docker-depot completions $line)" -- "$cur") )
  else
    _get_comp_words_by_ref -n : cur
    COMPREPLY=( $( compgen -W "$(docker-depot completions $line)" -- "$cur") )
    __ltrim_colon_completions "$cur"
  fi
}

complete -F _docker-depot docker-depot
