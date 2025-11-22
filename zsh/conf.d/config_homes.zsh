export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GIT_CONFIG_GLOBAL="$HOME/.config/git/config"
export CABAL_DIR="$HOME/.config/cabal"
export CARGO_HOME="$HOME/.config/cargo"

# Used xdg-ninja to create these exports

# ghcup
export GHCUP_HOME="$XDG_DATA_HOME/ghcup"
# Source ghcup
[ -f "$GHCUP_HOME/env" ] && . "$GHCUP_HOME/env" # ghcup-env

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# maven
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"

# npm
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm

# openjdk
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# openjfk
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java -Djavafx.cachedir=${XDG_CACHE_HOME}/openjfx"

# stack
export STACK_ROOT="$XDG_DATA_HOME"/stack
export STACK_XDG=1

# texmf
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var

# wget
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# nvm
export NVM_DIR="$XDG_DATA_HOME"/nvm
