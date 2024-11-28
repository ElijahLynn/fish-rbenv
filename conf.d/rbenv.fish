# add homebrew to path
if test -d "/opt/homebrew/bin"
    fish_add_path "/opt/homebrew/bin"
end

if not command -s rbenv > /dev/null
    echo "rbenv: command not found. See https://github.com/rbenv/rbenv"
    exit 1
end

set -l rbenv_root ''
if test -z "$RBENV_ROOT"
    set rbenv_root "$HOME/.rbenv"
    set -x RBENV_ROOT "$HOME/.rbenv"
else
    set rbenv_root "$RBENV_ROOT"
end

fish_add_path $rbenv_root/shims
set -x RBENV_SHELL fish
if test ! -d "$rbenv_root/shims"; or test ! -d "$rbenv_root/versions"
    command mkdir -p $rbenv_root/{shims,versions}
end
