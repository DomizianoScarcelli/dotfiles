# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uses oh-my-posh prompt and theme
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/themes/gruvbox.json)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#Change colors for ls directories

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting git npm web-search)


source $ZSH/oh-my-zsh.sh

# ------------- Vim mode -------------
# source: https://unix.stackexchange.com/questions/433273/changing-cursor-style-based-on-mode-in-both-zsh-and-vim
# # vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -M viins '^[' vi-cmd-mode # Map Esc to vicmd in viins keymap
bindkey -M viins '^[^?' backward-kill-word # Replace '^[b' with your detected sequence
bindkey -M vicmd '^[' vi-cmd-mode # Avoid that esc puts me again in insert mode when in visual mode


# ------- FINISH ---------
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cafe="caffeinate -disu"
alias diskstats="smartctl -a disk0"
# Goes search directories into ~/Library and cd to them
iCloud="/Users/dov/Library/Mobile Documents/com~apple~CloudDocs/dovsync"
Desktop="/Users/dov/Desktop"
Downloads="/Users/dov/Downloads"
alias f='cd ~ && cd "$(fd . $iCloud $Desktop $Downloads --exclude node_modules --type directory  | fzf --tiebreak=length)"'
alias fz='cd ~ && z "$(fd . $iCloud $Desktop $Downloads --exclude node_modules --type directory  | fzf --tiebreak=length)"'
alias ft="f && tmux"
alias fn="f && nvim ."
alias vim="nvim"

# Pomodoro timer (source https://gist.github.com/bashbunni/f6b04fc4703903a71ce9f70c58345106)
alias pomodoro="~/.dotfiles/scripts/pomodoro.sh"

function sumtimes() {
    local total=0
    local op time_part h m s sec parts

    for arg in "$@"; do
        if [[ "$arg" =~ ^[+-] ]]; then
            op=${arg:0:1}        # Extract `+` or `-`
            time_part=${arg:1}    # Remove the operator from the time part
        else
            op="+"
            time_part=$arg
        fi

        # Split time_part into an array based on `:`
        parts=("${(@s.:.)time_part}")

        # Assign values based on the number of parts
        if (( ${#parts[@]} == 3 )); then
            h=${parts[1]}
            m=${parts[2]}
            s=${parts[3]}
        elif (( ${#parts[@]} == 2 )); then
            h=0
            m=${parts[1]}
            s=${parts[2]}
        else
            h=0
            m=0
            s=${parts[1]}
        fi

        # Convert to total seconds
        sec=$(( h * 3600 + m * 60 + s ))

        # Apply the operation explicitly
        if [[ "$op" == "+" ]]; then
            (( total += sec ))
        else
            (( total -= sec ))
        fi
    done

    # Convert back to HH:MM:SS format
    printf "%d:%02d:%02d\n" $((total/3600)) $(((total%3600)/60)) $((total%60))
}
# Yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dov/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dov/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dov/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dov/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"


eval $(thefuck --alias)

fpath=(~/.zsh.d/ $fpath)

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# source ~/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
# source ~/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/themes/gruvbox-zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#flutter
export PATH="$PATH:$HOME/flutter/bin"

eval "$(atuin init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

#java
# export JAVA_HOME="/opt/homebrew/opt/openjdk/bin/java"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# # export JAVA_HOME="/opt/homebrew/Cellar/openjdk/21.0.2/bin/java"
# export PATH=$JAVA_HOME/bin:$PATH
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/Users/dov/.spicetify
export PATH="/opt/homebrew/opt/poppler-qt5/bin:$PATH"

export DEFAULT_USER="dov"

# Zoxide
eval "$(zoxide init zsh)"
eval "$(lua /Users/dov/.config/z.lua/z.lua --init zsh)"


# Created by `pipx` on 2024-05-08 18:58:53
export PATH="$PATH:/Users/dov/.local/bin"

# # Start into Desktop dir
# cd ~/Desktop
#
# # Start into yazi
# y
