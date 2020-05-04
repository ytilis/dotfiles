source ~/.config/fish/lang.fish
source ~/.config/fish/paths.fish
source ~/.config/fish/sshuttle.fish

# Fisher init
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# Starship init
starship init fish | source
