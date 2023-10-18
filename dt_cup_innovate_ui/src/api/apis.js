/*
 * API 统一管理。使用时按需导入。
 * 团队开发可以创建多个模块分别引入axioms index.js. 管理自己的接口。
 * 使用：
 * 组件内，导入api.js 
 * import {apiAddress} from “./api.js”
 * 
 */
import qs from 'qs'; // qs模块，用来序列化post类型的数据
import {
    get,
    post
} from './http'

// export const apiAddress = p => post('api/v1/users', p);
export const article = {
    //无参数
    getNewsData() {
        return get('api/get_news_data');
    },
    // 带参数    
    articleDetail(id, params) {
        return get('api/v1/users', {
            params: params
        });
    },
    Detail(params) {
        return post('api/', params);
    },
}


//新参数请求
export const parameter = {
    // 获取所有的参数
    Acquire(id, params) {
        return get('api/scene/select');
    },

    //元素回显/element/select
    element_select(params) {
        return post('api/element/select', params);
    },

    //元素保存/element/save
    element_save(params) {
        return post('api/element/save', params);
    },

    //元素删除/element/delete
    element_delete(params) {
        return post('api/element/delete', params);
    },

    //元素开发回显/element/develop
    element_develop(params) {
        return post('api/element/develop', params);
    },

    //元素头部信息获取/element/header/select
    element_header_select(params) {
        return post('api/element/header/select', params);
    },

    //元素头部保存/element/header/save
    element_header_save(params) {
        return post('api/element/header/save', params);
    },

    //元素参数保存/element/param/save
    element_param_save(params) {
        return post('api/element/param/save', params);
    },

    //元素参数查询/element/param/select
    element_param_select(params) {
        return post('api/element/param/select', params);
    },
    //画3D图/picture_3d
    picture_3d(params){
        return post('api/picture/3d', params);
    },
    //画基础柱状图/bar
    picture_bar(params){
        return post('api/picture/bar', params);
    },
    //画折线sinr
    picture_sinr(params){
        return post('api/picture/sinr', params);
    },
    picture_zaibo(params){
        return post('api/picture/zaibo', params);
    },
}