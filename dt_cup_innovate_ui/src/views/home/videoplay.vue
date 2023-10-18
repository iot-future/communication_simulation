<template>
    <div style="height: 500px;width: 100%;">

        <video :preload="preload" :poster="videoImg" :height="height" :width="width" align="center" :controls="controls"
            :autoplay="autoplay">
            <source :src="videoSrc" type="video/mp4">
        </video>
    </div>
</template>

<script>
export default {
    name: 'Video',
    data() {
        return {
            videoSrc: require('./video/202305172156.mp4'),
            videoImg:  require('./img/play.png'),
            playStatus: '',
            muteStatus: '',
            isMute: true,
            isPlay: false,
            width: '820', // 设置视频播放器的显示宽度（以像素为单位）
            height: '500', // 设置视频播放器的显示高度（以像素为单位）
            preload: 'auto', //  建议浏览器是否应在<video>加载元素后立即开始下载视频数据。
            controls: true, // 确定播放器是否具有用户可以与之交互的控件。没有控件，启动视频播放的唯一方法是使用autoplay属性或通过Player API。
            autoplay: ''
        }
    }

    // 自动播放属性,muted:静音播放
    // autoplay: 'muted',

}
</script>

<style scoped ></style>

