##
# Autoload
##
autoload -Uz compinit colors vcs_info
compinit
colors

##
# Plugins
##
source $HOME/.homesick/repos/zgen/zgen.zsh
if ! zgen saved; then
  echo "Creating zgen save ..."

  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/composer
  zgen oh-my-zsh plugins/fabric
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/docker

  zgen load StackExchange/blackbox
  zgen load zsh-users/zsh-syntax-highlighting

  zgen oh-my-zsh themes/agnoster

  zgen save
fi

# redefine prompt_context for hiding user@hostname
prompt_context () { }

##
# Key Bindings
##
#bindkey -v                                # vim keybindings
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[3~'   delete-char             # Del
bindkey '^[[H'    beginning-of-line       # Pos1
bindkey '^[[F'    end-of-line             # End
bindkey '^R' history-incremental-search-backward

##
# Completion
##
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

# setopt menucomplete # show completion on first tab

##
# History
##
HISTFILE=~/.histfile            # where to store zsh config
HISTSIZE=1000                   # Should be enough
SAVEHIST=1000                   # Should be enough
setopt hist_ignore_all_dups     # no duplicate
setopt append_history           # append
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions

##
# Aliases
##
if [ -f "${HOME}/.aliases" ]; then
  source "${HOME}/.aliases"
fi

##
# Homeshick
##
source $HOME/.homesick/repos/homeshick/homeshick.sh
homeshick refresh -q -b 1

##
# exports
##
export EDITOR=vim
export GREP_OPTIONS='--exclude-dir=.svn --exclude-dir=.git --color=auto'
