# 前端项目的 CI/CD 实践

持续集成（Continuous Integration, CI）和持续部署（Continuous Deployment, CD）是现代软件开发流程中不可或缺的一部分。本文将介绍如何为前端项目设置 CI/CD 流程，特别是使用 GitHub Actions 实现自动化部署。

## 什么是 CI/CD？

- **持续集成（CI）**: 开发人员频繁地将代码集成到主分支，每次集成都通过自动化构建和测试来验证，从而尽早发现问题。
- **持续部署（CD）**: 将已通过所有测试的代码自动部署到生产环境中。

## 为什么前端项目需要 CI/CD？

前端项目使用 CI/CD 有很多好处：

1. **更快地发现错误** - 通过自动化测试，可以在问题被合并到主分支之前发现它们
2. **保持代码质量** - 使用代码格式化和 lint 检查来维护代码风格
3. **自动化部署** - 减少手动部署的工作量和错误
4. **更频繁的发布** - 可以更快、更安全地发布新功能
5. **更好的协作** - 团队成员可以看到构建状态，知道什么时候可以安全地合并代码

## GitHub Actions 介绍

GitHub Actions 是 GitHub 提供的 CI/CD 工具，它使你能够直接在 GitHub 仓库中创建自定义的软件开发生命周期工作流程。

### 主要概念

- **工作流（Workflow）**: 一个可配置的自动化过程，由一个或多个任务（job）组成
- **事件（Event）**: 触发工作流的特定活动，如 push、pull request 或定时触发
- **任务（Job）**: 工作流中的一系列步骤，可以在同一运行器上执行
- **步骤（Step）**: 可以运行命令或操作的单个任务
- **操作（Action）**: 可重用的工作流步骤单元

## 为 VitePress 博客设置 GitHub Actions

我们的 VitePress 博客使用以下 GitHub Actions 工作流程来自动构建和部署到 GitHub Pages：

```yaml
name: Deploy to GitHub Pages

on:
  # 在main分支有推送时触发
  push:
    branches: [main]
  # 允许手动触发部署
  workflow_dispatch:

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: "18"
          cache: "npm"

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run docs:build

      - name: Deploy
        uses: JamesIves/github-pages-deploy-action@v4
        with:
          folder: docs/.vitepress/dist # 构建输出目录
          branch: gh-pages # 部署到gh-pages分支
          clean: true
```

### 工作流程说明

1. **触发条件**:

   - 当代码推送到 main 分支时
   - 手动触发（通过 GitHub 界面）

2. **任务**:

   - 在 Ubuntu 最新版本上运行一个名为"build-and-deploy"的任务

3. **步骤**:
   - **Checkout**: 获取仓库代码
   - **Setup Node.js**: 设置 Node.js 环境
   - **Install dependencies**: 安装项目依赖
   - **Build**: 构建 VitePress 站点
   - **Deploy**: 使用 JamesIves/github-pages-deploy-action 部署到 gh-pages 分支

## 如何设置 GitHub Pages

1. 在 GitHub 仓库中，进入"Settings" > "Pages"
2. 在"Source"部分，选择"Deploy from a branch"
3. 在"Branch"下拉菜单中，选择"gh-pages"分支和"/(root)"文件夹
4. 点击"Save"

完成以上步骤后，GitHub Pages 会自动从 gh-pages 分支提供内容。

## 高级 CI/CD 实践

### 添加测试到 CI 流程

可以在构建步骤前添加测试步骤：

```yaml
- name: Test
  run: npm test
```

### 添加代码质量检查

可以添加 ESLint 和 Prettier 检查：

```yaml
- name: Lint
  run: npm run lint
```

### 只在特定文件更改时触发

可以配置工作流只在特定文件更改时触发：

```yaml
on:
  push:
    branches: [main]
    paths:
      - "docs/**"
      - "package.json"
      - "package-lock.json"
```

### 通知构建结果

可以配置构建完成或失败时通过邮件或 Slack 通知团队成员。

## 常见问题与解决方案

### 构建失败

- 检查依赖是否正确安装
- 查看错误日志，找出失败原因
- 确保所有环境变量都已正确设置

### 部署成功但网站内容不更新

- 检查 gh-pages 分支是否正确更新
- 确认 GitHub Pages 设置使用的是正确的分支
- 清除浏览器缓存

## 结论

通过 GitHub Actions 为前端项目设置 CI/CD 流程，可以大大提高开发效率，减少手动部署的错误，并确保部署的代码质量。对于 VitePress 博客项目，这种自动化部署方式尤其有用，它使你能够专注于内容创作，而不必担心部署细节。
