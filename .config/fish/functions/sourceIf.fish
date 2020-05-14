function sourceIf --argument-names file --description "Source file if it exists"
  if test -f "$file"
    source "$file"
  end
end
