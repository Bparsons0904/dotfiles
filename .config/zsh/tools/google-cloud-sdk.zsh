# Google Cloud SDK configuration - path and completion
GCLOUD_PATH="$HOME/Developer/tools/google-cloud-sdk"
if [ -d "$GCLOUD_PATH" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  [ -f "$GCLOUD_PATH/path.zsh.inc" ] && source "$GCLOUD_PATH/path.zsh.inc"
  
  # The next line enables shell command completion for gcloud.
  [ -f "$GCLOUD_PATH/completion.zsh.inc" ] && source "$GCLOUD_PATH/completion.zsh.inc"
fi
