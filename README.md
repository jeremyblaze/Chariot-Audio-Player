# Chariot Audio Player

To be embedded on Webflow like so:

```html
<iframe src="index.html" width="400px" height="400px" frameborder="0" scrolling="no"></iframe>
```

### Updating the audio

_**Run this at your own risk**_

1. Replace `call-recording.mp3` file with new audio – ensure the file is named `call-recording.mp3`
2. Run `sh transcribe.sh` in a terminal to regenerate the transcript. It will install dependencies if needed, though you may need to install ffmpeg manually first via `brew install ffmpeg`