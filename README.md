# Chariot Audio Player

To be embedded on Webflow like so:

```html
<iframe src="index.html" width="400px" height="400px" frameborder="0" scrolling="no"></iframe>
```

### 1. Converting audio to MP4

(We use a video-less MP4 here to maximise browser compatibility)

To convert OGG to MP4, use
https://www.freeconvert.com/ogg-to-mp4


### 2. Updating the audio

Replace `call-recording.mp4` file with new audio – ensure the file is named `call-recording.mp4` (it should be an mp4 with audio only to maximise browser compatibility)

_**Run this at your own risk**_


### 3. Re-generating the transcript

1. In the repo folder, run `sh transcribe.sh` in a terminal to regenerate the transcript. It will install dependencies if needed, though you may need to install ffmpeg manually first via `brew install ffmpeg`
2. The transcript will be saved to `transcript.json`, but you'll need to manually copy it into `transcript.js` (which is where the player ui can fetch it from)