# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
[[ ":$PATH:" != *"$HOME/bin"* ]] && PATH="$HOME/bin:${PATH}"
[[ ":$PATH:" != *"$HOME/go/bin"* ]] && PATH="$HOME/go/bin:${PATH}"
[[ ":$PATH:" != *"$HOME/.config/composer/vendor/bin"* ]] && PATH="$HOME/.config/composer/vendor/bin:${PATH}"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Add FZF keybindings
source /usr/share/fzf/shell/key-bindings.bash
# Use ripgrep for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XKB_DEFAULT_LAYOUT='gb'
