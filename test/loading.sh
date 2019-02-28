#!/usr/bin/env bash

loading=0

show_spinner() {
    local -r delay='0.75'
    local spinstr='\|/-'
    local temp
    while [[ $loading == 1 ]]; do
        temp="${spinstr#?}"
        printf " [%c]  " "${spinstr}"
        spinstr=${temp}${spinstr%"${temp}"}
        sleep "${delay}"
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
