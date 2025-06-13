#!/bin/bash

# Exit on error
set -e

# Ensure dependencies are installed
if ! command -v ffmpeg &> /dev/null; then
  echo "ffmpeg is not installed. Install it with: brew install ffmpeg"
  exit 1
fi

# Ensure Python and pip are available
if ! command -v python3 &> /dev/null || ! command -v pip3 &> /dev/null; then
  echo "Python3 and pip3 are required."
  exit 1
fi

# Install whisper-timestamped if missing
if ! pip3 show whisper-timestamped &> /dev/null; then
  echo "Installing whisper-timestamped..."
  pip3 install git+https://github.com/linto-ai/whisper-timestamped
fi

# Run transcription
echo "Transcribing call-recording.mp3..."
python3 - <<EOF
import whisper_timestamped as whisper
import json

model = whisper.load_model("base")
result = whisper.transcribe(model, "call-recording.mp3")

segments = []
for segment in result['segments']:
    words = [
        {
            "text": word['text'].strip(),
            "start": round(word['start'], 1),
            "end": round(word['end'], 1)
        }
        for word in segment['words']
    ]
    segments.append({"words": words})

with open("transcript.json", "w") as f:
    json.dump(segments, f, indent=2)

print("✅ Transcription complete. Output written to transcript.json")
EOF
