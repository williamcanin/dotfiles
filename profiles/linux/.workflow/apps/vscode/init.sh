#!/usr/bin/env sh

# Export manual command example:
# $ code --list-extensions | xargs -L 1 echo code --install-extension > ~/extensions.sh
# 
#

case $1 in
  install-extensions)
    sh $WORKFLOW_PATH/apps/vscode/extensions.txt
  ;;
  export-extensions)
  	if command -v code >/dev/null 2>&1; then
      code --list-extensions | xargs -L 1 echo code --install-extension > $WORKFLOW_PATH/apps/vscode/extensions.txt
    fi
  ;;
  *)
    echo "[vscode: init.sh] command not recognized"
    echo "Use: install-extensions | export-extensions"
  ;;  
esac
exit 0