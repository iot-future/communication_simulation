import { get,post } from 'api/http.js';
import store from './index'

//示例
// export const getStatistics = ({ commit }, { url, data,type }) => {
//     commit('LISTLOADING', true),
//     api_post({
//         url: url,
//         baseURL: baseUrl.userUrl,
//         data: data,
//         callback: function (res) {
//             commit(type, res),
//             //数据请求完清除loading
//             commit('UPDATA', false)
//         }
//     })
// }
