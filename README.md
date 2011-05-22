`extractaudio.sh` extracts the audio portion of a video file.

This is done without transcoding by extracting the native audio track (auto-detected as `MP3` or `M4A`) from container formats like `MOV`/`AVI`/`FLV`/`M4V`/`MP4`.

Syntax: `extractaudio INPUT.ext`

The audio track is saved as `INPUT.ext.mp3` or `INPUT.ext.m4a`.

This will of course work only, if the video file contains an audio track in `MP3` or `M4A`/`AAC` format.
`MOV`/`AVI`/`FLV` files may contain `MP3` or `M4A`/`AAC`, `MP4` or `M4V` files contain only `M4A`=`AAC`.

Requires: 

* [`FFmpeg`](http://www.ffmpeg.org/)
* [`MP4Box`](http://www.tkn.tu-berlin.de/research/evalvid/) (only used for `M4A`; without it iTunes will not recognise the `M4A`)

Examples:

You have some videos from *YouTube* and want to extract the audio track without transcoding.

* To convert `FLV` to `MP3`: `audioextract video.flv`
* To convert `MP4` to `M4A`: `audioextract video.mp4`

Install:

    sudo mv extractaudio.sh /usr/local/bin/extractaudio
    sudo chmod 755 /usr/local/bin/extractaudio

See also:

* [Wikipedia: *Comparison of container formats*](http://en.wikipedia.org/wiki/Comparison_of_container_formats)
* [Easy YouTube Video Downloader](http://www.yourvideofile.com/) is a free addon for Firefox, Google Chrome, Opera and Safari that adds a nice download button to every YouTube page
* [How to compile FFmpeg on MacOS X](http://blog.mameso.com/2010/04/ffmpeg-fur-mac-osx-10-6-compilieren/)
