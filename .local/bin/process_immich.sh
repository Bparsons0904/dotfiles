#!/bin/bash

# ==============================================================================
# CONFIGURATION
# ==============================================================================
DEST_DIR="/home/bobparsons/Videos/obs"
TEMP_DIR="./temp_ingest_processing"

# ==============================================================================
# 1. INPUT CHECK
# ==============================================================================
if [ -z "$1" ]; then
  echo "❌ Error: Missing input file."
  echo "Usage: ./process_immich.sh <path_to_zip_file>"
  exit 1
fi

ZIP_FILE="$1"

if [ ! -f "$ZIP_FILE" ]; then
  echo "❌ Error: File '$ZIP_FILE' not found."
  exit 1
fi

echo "📦 Starting Ingest Process..."
echo "--------------------------------------------------"

# ==============================================================================
# 2. SETUP & UNZIP
# ==============================================================================
mkdir -p "$DEST_DIR"
mkdir -p "$TEMP_DIR"

echo "📂 Unzipping to temporary workspace..."
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"

# ==============================================================================
# 3. PROCESS VIDEO (GPU Decoded -> CPU Encoded DNxHR)
# ==============================================================================
echo "🎬 Processing Video Files..."

find "$TEMP_DIR" -type f -iname "*.mp4" | while read -r file; do
  filename=$(basename -- "$file")
  basename="${filename%.*}"

  output_path="$DEST_DIR/${basename}_edit.mov"

  echo "   Running: $filename -> ${basename}_edit.mov"

  # -hwaccel cuda    : GPU reads the file
  # -threads 0       : CPU uses all cores to write the DNxHR file

  ffmpeg -nostdin -n -v error -stats \
    -hwaccel cuda \
    -i "$file" \
    -threads 0 \
    -c:v dnxhd -profile:v dnxhr_hqx -pix_fmt yuv422p10le \
    -c:a pcm_s24le \
    -f mov \
    "$output_path"

done

# ==============================================================================
# 4. PROCESS IMAGES
# ==============================================================================
echo "🖼️  Moving Image Files..."

find "$TEMP_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r img; do
  echo "   Moving: $(basename -- "$img")"
  mv -n "$img" "$DEST_DIR/"
done

# ==============================================================================
# 5. CLEANUP
# ==============================================================================
echo "🧹 Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo "--------------------------------------------------"
echo "✅ Ingest Complete!"
echo "📂 Files are ready in: $DEST_DIR"
