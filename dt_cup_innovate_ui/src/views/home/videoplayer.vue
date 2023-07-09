<template>
  <div>
    <video ref="player" :src="videoUrl"  controls></video>
  </div>
</template>

<script>
import VueVideoPlayer from 'vue-video-player';
import 'video.js/dist/video-js.css'; // 引入video.js样式文件
// import 'vue-video-player/src/custom-theme.css'; // 引入vue-video-player样式文件

export default {
  name: 'videoplayer',
  components: {
    VueVideoPlayer
  },
  data() {
    return {
      videoUrl: 'rtmp://mobliestream.c3tv.com:554/live/goodtv.sdp', // 替换为您的rtmp视频流URL
      // posterUrl: 'your-poster-url' // 可选，替换为您的视频封面图URL
    };
  },
  mounted() {
    this.$refs.player.addEventListener('loadedmetadata', this.onPlayerMetadataLoaded);
  },
  methods: {
    onPlayerMetadataLoaded() {
      this.$nextTick(() => {
        // 组件加载完成后，自动播放视频
        this.$refs.player.play();
      });
    }
  }
}
</script>

<style>
/* 可自定义组件样式 */
</style>