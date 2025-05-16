CK3_DIR="/d/Games/SteamLibrary/steamapps/common/Crusader Kings III"
MODIFIED=$(find ./gui ./localization ! -type d)

if echo "$MODIFIED" | xargs -I {} cp "$CK3_DIR/game/{}" ./{}; then
    echo "Copied native files successfully!"
else
    echo "Failed to copy native files, check your CK3_DIR"
fi
