# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Pre-load .localrc for custom theme selection
[[ -f ~/.localrc ]] && . ~/.localrc
ZSH_THEME_SELECTED="$ZSH_THEME"

# Load oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=($plugins  capistrano git gem npm rails3 ruby rvm)


DISABLE_AUTO_UPDATE="true"
. ~/.oh-my-zsh/oh-my-zsh.sh

# Disable auto-correct
unsetopt correct_all

# Bash settings
. ~/.bash/aliases
. ~/.bash/paths
. ~/.bash/config

# Other zsh settings
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pushp0p"
#af-magic bira blinks
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
alias sublime="/opt/sublime-text/sublime_text &"
alias hrps="ps -eo size,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf(\"%13.2f Mb \",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf(\"%s \",$x) } print \"\" }'"
alias uthirst="cd ~/Projects/Ruby/uthirst/"
alias zombies="ps -el | grep 'Z'"
parl(){rake parallel:"$1":rerun\[8\];}
# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
function git_prompt_info() {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  }

  function touch_commit() {

git commit --amend -m "Touch"
git push origin

}
