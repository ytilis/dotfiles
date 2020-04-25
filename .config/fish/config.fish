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

# Add PyEnv, if available
if test -d "$HOME/.pyenv"
  # set where pyenv is installed
  set -x PYENV_ROOT $HOME/.pyenv

  # Add pyenv root to PATH to access its shims
  pathadd $PYENV_ROOT/bin

  # load pyenv and virtualenv-init, etc
  status --is-interactive; and pyenv init - | source
end

# Add RbEnv, if available
if test -d "$HOME/.rbenv"
  # set where rbenv is installed
  set -x RBENV_ROOT $HOME/.rbenv

  # Add rbenv root to PATH to access its shims
  pathadd $RBENV_ROOT/bin
end

# Starship init
starship init fish | source
