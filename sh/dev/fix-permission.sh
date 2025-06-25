#!/bin/bash
SOURCE="${BASH_SOURCE[2]:-${BASH_SOURCE[0]}}"
#!/bin/bash

LARAVEL_PATH="$( cd "$( dirname "$SOURCE" )/../../blog" && pwd)"


OS_TYPE="$(uname -s)"

echo "📂 Laravel path detected: $LARAVEL_PATH"
echo "🖥️ Detected OS: $OS_TYPE"

if [[ "$OS_TYPE" == "Linux" || "$OS_TYPE" == "Darwin" ]]; then
  # Linux/macOS
  MY_UID=${UID:-$(id -u)}
  MY_GID=${GID:-$(id -g)}

  echo "🔐 Changing ownership to UID=$MY_UID and GID=$MY_GID"
  sudo chown -R "$MY_UID:$MY_GID" \
    "$LARAVEL_PATH/storage" \
    "$LARAVEL_PATH/bootstrap/cache" \
    "$LARAVEL_PATH/database"

  echo "🔧 Setting read/write permissions for user & group"
  chmod -R ug+rw \
    "$LARAVEL_PATH/storage" \
    "$LARAVEL_PATH/bootstrap/cache" \
    "$LARAVEL_PATH/database"

elif [[ "$OS_TYPE" == *"MINGW"* || "$OS_TYPE" == *"MSYS"* || "$OS_TYPE" == *"CYGWIN"* ]]; then
  echo "🪟 Running on Windows Git Bash - skipping chown"
  chmod -R ug+rw \
    "$LARAVEL_PATH/storage" \
    "$LARAVEL_PATH/bootstrap/cache" \
    "$LARAVEL_PATH/database"
else
  echo "⚠️ Unknown OS type: $OS_TYPE. Skipping permission changes."
fi

echo "✅ Permission fix done."