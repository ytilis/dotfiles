function bwlogin --description "Bitwarden Login Shortcut"
  setenv BW_SESSION (bw login --raw)
end
