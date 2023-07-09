import { createRouter, createWebHistory } from 'vue-router';
// import Home from '../views/Home.vue';
import Home from '@/views/home/home.vue';



const routes = [
  {
    path: '/',//首页
    name: 'Home',
    component: Home,
  },
  {
    path: '/innovation',//元素拖拽页面
    name: 'innovation',
    component: () => import('../views/home/innovation.vue')
  },
  {
    path: '/equipment',//基站 对象开发页
    name: 'equipment',
    component: () => import('../views/home/equipment.vue')
  },
  {
    path: '/hardwareExploit',//硬件 指标开发页面
    name: 'hardwareExploit',
    component: () => import('../views/home/hardwareExploit.vue')
  },
  {
    path: '/videoplayer',//视频开发页面
    name: 'videoplayer',
    component: () => import('../views/home/videoplayer.vue')
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})
export default router
