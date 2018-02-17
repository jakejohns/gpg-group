#!/bin/bash

_gpg-group()
{
    local cur prev opts groups
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="groups show edit new help"

    case "${prev}" in
        show|edit)
            local -r groups=$(gpg-group groups)
            COMPREPLY=( "$(compgen -W "${groups}" -- "${cur}")" )
            return 0
            ;;
        create|new|help|groups)
            return 0
            ;;
        *)
        ;;
    esac

    mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
   return 0
}


complete -F _gpg-group gpg-group

