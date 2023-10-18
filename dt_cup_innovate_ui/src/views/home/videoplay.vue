<template>
  <div>
    <video ref="videoPlayer" width="640" height="360" autoPlay></video>
  </div>
</template>

<script>
import flvjs from 'flv.js';

export default {
  mounted() {
    if (flvjs.isSupported()) {
      const videoPlayer = this.$refs.videoPlayer;
      const flvPlayer = flvjs.createPlayer({
        type: 'rtmp',
        url: 'rtmp://43.138.103.251:1935/live/abca' // 替换为你的RTMP视频流URL
      });
      flvPlayer.attachMediaElement(videoPlayer);
      flvPlayer.load();
    }
  }
}
</script>