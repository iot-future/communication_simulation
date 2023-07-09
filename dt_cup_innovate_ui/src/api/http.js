
import axios from 'axios'; // 引入axios
import QS from 'qs'; // qs模块，用来序列化post类型的数据
import router from '@/router/index'
import store from '@/store/index';
import { ElMessage } from 'element-plus'

let userToken = ""; 

// 请求超时时间
axios.defaults.timeout = 100000;

// post请求头
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';
axios.defaults.withCredentials = false;
// axios.defaults.headers.common['z-token'] = userToken;
axios.defaults.headers.common['z-token'] = userToken;
axios.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8';//配置请求头
// 请求拦截器
axios.interceptors.request.use(    
    config => {        
        // 每次发送请求之前判断本地中是否存在token        
        // 如果存在，则统一在http请求的header都加上token，这样后台根据token判断你的登录情况
        // 即使本地存在token，也有可能token是过期的，所以在响应拦截器中要对返回状态进行判断 ?
        // let userToken = sessionStorage.getItem("userToken"); //获取数据
        // userToken && (config.headers.Authorization = userToken);        
        // return config;   
        let user = localStorage.getItem("userToken"); //获取数据
        if (user) {
            config.headers['z-token'] = user 
        }
        return config; 
    },    
    error => {
		return Promise.error(error);
	}
);



// 响应拦截器
axios.interceptors.response.use(    
    response => {   
        // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据     
        // 否则的话抛出错误
        if (response.status === 200) {            
            return Promise.resolve(response);        
        } else {            
            return Promise.reject(response);        
        }    
    },    
    // 服务器状态码不是2开头的的情况
    // 这里可以跟你们的后台开发人员协商好统一的错误状态码    
    // 然后根据返回的状态码进行一些操作，例如登录过期提示，错误提示等等
    // 下面列举几个常见的操作，其他需求可自行扩展
    error => {         
        if (error.response.status) {            
            switch (error.response.status) {                
                // 401: 未登录
                // 未登录则跳转登录页面，并携带当前页面的路径
                // 在登录成功后返回当前页面，这一步需要在登录页操作。                
                case 403:                    
                    router.replace({                        
                        path: '/Register',                        
                        query: { 
                            redirect: router.currentRoute.fullPath 
                        }
                    });
                    break;
                // 403 token过期
                // 登录过期对用户进行提示
                // 清除本地token和清空vuex中token对象
                // 跳转登录页面                
                case 401:
                    if (code == 1) {
                        code = 0;
                        ElMessage({
                            message: '登录过期，请重新登录',
                            duration: 3000,
                            showClose: true,
                            type: 'error',
                        });
                    }
                    // 清除token
                    localStorage.removeItem('userToken');
                    
                    // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面 
                    setTimeout(() => {                        
                        router.replace({                            
                            path: '/Register',                            
                            query: { 
                                redirect: router.currentRoute.fullPath 
                            }                        
                        });                    
                    }, 1000);                    
                    break; 

                // 404请求不存在
                case 404:
					ElMessage({
					    message: '网络请求不存在',
					    duration: 3000,
					    showClose: true,
						type: 'error',
					});
                    break;
                // 其他错误，直接抛出错误提示
                default:
					console.log(err)
            }
            return Promise.reject(error.response);
        }
    }    
);

/** 
 * get方法，对应get请求 
 * @param {String} url [请求的url地址] 
 * @param {Object} params [请求时携带的参数] 
 */
export function get(url, params){    
    return new Promise((resolve, reject) =>{        
        axios.get(url, {            
            params: params        
        }).then(res => {
            resolve(res.data);
        }).catch(err =>{
            reject(err.data)        
		})    
	});
}

/**
 * post方法：原理同get基本一样，但是要注意的是，post方法必须要使用对提交从参数对象进行序列化的操作，
 * 所以这里我们通过node的qs模块来序列化我们的参数，如果没有序列化操作，后台是拿不到提交的数据。
 * 
 * post方法，对应post请求 
 * @param {String} url [请求的url地址] 
 * @param {Object} params [请求时携带的参数] 
 */
export function post(url, params) {
    return new Promise((resolve, reject) => {
        // console.log(QS.stringify(params))
         axios.post(url,params)
        .then(res => {
            resolve(res.data);
        })
        .catch(err =>{
            reject(err.data)
        })
    });
}

