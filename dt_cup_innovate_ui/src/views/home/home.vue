<template>
  <div class="main">
    <!-- 头部 -->
    <Header/>
    <!-- 主体 -->
    <div class="content">
      <!-- 内容 -->
      <div class="minBg">
        <img class="map" :src="minBg" alt="" />
        <div v-for="(item, index) in pictureArray" :key="index">
          <img :style="{ opacity: item.opacity }" :id="(item.opacity == 0) ? 'breath_light' : ''" :class="item.class"
            :src="item.src" :title="item.name" @click="select(item.name)" />
          <span :class="item.css">{{ item.name }}</span>
        </div>
        <img class="start_1" @click="debugging" @mouseover="startover" @mouseleave="startleave" :src="start" alt="" />
      </div>
    </div>
    <Footer/>
  </div>
</template>


<script>
import Footer from "../home/footer.vue";
import Header from "../home/header.vue";
import { Menu, EditPen, Message, ArrowRight } from "@element-plus/icons-vue";
export default {
  name: "home",
  props: {
    // msg: String
  },
  components: {
    Header,
    Footer,
    Menu,
    EditPen,
    Message,
    ArrowRight,
  },
  data() {
    return {
      minBg: require("./img/minBg.jpg"),//初始背景图片
      start: require("./img/start_2.png"),//开始调试按钮图片
      dialogVisible: true,
      selectedScene: [],
      pictureArray: [
        {
          opacity: 0,
          name: "大平台",
          class: "office",
          css: "office_Z",
          src: require("./img/office.png"),
        },
        {
          opacity: 0,
          name: "小平台",
          class: "substation_two",
          css: "substation_two_Z",
          src: require("./img/substation_two.png"),
        },
        {
          opacity: 0,
          // name: "智能家居",
          class: "Villa",
          css: "Villa_Z",
          src: require("./img/Villa.png"),
        },
        {
          opacity: 0,
          // name: "/智能工厂",
          class: "factory",
          css: "factory_Z",
          src: require("./img/factory.png"),
        },
        {
          opacity: 0,
          // name: "5G智能园区",
          class: "community",
          css: "community_Z",
          src: require("./img/community.png"),
        },
        {
          opacity: 0,
          // name: "5G数字商超",
          class: "Shopping",
          css: "Shopping_Z",
          src: require("./img/Shopping.png"),
        },
        {
          opacity: 0,
          // name: "超高清视频",
          class: "stadium",
          css: "stadium_Z",
          src: require("./img/stadium.png"),
        },
        {
          opacity: 0,
          // name: "智慧校园",
          class: "school",
          css: "school_Z",
          src: require("./img/school.png"),
        },
        {
          opacity: 0,
          // name: "智慧远程医疗",
          class: "hospital",
          css: "hospital_Z",
          src: require("./img/hospital.png"),
        },
        {
          opacity: 0,
          // name: "智慧远程医疗1",
          class: "hospital1",
          css: "hospital_Z1",
          src: require("./img/hospital.png"),
        },
        {
          opacity: 0,
          // name: "智慧远程医疗2",
          class: "hospital2",
          css: "hospital_Z2",
          src: require("./img/hospital.png"),
        },
      ],
    };
  },
  watch: {},
  mounted() {
  },
  methods: {
    //点击图片触发事件
    select(name) {
      this.pictureArray.map((item, index) => {
        if (item.name == name && item.opacity == 0) {
          item.opacity = 1;
          this.selectedScene .push(name);
        } else if (item.name == name && item.opacity == 1) {
          item.opacity = 0;
          this.selectedScene.map((item, index) => {
            if (item == name) {
              this.selectedScene.splice(index, 1);
            }
          });
        }
      });
    },
    //logo点击事件
    logo() {
      this.dialogVisible = !this.dialogVisible;
    },
    // 鼠标滑过事件
    startleave() {
      this.start = require("./img/start_2.png");
    },
    // 鼠标滑过事件
    startover() {
      this.start = require("./img/start_1.png");
    },
    //开始调试按钮
    debugging() {
      if (this.selectedScene.length == 0) {
        this.$message.error("请您选择需要调试的项目！");
        return false;
      }
      this.$store.commit("Scene", this.selectedScene);
      this.$router.push("/innovation");
    },
  },
};
</script>

<style scoped lang="scss">
@import "./css/index.scss";
@import "./css/content.scss";
</style>