<template>
	<div class="content-box">
		<el-dialog v-model="dialog_Visible" :title="title" width="75%">
			<div style="display: flex">
				<el-tree style="width: 2.8rem;" :data="data" node-key="id" ref="tree" default-expand-all
					:check-strictly="true" :expand-on-click-node="false" :props="defaultProps"
					:default-checked-keys="monitorFactor" @current-change="handleCheckChange" @check="handleCheck">
					<template #default="{ node, data }">
						<!-- 编辑状态 -->
						<template v-if="node.isEdit">
							<el-input v-model="data.name" autofocus size="mini" :ref="'slotTreeInput' + data.id"
								@blur.stop="handleInput(node, data)" @keyup.enter.native="handleInput(node, data)">
							</el-input>
						</template>

						<!-- 非编辑状态 -->
						<template v-else>
							<span class="custom-tree-node">
								<span
									:class="(data.id == sole_id && data.id != undefined && table_show == true) ? 'activetext' : ''"
									@click="CheckTitle(data, node)">{{
										data.name
									}} <span v-if="data.id">-</span> {{ data.serial_number }}</span>
								<span v-if="data.type != 'Entries'">
									<el-button v-if="data.parent_id == ''" type="text" size="mini" @click="append(data)"> 增加
									</el-button>

									<el-button type="text" size="mini" style="margin-left: 8px" @click="remove(node, data)">
										删除
									</el-button>
									<el-button type="text" size="mini" @click="handleEdit(node, data)"> 修改 </el-button>

								</span>
							</span>
						</template>
					</template>
				</el-tree>
				<div class="c-right" style="flex: 1; overflow: hidden">
					<ul>
						<li v-for="(item, index) in tree_structure" :key="index" v-show="table_show">
							<el-table border :data="dataSource" style="width: 95%" min-width="3"
								:header-cell-style="{ background: '#eee' }">
								<el-table-column ref="tab" width='300px' min-width='300px'
									v-for="(item, index) in columnData" :key="index" :prop="item.prop" :label="item.label"
									:render-header="renderHeader">
									<template #default="scope">
										<span v-if="item.label == '序号'">
											<el-input v-model="scope.row[item.prop]" :disabled="true"
												placeholder=""></el-input>
										</span>
										<span v-else>
											<el-input v-model="scope.row[item.prop]" placeholder="请输入内容"></el-input>
										</span>
									</template>
								</el-table-column>
							</el-table>
							<div style="margin-top: 10px">
								<el-button @click="AddRow()" v-show="Hide">
									<el-icon style="vertical-align: middle">
										<CirclePlus />
									</el-icon>
									<span style="vertical-align: middle"> 增加行 </span>
								</el-button>

								<el-button @click="RemoveRow()" v-show="Hide">
									<el-icon style="vertical-align: middle">
										<Remove />
									</el-icon>
									<span style="vertical-align: middle"> 删除行 </span>
								</el-button>

								<el-button @click="addColumn()">
									<el-icon style="vertical-align: middle">
										<CirclePlus />
									</el-icon>
									<span style="vertical-align: middle"> 增加列 </span>
								</el-button>

								<el-button @click="RemoveColumn()">
									<el-icon style="vertical-align: middle">
										<Remove />
									</el-icon>
									<span style="vertical-align: middle"> 删除列 </span>
								</el-button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="save-box">
				<el-button type="primary" @click="saveData()">
					<span style="vertical-align: middle"> 保存 </span>
				</el-button>
			</div>
		</el-dialog>
	</div>
</template>
  
<script>
import { CirclePlus, Remove } from "@element-plus/icons-vue";
import { parameter } from "../../api/apis.js";
export default {
	components: {
		CirclePlus,
		Remove,
	},
	data() {
		const dataSource = [];
		return {
			data: JSON.parse(JSON.stringify(dataSource)),
			dialog_show:true,
			table_show: false,
			dialog_Visible: false,
			title: "",
			Arrays: "",
			scene_id: "",
			name: "",
			dataSource: [],
			columnPropIndex: 0, //列属性自增
			columnLabel: "新列",
			monitorFactor: [],
			columnData: [],
			NODE_KEY: "id", // id对应字段,
			tree_structure: [],
			defaultProps: {
				children: "children",
				label: "label",
			},
			activeName: 'second',
			Hide: false,
			disabled: true,
			serial: "1",//表格中序号
			id: "",//表格中ID
			sole_id: "",//表格中sole_id
			num: "1",//表格中数量
			tableName: "",//表格名称
		}

	},

	mounted() {
		// 获取所有场景id
		parameter.Acquire().then((res) => {
			this.Arrays = JSON.parse(res.data);
		});
	},
	methods: {
		// 打开弹框
		open(name, data, Scene) {
			this.title = Scene
			this.name = name
			this.table_show = false
			if (name == '基站对象开发配置') {
				this.dialog_Visible = true;
				this.disabled = true
				this.num = 1
				this.data = [
					{
						label: "宏基站",
						name: "宏基站",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "微基站",
						name: "微基站",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "PICO站",
						name: "PICO站",
						children: [
						],
						type: 'Entries',
					},
				];
				data.map((item, index) => {
					if (item.type == '宏基站') {
						this.data[0].children.push(item)
					} else if (item.type == '微基站') {
						this.data[1].children.push(item)
					} else if (item.type == 'PICO站') {
						this.data[2].children.push(item)
					}
				});
			} else if (name == '终端对象开发配置') {
				this.dialog_Visible = true;
				this.disabled = false
				this.num = ''
				this.data = [
					{
						label: "移动手持终端",
						name: "移动手持终端",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "车载终端",
						name: "车载终端",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "摄像头",
						name: "摄像头",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "无人机",
						name: "无人机",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "视频下载类终端",
						name: "视频下载类终端",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "智能电表",
						name: "智能电表",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "机器人",
						name: "机器人",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "差动控制保护终端",
						name: "差动控制保护终端",
						children: [
						],
						type: 'Entries',
					},
					{
						label: "传感器",
						name: "传感器",
						children: [
						],
						type: 'Entries',
					},
				];
				data.map((item, index) => {
					if (item.type == '移动手持终端') {
						this.data[0].children.push(item)
					} else if (item.type == '车载终端') {
						this.data[1].children.push(item)
					} else if (item.type == '摄像头') {
						this.data[2].children.push(item)
					} else if (item.type == '无人机') {
						this.data[3].children.push(item)
					} else if (item.type == '视频下载类终端') {
						this.data[4].children.push(item)
					} else if (item.type == '智能电表') {
						this.data[5].children.push(item)
					} else if (item.type == '机器人') {
						this.data[6].children.push(item)
					} else if (item.type == '差动控制保护终端') {
						this.data[7].children.push(item)
					} else if (item.type == '传感器') {
						this.data[8].children.push(item)
					}
				});
			}
			this.Arrays.map((item, index) => {
				if (item.name == Scene) {
					this.scene_id = item.scene_id;
				}
			});
		},
		//logo点击事件
		logo(){
			this.dialog_show = !this.dialog_show;
		},
		// 点击修改
		handleInput(_node, _data) {
			// 修改节点
			let datalist = new FormData();
			datalist.append("name", _data.name);
			datalist.append("id", _data.id);
			//基站添加
			parameter.element_save(datalist).then((res) => {
				this.$parent.element_back('基站库')
				this.$parent.element_back('终端库')
			});
			// 退出编辑状态
			if (_node.isEdit) {
				_node["isEdit"] = false;
			}
		},

		//修改
		handleEdit(_node, _data) {
			// 设置编辑状态
			if (!_node.isEdit) {
				_node["isEdit"] = true;
			}
			// 输入框聚焦
			this.$nextTick(() => {
				if (this.$refs["slotTreeInput" + _data[this.NODE_KEY]]) {
					this.$refs[
						"slotTreeInput" + _data[this.NODE_KEY]
					].$refs.input.focus();
				}
			});
		},
		//添加节点
		append(data) {
			let datalist = new FormData();
			datalist.append("name", 'new');
			datalist.append("scene_id", this.scene_id);
			datalist.append("parent_id", data.id);
			datalist.append("type", '');
			datalist.append("lon", '0');
			datalist.append("lat", '0');
			datalist.append("element_type", '');
			parameter.element_save(datalist).then((res) => {
				data.children.push(JSON.parse(res.element));
				this.$parent.structure_back()
			});
		},
		//删除节点
		remove(node, data) {
			this.table_show = false
			const parent = node.parent;
			const children = parent.data.children || parent.data;
			const index = children.findIndex(d => d.id === data.id);
			children.splice(index, 1);
			if (this.name == '基站对象开发配置') {
				// 基站删除接口
				let dataobj = new FormData();
				dataobj.append("id", data.id);
				dataobj.append("scene_id", this.scene_id);
				parameter.element_delete(dataobj).then((res) => {
					this.$parent.element_back('基站库')
					this.$parent.structure_back()

				});
			} else if (this.name == '终端对象开发配置') {
				// 终端删除
				let datalist = new FormData();
				datalist.append("id", data.id);
				datalist.append("scene_id", this.scene_id);
				parameter.element_delete(datalist).then((res) => {
					this.$parent.element_back('终端库')
					this.$parent.structure_back()
				});

			}
		},

		//点击树结构元素
		CheckTitle(data, nodes) {
			this.table_show = true
			this.id = data.id
			this.sole_id = data.id
			this.tableName = data.label
			this.serial = '1'
			if (data.id == undefined) {
				return false
			}

			this.$nextTick(() => {
				let list = [data];
				//checkList是树结构数据
				this.tree_structure = list;

				// 选择列表时进行回显表头
				let datalist = new FormData();
				datalist.append("id", this.sole_id);
				parameter.element_header_select(datalist).then((res) => {
					this.columnData = []
					let header = res.data
					if (header == '[]') {
						if (data.type != '宏基站' && data.type != '微基站' && data.type != 'PICO站' && data.parent_id == '') {
							this.columnData = [
								{
									label: "序号",
									prop: "0",
								},
								{
									label: "数量",
									prop: "1",
								},
							];
						} else {
							this.columnData = [
								{
									label: "序号",
									prop: "0",
								},

							];
						}
					} else {
						header = JSON.parse(JSON.parse(res.data))
						header.map((item, index) => {
							this.columnData.push(
								{
									label: item,
									prop: index,
								},

							)
						});
					}
				});
				//选择列表时进行回显表值
				let dataobj = new FormData();
				dataobj.append("id", this.sole_id);
				parameter.element_param_select(dataobj).then((res) => {
					this.dataSource = []
					let arr = res.data
					if (arr == '[]') {
						if (data.type != '宏基站' && data.type != '微基站' && data.type != 'PICO站' && data.parent_id == '') {
							this.dataSource = [
								{
									0: 1,
									
								},
							];
						} else {
							this.dataSource = [
								{
									0: 1,
								},
							];
						}
					} else {
						arr = JSON.parse(res.data)
						arr.map((item, index) => {
							let obj = {}
							item.map((e, i) => {
								obj[i] = e
							});
							this.dataSource.push(obj)
						});
					}
				});

				if (data.type != '') {
					this.Hide = false
				} else {
					this.Hide = true
				}
			});
		},
		//增加行
		AddRow() {
			const circle = this.dataSource[this.dataSource.length - 1]; //取出数组中第一个对象
			this.serial  =  circle['0']
			if (circle) {
				const newObj = {};
				this.serial++
				for (let key in circle) {
					//把第一个对象的属性都赋值给新对象newObj  然后每个属性的值都设置为空；
					newObj[key] = "";
					newObj['0'] = this.serial;
				}
				this.dataSource.push(newObj);
			}
		},
		//删除行
		RemoveRow() {
			if (this.dataSource.length > 1) {
				this.dataSource.pop();
			} else {
				this.$message.error("基础行无法删除");
			}
		},
		//增加列
		addColumn() {
			// 1、//列标题数组中 增加一个标题
			const columnObj = {};
			var propStr = "newline"; //自定义一个列属性；
			columnObj.prop = propStr + this.columnPropIndex; //拼接自增数
			columnObj.label = this.columnLabel;
			this.columnData.push(columnObj);
			this.columnPropIndex++; //自增数每次加一

			//2、数据包中每个对象增加一个生成的新属性
			this.dataSource.forEach((item, index) => {
				//遍历数据包
				//每个对象新加一个属性 每一行数据值默认给''
				if (index < this.dataSource.length - 1) {
					item[columnObj.prop] = "";
				} else {
					//最后一个给null  才会是删除列的按钮 不然是输入框
					item[columnObj.prop] = "";
				}
			});
		},
		// 删除列表
		RemoveColumn() {
			if (this.columnData.length > 1) {
				this.columnData.pop();
			} else {
				this.$message.error("基础列无法删除");
			}
		},
		//修改表头
		onBlur(val, index) {
			this.columnData.forEach((item, i) => {
				if (index === i) {
					item.label = val;
				}
			});
		},
		//修改表头
		renderHeader({ column, $index }) {
			return (
				<el-input
					v-model={column.label}
					blur={this.onBlur(column.label, $index)}
				/>
			);
		},
		//提交数据
		saveData() {
			//表头数据存储
			let header = []
			this.columnData.map((item, index) => {
				header.push(item.label)
			});
			let datalist = new FormData();
			datalist.append("id", this.sole_id);
			datalist.append("header", JSON.stringify(header));
			parameter.element_header_save(datalist).then((res) => {
			});

			//表值数据存储
			let data = []
			this.dataSource.map((item, index) => {
				let arr = []
				for (let key in item) {
					//for循环let key是对象里面的键
					arr.push(item[key])
				}
				data.push(arr)
			});
			let dataobj = new FormData();
			dataobj.append("id", this.sole_id);
			dataobj.append("data", JSON.stringify(data));
			parameter.element_param_save(dataobj).then((res) => {
			});
		},
	}
};
</script>
<style scoped lang="scss">
@import "./css/equipment.scss";
</style>