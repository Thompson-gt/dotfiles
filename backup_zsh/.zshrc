# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#STOP DELETING THIS GO LITERALLY NEEDS THIS TO RUN
export PATH="$PATH:/usr/local/go/bin"
#set the editors
export VISUAL=nvim;
export EDITOR=nvim;
#allow for custom ranger config
RANGER_LOAD_DEFAULT_RC=false;
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

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
#the browser used in web search is the systems default browser
plugins=(git zsh-autosuggestions web-search)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=50'
ZSH_WEB_SEARCH_ENGINES=(
music "https://open.spotify.com/"
twitch "https://www.twitch.tv/"
msearch "https://open.spotify.com/search/"
)
source $ZSH/oh-my-zsh.sh

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
#alias nvim='/usr/local/nvim/nvim'
#used to open image in browser
alias image='xdg-open'
alias show='kitty +kitten icat'
alias icat='kitty +kitten icat'
alias cdiff='kitty +kitten diff'
# need this so i can use sudo with aliases
alias sudo='sudo '
alias pac='pacman'
alias nv='nvim'
# so a new quote will be generated when clear is ran
alias clear='clear && getquote'
#custom functions to use as commands
getquote(){
   curl https://zenquotes.io/api/random -s | python3 -c "import json, sys; obj=json.load(sys.stdin); print('{}\n\t-{}'.format(obj[0]['q'],obj[0]['a']));"
}
lockfile(){
    sudo chown root "$1"
    sudo chmod go-rw "$1"
}
unlockfile(){
    sudo chown akuu "$1"
    sudo chmod ug+rw "$1"
}
lockdir(){
    sudo chown --recursive root "$1"
    sudo chmod --recursive go-rwx "$1"
}
#cannot recursivly add x to them or all files will become exacutables
unlockdir(){
    sudo chmod  ug+rwx "$1"
    sudo chown --recursive akuu "$1"
    sudo chmod --recursive ug+rw "$1"
}
#using the bluetoothctl tool to connect to my wireliess headphones (black sony ones)
connect_headphones(){
 bluetoothctl connect 90:7A:58:E7:B3:C2
}

#using the bluetoothctl tool to disconnect to my wireliess headphones (black sony ones)
disconnect_headphones(){
 bluetoothctl disconnect 90:7A:58:E7:B3:C2
}
#enable starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
#allow control backspace
bindkey '^H' backward-kill-word
#use control + space to accept zsh completion
bindkey '^ ' autosuggest-accept
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#command to display quote when every new terminal window is opened
curl https://zenquotes.io/api/random -s | python3 -c "import json, sys; obj=json.load(sys.stdin); print('{}\n\t-{}'.format(obj[0]['q'],obj[0]['a']));"

# will enable syntax highlighing for the commands in bash
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
