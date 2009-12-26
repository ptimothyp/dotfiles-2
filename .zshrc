PATH=$HOME/bin:$PATH
PS1="%2c$PR_NO_COLOR%(!.#.$) " # Nice, unobtrusive prompt
fpath=($HOME/.zsh-functions $fpath) # Load my completion functions
export EDITOR=vim # :)

# -- Intelligent completion --
autoload -Uz compinit; compinit
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/michael/.zshrc'

setopt AUTOCD # Automatically cd if command is directory name.
setopt NOMATCH # If glob shows no matches, tell me.
setopt INTERACTIVECOMMENTS # Allow comments like this in shell.
setopt MENU_COMPLETE # Display menu for ambiguous completions.
setopt BEEP # Beep.

unsetopt LIST_BEEP # Don't beep when listing a menu.
unsetopt CASE_GLOB # Ignore case in completions.
unsetopt EXTENDED_GLOB # Do not treat #, ^ and ~ as parts of patterns.

# Fix escape sequence for screen so that it adds the name of the current
# process to the title.
if [[ ${TERM} == screen ]]; then
	precmd() { print -Pn "\033k\033\134\033k\033\134" }
	PATH=$HOME/bin:$PATH
fi

# -- Colors! --
CLICOLOR=1
LANG=C # Make grep faster
GREP_OPTIONS='--color=auto'
LSCOLORS=cxfxexexexegedabagcxcx

# -- History --
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000 # Lines to save in memory
SAVEHIST=2000 # Lines to save on disk

# Append to history on-the-fly (not just on exit).
setopt APPENDHISTORY INC_APPEND_HISTORY

# Ignore duplicates in history, damnit!
setopt HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS

# Don't log commands beginning with a space.
setopt HIST_IGNORE_SPACE

# -- Keybindings --

# Enable vi mode.
bindkey -v

# Add some convenient emacs-like shortcuts too.
bindkey "" beginning-of-line
bindkey "" end-of-line
bindkey "" backward-char
bindkey "" forward-char
bindkey "" backward-word
bindkey "" forward-word
bindkey "" kill-line

bindkey '^[[Z' reverse-menu-complete # Shift-tab to go back an item in menu.
bindkey " " magic-space # Expand variables such as !$ when space is pressed.

# Search history using  & .
bindkey "" history-beginning-search-backward
bindkey "" history-beginning-search-forward

# Press v in vi mode to edit line in $EDITOR.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Load my aliases.
if [[ -f $HOME/.aliases ]]; then
	source $HOME/.aliases
fi