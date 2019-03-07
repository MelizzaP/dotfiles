# Melissa's Dot Files

Provides an organized, version controlled, portable system configuration for *nix systems (including MacOS).  Notably, in includes shell customizations and aliases, custom VI commands and plugins, and the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) project.

## Installation

```
  git@github.com:MelizzaP/dotfiles.git
  cd dotfiles
  rake install
```

**Note:** if you already have some commands in .bashrc or .bash_profile you would like to keep, just place them in the file **~/.localrc**.

## Theme and Plugin Selection
To set a theme, set the name to the ZSH_THEME environment variable in the ~/.localrc file.  For example, add the following line:

```
    ZSH_THEME="agnoster"
```

The Dot Files enable many plugins by default, but to enable additional oh-my-zsh plugins, list them in the plugins environment variable in ~/.localrc.  For example:

```
    plugins=(django osx)
```

## Bash Aliases

### General

| Alias | Result | Example |
|-------|--------|---------|
| autoformat [filename] |  Removes whitespace and standardizes spacing | autoformat *.rb |
| autoformatall | Will autoformat all compatible files within a directory | |
| c [file in the $CODE_HOME directory (~/code by default)] | Jump to a folder in the $CODE_HOME directory with tab completion | c do[tab] -> c dotfiles
| h [file in the home directory] | Jump to a folder in the home directory with tab completion | h Mu[tab] -> h Music
| kill-port | kill the process on port n | kill-port 3000 |
| open . |  Open current folder in file browser | |
| replace [files] [find text] [replace text] | Performs a find/replace across multiple files | replace "*.erb" "<b>" "<strong>" |
| reload | Reload all bash files | |

### Git

Git gets tab completion, colored branch data at the prompt, as well as the following commands.

| Alias | Command |
|-------|---------|
| brclean | Remove all *local* branches that have been merged |
| conflicts | list merge conflicts |
| force-push | git push --force-with-lease |
| ga | git add |
| gb | git branch |
| gba -or- git-branch-authors | List the authors of all git branches |
| gbc -or- gbclean | Remove all *local and remote* merged branches |
| gbg | git branch grep |
| gco -or- git co | git checkout |
| gd | git diff |
| gdc | git diff --cached |
| git autoformat | Installs a git hook to autoformat all files during commit |
| git lg | Detailed log view, including authors and branch history |
| git pup | Install and initialize all git submodules to version in tree |
| git rb [remote branch name] | checkout and track a remote branch |
| git su | Submodule update: update all submodules to recent version |
| git-recent | show git branches organized by date |
| git-remote-branches | git remote branches grep |
| gg -or- git g | git grep (with line breaks for clearer output) |
| gl | git pull |
| gm | git commit -m |
| gma | git commit -amend |
| gs -or- git st | git status |
| gst | git stash |
| rbrclean | Remove all *remote* branches that have been merged |
| shit-nevermind | git merge --abort |

### Rails
| Alias | Command |
|-------|---------|
| log | tail the development log |
| tlog | tail the test log |
| rs | rails server |
| rc | rails console |
| rg | rails generate |
| rst | restart server (touch tmp/restart.txt) |

## VI Aliases

Note: many of the VI commands will require the installation of **gvim** on Linux machines, or **mvim** on MacOS machines.

| Command | Result |
|---------|--------|
| ; | Open fuzzy finder |
| :A | Switch between test files and implementation file |
| \ == | Autoformat entire file, fixing indentation and spacing |
| \be | Open Buffer Explorer, a list of recently opened files |
| \ff | Open CtrlP, an excellent way to quickly open files |
| \fl | Format a line into multiple lines |
| \g | go to the module of the variable under the curor |
| \i | Import the any missing module, remove unsused modules |
| \j | Import the module for the word under the cursor |
| \nt | Open Nerd Tree, a tree-style directory browser |
| \uc | Comment/Uncomment lines |
| \ws | Remove all trailing whitespace from file |
| ctrl+k, ctrl+j | Toggle ale errors |
| ctrl+p | Autocomplete |
| ctrl+x, ctrl-c, ctrl-v | Cut, copy, and paste now work in Linux VI |
| start ty[tab] -> start typing | Autocomplete is enabled via the YouCompleteMe plugin |

## Credits

This project is a fork of a fork of a fork. Thanks to the group that created this.
