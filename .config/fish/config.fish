source ~/.config/fish/paths.fish

# Set language to en_US
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
set -xg LANGUAGE en_US.UTF-8
set -xg LC_CTYPE "en_US.UTF-8"
set -xg LC_MESSAGES "en_US.UTF-8"
set -xg LC_COLLATE C

# Fisher init
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# Add PyEnv bin to PATH to access its shim if it exists, and load pyenv and virtualenv-init, etc
set -x PYENV_ROOT $HOME/.pyenv
pathadd $PYENV_ROOT/bin && 
  status --is-interactive && 
  pyenv init - | source

# Add RbEnv root to PATH to access its shims if it exists
set -x RBENV_ROOT $HOME/.rbenv
pathadd $RBENV_ROOT/bin
  
    
# Starship init
starship init fish | source
