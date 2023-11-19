alias l = ls
alias la = ls -a
alias ll = ls -l
alias lla = ls -la
def lg [] { ls | grid -c }

def ox [f] { open $f | explore }

alias gd = git diff
alias gl = git log
alias glp = git log -p

alias "config env-local" = run-external $env.EDITOR ($nu.env-path | str replace -r '.nu$' '-local.nu')
