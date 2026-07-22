#!/usr/bin/env sh

# Install plugins via console
if command -v vim >/dev/null 2>&1; then
  vim +PlugInstall +qall
fi
