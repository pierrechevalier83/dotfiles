# Prereq:
#   sudo pacman -S zsh-theme-powerlevel9k zsh-syntax-highlighting zsh-autosuggestions fzf ttf-nerd-fonts-symbols

# Fancying-up the prompt
export TERM="xterm-256color"
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Enable syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy finder
export FZF_DEFAULT_OPTS='--height 20% --reverse --border'
source /usr/share/fzf/key-bindings.zsh

# Enable completions
autoload -Uz compinit
compinit

# Persistent history
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=10000              #Number of history entries to save to disk
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Aliases
alias ls=exa
alias vim=nvim
alias build="cargo fmt && cargo build && cargo clippy"

export EDITOR=nvim
export VISUAL=nvim

# Rust specific config
export LD_LIBRARY_PATH=/usr/local/lib
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
