# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="norm"
# ZSH_THEME="jtriley"
ZSH_THEME="frisk"

MAILCHECK=0
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

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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

## aliases
alias :q="exit"
alias cc="clear && cargo check"
alias ct="clear && cargo test"
alias cr="clear && cargo run"
alias cb="clear && cargo build"
alias cl="clear && cargo clippy"
alias ca="clear && cargo watch -x check"
alias v="nvim"
alias vim="nvim"
alias a="php artisan"
alias pp="pnpm"
alias ci="composer install"
alias cupdate="composer update"
alias cdump="composer du"
alias crd="composer run dev"
alias crb="composer run build"
alias bu="brew update && brew upgrade"
alias bs="brew services"
alias bstart="brew services start"
alias bsre="brew services restart"
alias bstop="brew services stop"
alias gs="git status"
alias takeout="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --add-host=host.docker.internal:host-gateway -it tighten/takeout:latest"
alias amrf="php artisan migrate:refresh"
alias amr="php artisan migrate:reset"

## end aliases

#PATH VSCODE
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

#composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# go path
export PATH="$PATH:$HOME/go/bin"

# pnpm
export PNPM_HOME="/Users/veronez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# scripts tmux
PATH="$PATH":"$HOME/.local/scripts"
bindkey -s ^f "tmux-sessionizer\n"
# end scripts tmux

## functions ##

#git
function gpf() {
  git add . -p 
  mensagem=$(IFS=' '; echo "$*")
  if [ -z "$mensagem" ]; then
    mensagem="wip"
  fi
  git commit -m "$mensagem"
  current_branch=$(git branch --show-current)
  echo "\t\nFazendo push para o branch: $current_branch (force mode)\n\n"
  git push origin "$current_branch" -f -q
}

function gp() {
  git add . -p 
  mensagem=$(IFS=' '; echo "$*")
  if [ -z "$mensagem" ]; then
    mensagem="wip"
  fi
  git commit -m "$mensagem"
  current_branch=$(git branch --show-current)
  echo "\t\nFazendo push para o branch: $current_branch\n"
  git push origin "$current_branch" -q
}

function gpa() {
  git add .
  mensagem=$(IFS=' '; echo "$*")
  if [ -z "$mensagem" ]; then
    mensagem="wip"
  fi
  git commit -m "$mensagem"
  current_branch=$(git branch --show-current)
  echo "\t\nFazendo push para o branch: $current_branch\n"
  git push origin "$current_branch" -q
}

function gpp() {
  git add .
  mensagem=$(IFS=' '; echo "$*")
  if [ -z "$mensagem" ]; then
    mensagem="wip"
  fi
  current_branch=$(git branch --show-current)
  commit_msg="[$current_branch] $mensagem"
  git commit -m "$commit_msg"
  echo "\n=== Fazendo push para o branch: $current_branch ===\n"
  git push origin "$current_branch" -q
}
#end functions

# Enable history in IEX through Erlang(OTP)
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_dir '\"$HOME/.erlang_history\"'"
