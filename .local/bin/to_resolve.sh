#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Error: Input file missing."
  echo "Usage: ./convert_resolve.sh <input_file> [output_name]"
  exit 1
fi

INPUT_FILE="$1"

# LOGIC: Determine Output Filename
if [ -z "$2" ]; then
  OUTPUT_FILE="${INPUT_FILE%.*}_edit.mov"
else
  if [[ "$2" == *.mov ]]; then
    OUTPUT_FILE="$2"
  else
    OUTPUT_FILE="$2.mov"
  fi
fi

echo "--------------------------------------------------"
echo "Input:  $INPUT_FILE"
echo "Output: $OUTPUT_FILE"
echo "Video:  DNxHR HQX (10-bit) [Multithreaded]"
echo "Audio:  PCM 24-bit [Universal]"
echo "CPU:    Uncapped Threading"
echo "--------------------------------------------------"

# The FFmpeg command
# -threads 0 : Lets FFmpeg use all 32 threads if needed
# -nostdin   : Prevents input errors if running inside loops

ffmpeg -nostdin -i "$INPUT_FILE" \
  -threads 0 \
  -c:v dnxhd -profile:v dnxhr_hqx -pix_fmt yuv422p10le \
  -c:a pcm_s24le \
  -f mov \
  -y \
  "$OUTPUT_FILE"

echo "--------------------------------------------------"
echo "Conversion Complete!"
