export default {
    // 站点配置
    title: "前端技术博客",
    description: "分享前端开发技术和经验",

    themeConfig: {
        // 导航栏
        nav: [
            { text: "首页", link: "/" },
            {
                text: "前端基础", items: [
                    { text: "HTML", link: "/categories/frontend/html" },
                    { text: "CSS", link: "/categories/frontend/css" },
                    { text: "JavaScript", link: "/categories/frontend/javascript" }
                ]
            },
            {
                text: "前端框架", items: [
                    { text: "Vue", link: "/categories/frameworks/vue" },
                    { text: "React", link: "/categories/frameworks/react" },
                    { text: "Angular", link: "/categories/frameworks/angular" },
                    { text: "Next.js", link: "/categories/frameworks/nextjs" },
                    { text: "Nuxt.js", link: "/categories/frameworks/nuxtjs" }
                ]
            },
            {
                text: "服务端框架", items: [
                    { text: "Node.js", link: "/categories/server/nodejs" },
                    { text: "Nest.js", link: "/categories/server/nestjs" }
                ]
            },
            {
                text: "构建工具", items: [
                    { text: "Webpack", link: "/categories/build-tools/webpack" },
                    { text: "Vite", link: "/categories/build-tools/vite" }
                ]
            },
            {
                text: "部署", items: [
                    { text: "Docker", link: "/categories/deployment/docker" },
                    { text: "CI/CD", link: "/categories/deployment/cicd" }
                ]
            },
            {
                text: "前沿技术", items: [
                    { text: "WebComponents", link: "/categories/advanced/web-components" },
                    { text: "微前端", link: "/categories/advanced/micro-frontend" },
                    { text: "性能优化", link: "/categories/advanced/performance" }
                ]
            },
            { text: "关于", link: "/about/" },
            { text: "GitHub", link: "https://github.com/your-username/tech-blog" }
        ],

        // 侧边栏
        sidebar: {
            "/categories/": [
                {
                    text: "前端基础",
                    collapsed: false,
                    items: [
                        { text: "HTML", link: "/categories/frontend/html" },
                        { text: "CSS", link: "/categories/frontend/css" },
                        { text: "JavaScript", link: "/categories/frontend/javascript" }
                    ]
                },
                {
                    text: "前端框架",
                    collapsed: false,
                    items: [
                        { text: "Vue", link: "/categories/frameworks/vue" },
                        { text: "React", link: "/categories/frameworks/react" },
                        { text: "Angular", link: "/categories/frameworks/angular" },
                        { text: "Next.js", link: "/categories/frameworks/nextjs" },
                        { text: "Nuxt.js", link: "/categories/frameworks/nuxtjs" }
                    ]
                },
                {
                    text: "服务端框架",
                    collapsed: false,
                    items: [
                        { text: "Node.js", link: "/categories/server/nodejs" },
                        { text: "Nest.js", link: "/categories/server/nestjs" }
                    ]
                },
                {
                    text: "构建工具",
                    collapsed: false,
                    items: [
                        { text: "Webpack", link: "/categories/build-tools/webpack" },
                        { text: "Vite", link: "/categories/build-tools/vite" }
                    ]
                },
                {
                    text: "服务端与部署",
                    collapsed: false,
                    items: [
                        { text: "Docker", link: "/categories/deployment/docker" },
                        { text: "CI/CD", link: "/categories/deployment/cicd" }
                    ]
                },
                {
                    text: "前沿技术",
                    collapsed: false,
                    items: [
                        { text: "WebComponents", link: "/categories/advanced/web-components" },
                        { text: "微前端", link: "/categories/advanced/micro-frontend" },
                        { text: "性能优化", link: "/categories/advanced/performance" }
                    ]
                }
            ]
        },

        // 社交链接
        socialLinks: [
            { icon: "github", link: "https://github.com/your-username/tech-blog" }
        ],

        // 页脚
        footer: {
            message: "使用 VitePress 搭建",
            copyright: "Copyright © 2023-present"
        },

        // 搜索功能
        search: {
            provider: 'algolia',
            options: {
                appId: process.env.ALGOLIA_APP_ID || '你的AppID',
                apiKey: process.env.ALGOLIA_API_KEY || '你的搜索API密钥',
                indexName: process.env.ALGOLIA_INDEX_NAME || '你的索引名称',
                locales: {
                    root: {
                        placeholder: '搜索文档',
                        translations: {
                            button: {
                                buttonText: '搜索',
                                buttonAriaLabel: '搜索'
                            },
                            modal: {
                                searchBox: {
                                    resetButtonTitle: '清除查询',
                                    resetButtonAriaLabel: '清除查询',
                                    cancelButtonText: '取消',
                                    cancelButtonAriaLabel: '取消'
                                },
                                startScreen: {
                                    recentSearchesTitle: '搜索历史',
                                    noRecentSearchesText: '没有搜索历史',
                                    saveRecentSearchButtonTitle: '保存至搜索历史',
                                    removeRecentSearchButtonTitle: '从搜索历史中移除',
                                    favoriteSearchesTitle: '收藏',
                                    removeFavoriteSearchButtonTitle: '从收藏中移除'
                                },
                                errorScreen: {
                                    titleText: '无法获取结果',
                                    helpText: '你可能需要检查你的网络连接'
                                },
                                footer: {
                                    selectText: '选择',
                                    navigateText: '切换',
                                    closeText: '关闭',
                                    searchByText: '搜索提供者'
                                },
                                noResultsScreen: {
                                    noResultsText: '无法找到相关结果',
                                    suggestedQueryText: '你可以尝试查询',
                                    reportMissingResultsText: '你认为该查询应该有结果？',
                                    reportMissingResultsLinkText: '点击反馈'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
} 