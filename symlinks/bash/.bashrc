# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
	return;
fi

# Cabal
export PATH="$PATH:$HOME/.cabal/bin"

# Homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Make bash check its window size after a process completes
shopt -s checkwinsize

PS1='\u:\W$ '

export PATH="$HOME/bin:$PATH"
export EDITOR=vim

# Colors
export CLICOLOR=1
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GREP_OPTIONS='--color=auto'
export LSCOLORS=cxfxexexexegedabagcxcx

# History
export HISTCONTROL=erasedups,ignorespace
export HISTSIZE=1000
shopt -s histappend

# added by travis gem
[ -f /Users/msanders/.travis/travis.sh ] && source /Users/msanders/.travis/travis.sh

# Rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/opt/homebrew-cask/Caskroom/ghc/7.8.3-r1/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# added by travis gem
[ -f /Users/mks/.travis/travis.sh ] && source /Users/mks/.travis/travis.sh

# Add Postgres.app to PATH
export POSTGRES_DOT_APP="/Applications/Postgres.app"
if [ -d "$POSTGRES_DOT_APP" ]; then
    export PATH=$PATH:"$POSTGRES_DOT_APP/Contents/Versions/9.3/bin"
fi

# added by travis gem
[ -f /Users/yam/.travis/travis.sh ] && source /Users/yam/.travis/travis.sh
