import {createApp} from 'vue'
import App from './App.vue'
import router from './router'
import store from './store' // 引入vuex

import ElmentPlus from 'element-plus';
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import * as echarts from 'echarts'
// import 'element-ui/lib/theme-chalk/index.css';
const app = createApp(App);
app.config.warnHandler = () => null // 去除控制台警告信息

/* 引入公共函数 */

// 导入所有的el-icon图标
// import * as ElIconModules from '@element-plus/icons'

// //统一注册el-icon图标
// for(let iconName in ElIconModules){
//     createApp(App).component(iconName,ElIconModules[iconName])
// }
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    createApp(App).component(key, component)
}
//配置中文显示
createApp(App).use(ElementPlus, {
    locale: zhCn,
})

createApp(App).use(router).use(ElmentPlus).use(store).mount('#app')





