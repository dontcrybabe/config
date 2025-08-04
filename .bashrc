force_color_prompt=yes

HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

. "$HOME/clang_build.sh" || true
. "$HOME/.cargo/env" || true

export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-Dark

#export QT_QPA_PLATFORM="wayland;xcb"
#export ENABLE_HDR_WSI=1

export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.defaultlaf=com.sun.java.swing.plaf.motif.MotifLookAndFeel -Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true";

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock


# Colors
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLORS='1;32'
export CLICOLOR=1

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '



alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

alias ls="lsd"
alias ls='ls --color=auto'
alias ll="ls -a -l"
alias pp="poweroff"

alias mysudo='sudo -E env "PATH=$PATH"'
alias paf='printf "$PWD/%s\n" $1'

alias ..="cd .."
alias hh="cd ~"

alias br="cargo build --release && cargo run --release"
