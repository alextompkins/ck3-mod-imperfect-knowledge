CK3_DIR="/d/Games/SteamLibrary/steamapps/common/Crusader Kings III"

# Update this var whenever we change files from another directory
CHANGED_DIRS=(
  "./gui"
  "./localization"
)

# Checkout all modified files from master
printf "%s\n" "${CHANGED_DIRS[@]}" | xargs -I {} git checkout master -- '{}/*'
MODIFIED=$(find "${CHANGED_DIRS[@]}" ! -type d)

# Copy the corresponding versions from the actual game files
if echo "$MODIFIED" | xargs -I {} cp "$CK3_DIR/game/{}" ./{}; then
    echo "Copied native files successfully!"
else
    echo "Failed to copy native files, check your CK3_DIR"
fi
