# Check if linuxbrew exists and add to PATH if needed
if command -v linuxbrew > /dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
