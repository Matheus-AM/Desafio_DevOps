#!/bin/bash
echo -e "\e[32mReplace Tokens\e[33m"
echo ""
# Extrair os tokens do tipo #{variavel}#
tokens=$(grep -oP '#\{\K[^}]+(?=\}#)' $1 | sort -u)

# Para cada token, verificar se a variável de ambiente existe
for token in $tokens; do
  if printenv "$token" >/dev/null; then
    temppp=${!token}
    sed -i "s|#{$token}#|${!token}|g" $1
    echo "$token='${!token}'"
  else
    echo "$token não está definida no ambiente"
  fi
done
# cat $1
echo -e "\e[0m"
