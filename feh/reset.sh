# Drectory containing the JPG files
WALLPAPERS_DIR="./wallpapers"

if [[ ! -d "$WALLPAPERS_DIR" ]]; then
    echo "Directory $WALLPAPERS_DIR does not exist."
    exit 1
fi

# Initialize a counter
counter=1

# Loop through all JPG files in the directory
for file in "$WALLPAPERS_DIR"/*.jpg; 
do
  if [[ -f "$file" ]]; then
    dir=$(dirname "$file")
    new_name="$counter.jpg"

    mv "$file" "$dir/$new_name"

    counter=$((counter + 1))
  fi
done

echo "Renaming completed. $((counter - 1)) files renamed."
