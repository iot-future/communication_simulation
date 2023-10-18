<template>
  <div style="display: flex; align-items: center; justify-content: center; width: 100%">
    <video ref="videoPlayer" controls autoPlay></video>
  </div>
</template>

<script>
import Hls from 'hls.js';

export default {
  mounted() {
    const video = this.$refs.videoPlayer;

    if (Hls.isSupported()) {
      const hls = new Hls();
      hls.loadSource('http://43.138.103.251:1999/live/abca.m3u8');
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, () => {
        video.play();
      });
    } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
      video.src = 'http://43.138.103.251:1999/live/abca.m3u8';
      video.addEventListener('loadedmetadata', () => {
        video.play();
      });
    }
  }
}
</script>

<style>
video {
  width: 100%;
  height: auto;
  align-items: center;
  justify-content: center;
}
</style>
