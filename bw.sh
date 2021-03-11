#!/usr/bin/env bash

# Match the subdomain host and domain host, in decreasing specificity to find your password
domainPattern=".*@([[:alnum:]-]+\.([[:alnum:]-]*\.*[[:alnum:]-]+))':$"

# Get the prompt passed in
while read input
do
  # Match the regex to extract domains and subdomains
  if [[ $input =~ $domainPattern ]]; then
    # Loop through the matches, skipping the first one since that's the whole string
    for (( i = 1; i < ${#BASH_REMATCH[@]}; i++ )); do
      # echo "Domain: ${BASH_REMATCH[$i]}"

      # Search for the domain in BitWarden
      result=`bw list items --search "${BASH_REMATCH[$i]}" | jq -r '.[0].login.password'`

      if [ "$result" != "null" ]; then
        echo $result
        break
      fi
    done
  fi
done <<< "${1:-/dev/stdin}"
