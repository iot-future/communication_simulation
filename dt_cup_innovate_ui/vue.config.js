
/**
 * publicPath:部署应用包时的基本 URL,用法和 webpack 本身的 output.publicPath一致,
 * 可以通过三元运算去配置dev和prod环境, publicPath: process.env.NODE_ENV === 'production' ? '/prod/' : './'
 * outputDir:build 时输出的文件目录
 * assetsDir: 放置静态文件夹目录
 * 
 * ------
 * 注意！！！更改本配置文件，必须重新启动项目，否则无效！！！
 * ------
 * 
 */
const path = require('path');
const resolve = (dir) => path.join(__dirname, '.', dir);

module.exports = {
    // productionSourceMap: false,
    publicPath: './', 
    outputDir: 'dist',
    assetsDir: 'assets',
    devServer: {
        port: 8080,
        host: 'localhost',//指定要使用的主机IP。默认情况下这是localhost。
        open: true, //自动启动浏览器
		hot: true, //热更新替换，更新页面
        compress: true, //为所服务的一切启用gzip压缩
		https: false, //是否启用 https
		// 代理
		proxy: {
		  '/api': {
			target: 'http://172.24.230.24:7005/',
		    // secure: true,  // https 的时候 使用该参数
		    changeOrigin: true,  // 是否跨域
		    pathRewrite: {
		      '^/api' : ''  // 重写路径
		    }
		  }
		}
    },
	// 别名设置
	chainWebpack: (config) => {
		config.resolve.alias
			.set('@', resolve('src')) 
			.set('api', resolve('src/api'))
			.set('image', resolve('src/image'))
			.set('tools', resolve('src/tools'));
	},
	publicPath:"/",
	outputDir:"dist"
	
}    
	    