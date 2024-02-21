function ls --wraps='exa -1 -F --color=always --color-scale --icons -a -l' --description 'alias ls exa -1 -F --color=always --color-scale --icons -a -l'
  exa -1 -F --color=always --color-scale --icons -a -l $argv
        
end
