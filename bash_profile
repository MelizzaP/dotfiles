if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
