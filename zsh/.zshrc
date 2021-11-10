export TERM="xterm-256color"

# sudo yay -Ss zsh-theme-powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

bindkey -e
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
# ctrl-Left, ctrl-Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# alt-Left, alt-Right
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word


# Enable syntax highlighting and autosuggestions
# sudo pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# sudo pacman -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy finder
export FZF_DEFAULT_OPTS='--height 20% --reverse --border'

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
# cargo install exa
alias ls=exa
# cargo install bat
alias cat=bat
# cargo install ripgrep
alias grep=rg

# sudo pacman -S neovim
alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim

# Rust specific config
export LD_LIBRARY_PATH=/usr/local/lib
export PATH=$PATH:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:/usr/local/bin

