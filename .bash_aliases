alias gpl='git pull origin master'
alias gps='git push origin'
alias gst='git status'
alias gco='git checkout'
alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'
alias apt-up='sudo apt-get update && apt-get upgrade'
alias ..='cd ..'

# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

alias cd='cdls'
