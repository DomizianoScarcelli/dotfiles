# Gruvbox Theme for zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: Gruvbox Theme
#
## General
### Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#928374' # Neutral gray
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b8bb26' # Gruvbox green
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[function]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[command]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#b8bb26,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fe8019,italic' # Gruvbox orange
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fe8019'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fe8019'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#d3869b' # Gruvbox purple
## Built-ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#b8bb26'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#fb4934' # Gruvbox red
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#83a598' # Gruvbox blue
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#fb4934'
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#fabd2f' # Gruvbox yellow
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#fabd2f'
