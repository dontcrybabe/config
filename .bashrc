force_color_prompt=yes

HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

. "$HOME/clang_build.sh" || true
. "$HOME/.cargo/env" || true
#. "$HOME/.bash_profile" || true
export PATH=~/bin:$PATH


export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-Dark

#export QT_QPA_PLATFORM="wayland;xcb"
#export ENABLE_HDR_WSI=1

export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.defaultlaf=com.sun.java.swing.plaf.motif.MotifLookAndFeel -Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true";

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock


# Colors
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

export TERM=xterm
export GREP_OPTIONS='--color=auto' GREP_COLORS='1;32'
export CLICOLOR=1

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

git_prompt() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch=$(git branch --show-current 2>/dev/null || echo "HEAD")
    local current_commit=$(git rev-parse --short HEAD 2>/dev/null)
    local local_head=$(git log -1 --pretty=%h 2>/dev/null)
    local commit_display="$current_commit"

    # Check if current commit is local HEAD
    if [ "$current_commit" = "$local_head" ]; then
      commit_display="HEAD"
    else
      # Check for remote tracking branch
      local remote_branch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
      if [ -n "$remote_branch" ]; then
        local remote_head=$(git rev-parse --short "$remote_branch" 2>/dev/null)
        if [ "$current_commit" = "$remote_head" ]; then
          commit_display="remote HEAD"
        fi
      fi
    fi
     GIT_PROMPT="─[\[\e[1;33m\]${branch}\[\e[1;32m\]]|[\[\e[1;33m\]${commit_display}\[\e[1;32m\]]"
  else
    GIT_PROMPT="────────────"
  fi
}
# Ensure git_prompt is called before each prompt
PROMPT_COMMAND='git_prompt; PS1="\[\e[1;32m\]\[\e[22m\]╭──(\[\e[1;36m\]\u\[\e[1;31m\]@\[\e[1;34m\]\h\[\e[1;32m\])-[\[\e[1;35m\]\w\[\e[1;32m\]]\n\[\e[1;32m\]\[\e[22m\]╰─${GIT_PROMPT}\[\e[1;31m\]\$\[\e[0m\] "'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

alias ls="lsd"
alias ls='ls --color=auto'
alias ll="lsd -a -l"
alias pp="poweroff"

alias mysudo='sudo -E env "PATH=$PATH"'
alias paf='printf "$PWD/%s\n" $1'

alias ..="cd .."
alias hh="cd ~"

alias br="cargo build --release && cargo run --release"
