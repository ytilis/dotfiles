# Common
pathadd /usr/local/sbin
pathadd /usr/local/bin
pathadd /usr/sbin
pathadd /usr/bin
pathadd /bin

# Local Bin
pathadd ~/.local/bin
pathadd ~/bin

# Rust
pathadd ~/.cargo/bin

# Add PyEnv bin to PATH for shims if it exists, and load pyenv
set -x PYENV_ROOT $HOME/.pyenv
pathadd $PYENV_ROOT/bin &&
  status --is-interactive &&
  pyenv init - | source

# Add RbEnv bin to PATH for shims if it exists, and load rbenv
set -x RBENV_ROOT $HOME/.rbenv
pathadd $RBENV_ROOT/bin &&
  status --is-interactive &&
  rbenv init - | source
