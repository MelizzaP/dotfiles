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
