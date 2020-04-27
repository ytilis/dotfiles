function pathadd -a dir
  if test -d $dir
    # We check it with contains to prevent duplicate additions
    contains $dir $PATH || set -gx PATH $dir $PATH
    true
  else
    # We return true or false so we can optionally chain off this condition
    false
  end 
end
