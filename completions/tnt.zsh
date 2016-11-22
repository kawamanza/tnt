if [[ ! -o interactive ]]; then
    return
fi

compctl -K _tnt tnt

_tnt() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(tnt commands)"
  else
    completions="$(tnt completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
