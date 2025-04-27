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

构建后的文件位于 `docs/.vitepress/dist` 目录。

## 搜索功能配置

项目使用 Algolia DocSearch 提供搜索功能。请在 `.env` 文件中配置以下环境变量：

```
ALGOLIA_APP_ID=您的AppID
ALGOLIA_API_KEY=您的API密钥
ALGOLIA_INDEX_NAME=您的索引名称
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

## 自动部署

本项目使用 GitHub Actions 进行自动部署。当代码推送到`main`分支时，会自动构建并部署到服务器。

### 配置 GitHub Secrets

在项目的 GitHub 仓库中，需要配置以下 Secrets：

1. `SSH_PRIVATE_KEY`: 用于 SSH 连接服务器的私钥
2. `KNOWN_HOSTS`: 服务器的 known_hosts 内容
3. `SERVER_HOST`: 服务器 IP 地址或域名
4. `SERVER_USER`: 服务器用户名

### 配置服务器

1. 确保服务器上已安装 Nginx
2. 创建目录: `/var/www/tech-blog`
3. 确保`deploy.sh`脚本有执行权限:
   ```bash
   chmod +x /var/www/tech-blog/deploy.sh
   ```
4. 配置部署用户对`/var/www/tech-blog`目录有写权限
5. 配置部署用户可以无密码执行 sudo 命令（用于重启 Nginx）

## 贡献

欢迎贡献！如果你有任何问题或建议，请提交 Issue 或 Pull Request。

## 许可证

MIT

```

```
