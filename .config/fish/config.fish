source ~/.config/fish/lang.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/paths.fish
source ~/.config/fish/functions/cl.fish
source ~/.config/fish/functions/setenv.fish
source ~/.config/fish/functions/sourceIf.fish
source ~/.config/fish/functions/sshuttle.fish

# Set GPG TTY
set -x GPG_TTY (tty)

# Fisher init
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# Cross-shell env vars
sourceIf ~/.config/.env
sourceIf ~/.config/.env.local

# Starship init
starship init fish | source
