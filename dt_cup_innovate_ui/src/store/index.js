import {createStore} from 'vuex'

/**
 * state 存放所有的变量集合
 * 使用 UPDATA 进行提交更改
 */
export default createStore({
	state: {
		Scene: JSON.parse(localStorage.getItem("Scene")) || {},
		station:JSON.parse(localStorage.getItem("UPstation")) || {},
		
	},
	mutations: {
		Scene(state, obj) {
			state.Scene = obj;
			//本地持久化
			localStorage.setItem("Scene", JSON.stringify(state.Scene))
		},
		station(state, obj) {
			state.station = obj;
			//本地持久化
			localStorage.setItem("UPstation", JSON.stringify(state.station))
		}
	},
	modules: {

	}
})
