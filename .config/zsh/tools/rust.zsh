# Check if cargo exists and add to PATH if needed
if command -v cargo > /dev/null; then
    # Only add to PATH if it's not already there
    if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
        export PATH="$PATH:$HOME/.cargo/bin"
    fi
fi
