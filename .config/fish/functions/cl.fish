function cl --argument-names dir --description "cd followed by ls"
  # if no DIR given, go home
  if not test -n "$dir"
    set dir ~
  end

  cd "$dir" && ls -la
end
