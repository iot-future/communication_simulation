<template>
  <div>
    <Header />
    <div class="content" @dragover="allowDrop($event, index)">
      <div class="minBg">
        <img class="map" src="./img/minBg2.jpg" />
      </div>
      <!-- 退出按钮 -->
      <div class="img_exit" @click="exit">
        <img class="exit_icon" src="./img/exit_icon.png" alt="">
        <span class="exit_text">退 &ensp;出</span>
      </div>
      <div>
        <div @click="configuration('基站对象开发配置')" id="label_3" class="configuration">基站对象开发配置</div>
        <div @click="configuration('终端对象开发配置')" style="top: 2.1rem" id="label_5" class="configuration">终端对象开发配置</div>
        <div @click="configuration('硬件开发配置')" style="top: 2.9rem" id="label_4" class="configuration">硬件开发配置</div>
        <div @click="configuration('指标呈现')" style="top: 3.7rem" id="label_1" class="configuration">指标呈现</div>
      </div>

      <!-- 基站回显 -->
      <div v-show="dialog_Visible" v-for="(item, index) in Base_station_echo" :key="index">
        <img @click="
          element(item.serial_number, item.lat, item.lon, item.name, item.type, item.id)
        " class="station_one"
          :style="{ left: this.dispose_station(item.info).left, top: this.dispose_station(item.info).top, }"
          :src="this.dispose_station(item.info).url" :title="this.dispose_station(item.info).name" />
      </div>

      <!-- 终端回显 -->
      <div v-show="dialog_Visible" v-for="(item, index) in Base_terminal_echo" :key="index">
        <img @click="
          element(item.serial_number, item.lat, item.lon, item.name, item.type, item.id)
        " class="station_one"
          :style="{ left: this.station_terminal(item.info).left, top: this.station_terminal(item.info).top, }"
          :src="this.station_terminal(item.info).url" :title="this.station_terminal(item.info).name" />
      </div>

      <div id="pop_Box" v-show="dialog_Show">
        <span style="color: #fff; font-size: 0.16rem">
          <span class="map-popup-title">模型信息</span>
          <span class="mars3d-popup-close-button" @click="close">x</span>
          <table style="width: 2.8rem; margin: 0.6rem auto 0">
            <tbody>
              <tr>
                <td>名称：</td>
                <td id="bldianzhanID">{{ element_name }}</td>
              </tr>
              <tr>
                <td>序列号：</td>
                <td id="bllng">{{ element_ID }}</td>
              </tr>
              <tr>
                <td>纬度：</td>
                <td id="bllat">{{ latitude }}</td>
              </tr>
              <tr>
                <td>经度：</td>
                <td id="blarea">{{ longitude }}</td>
              </tr>
              <tr>
                <td>站点类型：</td>
                <td id="bldianzhanID">{{ element_type }}</td>
              </tr>
              <tr>
                <td>当前区域：</td>
                <td id="bldzlxing">{{ Scene }}</td>
              </tr>
              <tr v-if="element_type === '宏基站'">
                <td>覆盖半径：</td>
                <td id="bldzlxing">150m</td>
              </tr>
              <tr v-if="element_type === '微基站'&&element_ID === '3'">
                <td>覆盖半径：</td>
                <td id="bldzlxing">55m</td>
              </tr>
              <tr v-if="element_type === '视频下载类终端'&&element_ID === '5'">
                <td>数量：</td>
                <td id="bldzlxing">10台</td>
              </tr>
              <tr v-if="element_type === '摄像头'&&element_ID === '2'&&Scene === '小平台'">
                <td>数量：</td>
                <td id="bldzlxing">2台</td>
              </tr>
            </tbody>
          </table>
          <div class="action-btn-container">
            <button id="btnDetailsshanchugrid" @click="remove (this.sole_id, this.element_type)" class="delete">
              删除
            </button>
          </div>
        </span>
      </div>

      <!-- 拖拽接收框 -->
      <div class="drag_box" v-show="dialog_Visible">
        <div class="header">
          <span class="header_title">{{ Scene }}</span>
        </div>
        <div class="content">
          <img class="Box_map" :src="Box_map" alt="" />
        </div>
      </div>
      <div class="edge"></div>
      <div class="Tabs">
        <el-tabs :tab-position="tabPosition_1" v-model="active_Name" type="card" @tab-click="handle_Click">
          <el-tab-pane :label="item" :name="index" v-for="(item, index) in this.new_Array" :key="index">
            <div id="tabs">
              <el-tabs :tab-position="tabPosition_2"
                style="height: 8.3rem;overflow: auto;margin-left: 2px;background: #302172ad;border-left: 2px solid #fff;">
                <el-tab-pane label="基站库">
                  <div class="element_Box" v-for="(item, index) in picture_list" :key="index">
                    <div class="element">
                      <img class="element_img" draggable="true" @dragstart="dragstart($event, item.name, item.src)"
                        @dragend="dragend($event, item.name, item.type, item.src)" :src="item.src" alt="" />
                    </div>
                    <p class="model-name">{{ item.name }}</p>
                  </div>
                </el-tab-pane>
                <el-tab-pane label="终端库">
                  <div class="element_Box" v-for="(item, index) in picture_Array" :key="index">
                    <div class="element">
                      <img class="element_img" draggable="true" @dragstart="dragstart($event, item.name, item.src)"
                        @dragend="dragend($event, item.name, item.type, item.src)" :src="item.src" alt="" />
                    </div>
                    <p class="model-name">{{ item.name }}</p>
                  </div>
                </el-tab-pane>
              </el-tabs>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
    <Footer></Footer>
  </div>
  <equipment ref="equipment" />
  <hardwareExploit ref="hardwareExploit" />
</template>

<script>
import Header from "./header.vue";
import Footer from "./footer.vue";
import equipment from "@/views/home/equipment.vue";
import hardwareExploit from "@/views/home/hardwareExploit.vue";
import { parameter } from "../../api/apis.js";
export default {
  name: "home",
  props: {},
  components: {
    Header,
    Footer,
    equipment,
    hardwareExploit
  },
  data() {
    return {
      Arrays: "",
      scene_id: "",
      active_Name: "first",
      new_Array: "",
      tabPosition_1: "left",
      tabPosition_2: "top",
      Base_station_echo: [], //基站回显
      Base_terminal_echo: [], //终端回显
      Map_List: [
        {
          name: "小平台1",
          src: require("./img/mark_1.jpg"),
        },
        {
          name: "智慧校园",
          src: require("./img/mark_2.jpg"),
        },
        {
          name: "小平台",
          src: require("./img/mark_3.jpg"),
        },
        {
          name: "大平台",
          src: require("./img/mark_4.jpg"),
        },
        {
          name: "智慧远程医疗",
          src: require("./img/mark_5.jpg"),
        },
        {
          name: "5G智能园区",
          src: require("./img/mark_6.jpg"),
        },
        {
          name: "智能家居",
          src: require("./img/mark_7.jpg"),
        },
        {
          name: "智能数字电网",
          src: require("./img/mark_8.jpg"),
        },
        {
          name: "智能工厂",
          src: require("./img/mark_9.jpg"),
        },
      ],
      picture_list: [
        {
          name: "宏基站",
          type: "宏基站",
          src: require("./img/Base-station1.png"),
          url: require("./img/Base-station_1.png"),
        },
        {
          name: "微基站",
          type: "微基站",
          src: require("./img/Base-station2.png"),
          url: require("./img/Base-station_2.png"),
        },
        {
          name: "PICO站",
          type: "PICO站",
          src: require("./img/Base-station3.png"),
          url: require("./img/Base-station_3.png"),
        },
      ],
      picture_Array: [
        {
          name: "移动手持终端",
          type: "移动手持终端",
          src: require("./img/terminal1.png"),
          url: require("./img/terminal_1.png"),
        },
        {
          name: "车载终端",
          type: "车载终端",
          src: require("./img/terminal2.png"),
          url: require("./img/terminal_2.png"),
        },
        {
          name: "摄像头",
          type: "摄像头",
          src: require("./img/terminal3.png"),
          url: require("./img/terminal_3.png"),
        },
        {
          name: "无人机",
          type: "无人机",
          src: require("./img/terminal4.png"),
          url: require("./img/terminal_4.png"),
        },
        {
          name: "视频下载类终端",
          type: "视频下载类终端",
          src: require("./img/terminal5.png"),
          url: require("./img/terminal_5.png"),
        },
        {
          name: "智能电表",
          type: "智能电表",
          src: require("./img/terminal6.png"),
          url: require("./img/terminal_6.png"),
        },
        {
          name: "机器人",
          type: "机器人",
          src: require("./img/terminal7.png"),
          url: require("./img/terminal_7.png"),
        },
        {
          name: "差动控制保护终端",
          type: "差动控制保护终端",
          src: require("./img/terminal8.png"),
          url: require("./img/terminal_8.png"),
        },
        {
          name: "传感器",
          type: "传感器",
          src: require("./img/terminal9.png"),
          url: require("./img/terminal_9.png"),
        },
      ],
      base_Array: [],//基站数据传输
      terminal_Array: [],//终端数据传输 
      item: {
        top: "0",
        left: "0",
      },
      Scene: "",//场景名称
      dialog_Visible: false,//弹框显示隐藏
      dialog_Show: false,//弹框显示隐藏
      longitude: null, //经度
      latitude: null, //纬度
      element_name: null, //基站名称
      element_type: null, //基站类型
      quantity: "1",//数量
      element_ID: "1", //基站ID显示
      Box_map: "", //拖拽框底图
      sole_id: "",//删除使用唯一id
      parent_id: "",//父id
    };
  },
  mounted() {
    // 获取用户选择场景
    this.new_Array = this.$store.state.Scene;
    // 获取场景id
    parameter.Acquire().then((res) => {
      this.Arrays = JSON.parse(res.data);
    });
  },
  methods: {
    // 基站数据处理
    dispose_station(info) {
      let data;
      try {
        data = JSON.parse(info);
      } catch (error) {
        data = {};
      }
      return data;
    },
    // 终端数据处理
    station_terminal(info) {
      let data;
      try {
        data = JSON.parse(info);
      } catch (error) {
        data = {};
      }
      return data;
    },
    // 点击场景名称触发弹框
    handle_Click(tab, event) {
      this.dialog_Visible = false;
      this.Scene = tab.props.label;
      setTimeout(() => {
        this.dialog_Visible = true;
        // 底图显示
        this.Map_List.forEach((e, i) => {
          if (e.name == this.Scene) {
            this.Box_map = e.src;
          }
        });
      }, 1000);
      // 场景id
      this.Arrays.map((item, index) => {
        if (item.name == this.Scene) {
          this.scene_id = item.scene_id;
        }
      });
      this.element_back('基站库');//基站库元素回显
      this.element_back('终端库');//终端库元素回显
      this.structure_back();//元素树结构回显
    },

    //元素回显
    element_back(type) {
      let dataobj = new FormData();
      dataobj.append("scene_id", this.scene_id);
      dataobj.append("element_type", type);
      parameter.element_select(dataobj).then((res) => {
        this.new_Array.map((item, index) => {
          // latitude纬度 longitude经度
          if (type == '基站库') {
            this.Base_station_echo = JSON.parse(res.data);
          }
          if (type == '终端库') {
            this.Base_terminal_echo = JSON.parse(res.data);
          }
        });
      });
    },

    //元素树结构回显
    structure_back() {
      let dataobj = new FormData();
      dataobj.append("scene_id", this.scene_id);
      parameter.element_develop(dataobj).then((res) => {
        this.base_Array = JSON.parse(res.data).base_station
        this.terminal_Array = JSON.parse(res.data).terminal
      });
    },

    // 拖拽开始时
    dragstart(e, name, src) {
      // 拖拽阴影去掉
      document.addEventListener(
        "dragstart",
        function (event) {
          event.dataTransfer.setDragImage(
            event.target,
            window.outerWidth,
            window.outerHeight
          );
        },
        false
      );
    },
    // 拖拽完成时
    dragend(e, name, type, src) {
      // 基站拖拽完成
      if (
        this.dialog_Visible == true &&
        e.screenX > 300 &&
        e.screenX < 1660 &&
        e.screenY > 250 &&
        e.screenY < 960
      ) {
        this.picture_list.forEach((item, index) => {
          if (item.name == name) {
            this.item.top = (e.screenY - 120) / 100 + "rem";
            this.item.left = (e.screenX - 20) / 100 + "rem";
            console.log(this.item)
            let datalist = new FormData();
            datalist.append("name", name);
            datalist.append("type", type);
            datalist.append("lon", e.screenY);
            datalist.append("lat", e.screenX);
            datalist.append("scene_id", this.scene_id);
            datalist.append("element_type", '基站库');
            datalist.append("parent_id", this.parent_id);
            datalist.append(
              "info",
              JSON.stringify({
                top: this.item.top,
                left: this.item.left,
                src: src,
                url: item.url,
                type: type,
              })
            );
            //基站添加
            parameter.element_save(datalist).then((res) => {
              this.element_back('基站库');
              this.structure_back()
            });
          }
        });
        //终端拖拽完成
        this.picture_Array.forEach((item, index) => {
          if (item.name == name) {
            this.item.top = (e.screenY - 120) / 100 + "rem";
            this.item.left = (e.screenX - 20) / 100 + "rem";
            let datalist = new FormData();
            datalist.append("name", name);
            datalist.append("type", type);
            datalist.append("lon", e.screenY);
            datalist.append("lat", e.screenX);
            datalist.append("scene_id", this.scene_id);
            datalist.append("element_type", '终端库');
            datalist.append("parent_id", this.parent_id);
            datalist.append(
              "info",
              JSON.stringify({
                top: this.item.top,
                left: this.item.left,
                src: src,
                url: item.url,
                type: type,
              })
            );
            //终端添加
            parameter.element_save(datalist).then((res) => {
              this.element_back('终端库');
              this.structure_back()
            });
          }
        });
      }
    },
    // 当拖拽到右边框中触发
    allowDrop(e, index) {
      // 触发拖拽默认事件
      e.preventDefault();
    },
    // 点击小图标打开弹框
    element(serial_number, lat, lon, name, type, id) {
      this.dialog_Show = true;
      this.element_name = name;
      this.element_ID = serial_number;
      this.latitude = lat;
      this.longitude = lon;
      this.element_type = type;
      this.sole_id = id;
      
    },
    // 关闭弹框
    close() {
      this.dialog_Show = false;
    },
    // 删除基站
    remove(id, type) {
      if (type == "宏基站" || type == "微基站" || type == "PICO站") {
        let dataobj = new FormData();
        dataobj.append("id", id);
        dataobj.append("scene_id", this.scene_id);
        // 基站删除
        parameter.element_delete(dataobj).then((res) => {
          this.element_back('基站库');
        });
      } else {
        let datalist = new FormData();
        datalist.append("id", id);
        datalist.append("scene_id", this.scene_id);
        // 终端删除
        parameter.element_delete(datalist).then((res) => {
          this.element_back('终端库');
        });
      }
      this.dialog_Show = false;
    },
    // 退出当前页
    exit() {
      this.$router.go(-1);
    },
    // 基站开发配置按钮
    configuration(val) {
      if (val == '基站对象开发配置') {
        if (this.Base_station_echo.length >= 1) {
          this.$refs.equipment.open('基站对象开发配置', this.base_Array, this.Scene);
        } else {
          this.$message.error("请至少选择一个基站配置");
        }
      } else if (val == '终端对象开发配置') {
        if (this.Base_terminal_echo.length >= 1) {
          this.$refs.equipment.open('终端对象开发配置', this.terminal_Array, this.Scene);
        } else {
          this.$message.error("请至少选择一个终端配置");
        }
      } else if (val == '硬件开发配置') {
        this.$refs.hardwareExploit.open('硬件开发配置', this.terminal_Array,);
      } else if (val == '指标呈现') {
        this.$refs.hardwareExploit.open('指标呈现');
      }
    },
  },
};
</script>
<style scoped lang="scss">
  @import "./css/innovation.scss";
</style>