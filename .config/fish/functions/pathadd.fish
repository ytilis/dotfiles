function pathadd -a dir
  # We check it with contains to prevent duplicate additions
  if begin; test -d $dir && ! contains $dir $PATH; end;
    set -gx PATH $dir $PATH
    true
  else
    # We return true or false so we can optionally chain off this condition
    false
  end
end
