
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Aliases
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim' 
alias ovi='/usr/local/bin/vim'
alias gitadd='git add'
alias gitcom='git commit -m '
alias gitpush='git push origin master'
alias gitpull='git pull origin master'
alias gitlog='git log'
alias gits='git status'

export PS1="\[\033[36m\]me\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'


