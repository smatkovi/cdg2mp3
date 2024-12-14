#!/bin/bash

# Ensure script stops on error
set -e

# Loop through all .cdg files in the current directory
for cdg_file in *.cdg; do
    # Extract the base filename (without extension)
    base_name="${cdg_file%.cdg}"
    
    # Find the corresponding .mp3 file
    mp3_file="${base_name}.mp3"
    
    # Check if the matching .mp3 file exists
    if [[ -f "$mp3_file" ]]; then
        echo "Processing: $base_name.cdg and $base_name.mp3"
        
        # Run ffmpeg command
        ffmpeg -i "$mp3_file" -copyts -i "$cdg_file" -filter:v fps=25 -pix_fmt yuv420p "${base_name}.mp4"
    else
        echo "Warning: No matching .mp3 file for $cdg_file"
    fi
done

echo "Processing complete."

