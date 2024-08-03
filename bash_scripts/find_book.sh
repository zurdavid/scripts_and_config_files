#!/usr/bin/env sh

# checks if first parameter is a number
# if not exits
# param1 
function check_isnumber { 
  regexp="^[0-9]+$"
  if ! [[ $1 =~ $regexp ]]; then
     echo "Not a number. Bye" >&2 
     exit 1 
  fi
}

# checks if first parameter is in range [0, param2)
# parameter 1: number
# parameter 2: upper bound 
function check_inrange {
  if [ "$1" -lt 0 ] || [ "$1" -ge "$2" ]; then
    echo "Number out of range. Bye"
    exit 1
  fi
}

# build up the query: concatenate arguments with * 
query="*"
for w in "$@"; do
    query+="$w*"
done
i=0
# find files and save results to array
mapfile -t res < <(find -H ~/calibre -type f -iname "$query")

# print enumerated results 
echo "Results:"
for path in "${res[@]}"; do
    ((i++))
    IFS='/'; filename=($path)
    echo "$i) '${filename[-1]}'"
done

printf "\nOpen file number: (Abort with any illegal input)\n"
read number 
check_isnumber $number
# array indeces start with 0
((number--)) 
# array length
n="${#res[@]}"
check_inrange $number $n
# open file and supress output
xdg-open "${res[number]}" &>/dev/null 
