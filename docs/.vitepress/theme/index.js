// 引入VitePress默认主题
import DefaultTheme from 'vitepress/theme'
// 引入自定义404页面
import NotFound from './NotFound.vue'

// 你可以在这里扩展默认主题
export default {
    ...DefaultTheme,
    // 覆盖NotFound组件
    NotFound
} 