#!/usr/bin/env bash

f=README.adoc
rm -f "$f"
printf '= h\n' >> "$f"
printf ":a0: $(printf "%$((2 ** 18))s" | sed 's/ /a/g')\n" >> "$f"
i=0
n=${1:-10}
while [ $i -le $n ]; do
  printf ":a$(($i + 1)): {a$i}{a$i}\n" >> "$f"
  i=$(($i + 1))
done
printf "\n%$((2 ** 15))s" | sed "s/ /{a$i}/g" >> "$f"
exit
