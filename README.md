# 前端技术博客

基于 VitePress 构建的前端技术博客，分享前端开发技术和经验。

## 特点

- 🚀 使用 VitePress 构建，速度快
- 📚 内容丰富，涵盖前端各个方面
- 🎨 界面美观，用户体验好
- 🔄 自动化部署，使用 GitHub Actions

## 本地开发

```bash
# 克隆仓库
git clone https://github.com/your-username/tech-blog.git
cd tech-blog

# 安装依赖
npm install

# 启动开发服务器
npm run docs:dev
```

## 构建

```bash
# 构建静态文件
npm run docs:build

# 预览构建结果
npm run docs:preview
```

## 内容结构

```
docs/
├── index.md           # 首页
├── about/             # 关于页面
│   └── index.md
├── categories/        # 技术分类
│   ├── index.md
│   ├── frontend/      # 前端基础
│   │   ├── html.md
│   │   ├── css.md
│   │   └── javascript.md
│   ├── frameworks/    # 前端框架
│   │   ├── vue.md
│   │   ├── react.md
│   │   └── angular.md
│   ├── build-tools/   # 构建工具
│   │   ├── webpack.md
│   │   └── vite.md
│   ├── server/        # 服务端
│   │   └── nodejs.md
│   ├── deployment/    # 部署
│   │   ├── docker.md
│   │   └── cicd.md
│   └── advanced/      # 前沿技术
│       ├── web-components.md
│       ├── micro-frontend.md
│       └── performance.md
└── .vitepress/        # VitePress配置
    ├── config.js
    ├── theme/
    └── public/
        └── logo.svg
```

## 部署

本项目使用 GitHub Actions 自动部署到 GitHub Pages。每当推送到 main 分支时，会自动触发构建和部署流程。

## 贡献

欢迎贡献！如果你有任何问题或建议，请提交 Issue 或 Pull Request。

## 许可证

MIT
