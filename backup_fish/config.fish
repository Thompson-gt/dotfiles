set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

#function to get the previous used command
function __history_previous_command_start 
    commandline -t (string split " " $history[1])[1];
end

#function to get the last argument in the previous command
function __history_previous_command_last
    set input (string split " " $history[1]);
    set size (count $input);
    commandline -t $input[-1];
end

#custom functions to use as commands
function __getquote
    curl https://zenquotes.io/api/random -s | python3 -c "import json, sys; obj=json.load(sys.stdin); print('{}\n\t-{}'.format(obj[0]['q'],obj[0]['a']));"
end
#END OF FUNCIONS

#EXPORT VARIABLES
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux RANGER_LOAD_DEFAULT_RC false
set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml
 
#END EXPORT 

#ALIASES
alias image='xdg-open'
alias show='kitty +kitten icat'
alias icat='kitty +kitten icat'
alias cdiff='kitty +kitten diff'
# so a new quote will be generated when clear is ran
alias clear='clear && __getquote'
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
#END ALIASES

#ABRRIVATIONS
# need this so i can use sudo with aliases
abbr --add pac --position anywhere pacman 
abbr --add nv --position anywhere nvim 
#ABRRIVATIONS END

#KEYBINDS
# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
  bind -Minsert '@' __history_previous_command_start
  bind -Minsert '#' __history_given_number 
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
  bind '@' __history_previous_command_start
  bind '#' __history_previous_command_last
end

bind -m default -k nul 'accept-autosuggestion'
#END KEYBINDS


#EVAL CALLS
starship init fish | source && __getquote
#END OF EVALS



