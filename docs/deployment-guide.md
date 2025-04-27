# GitHub Actions 部署指南

本文档介绍如何使用 GitHub Actions 自动部署 VitePress 站点到云服务器。

## 前置准备

1. 已配置好的 VitePress 项目
2. 一台云服务器（已运行`setup-server.sh`脚本）
3. GitHub 仓库

## 配置 SSH 密钥

1. 在本地生成 SSH 密钥对（如果没有）：

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/github_actions_deploy
```

2. 将公钥添加到服务器的`authorized_keys`：

```bash
# 复制公钥内容
cat ~/.ssh/github_actions_deploy.pub

# 登录到服务器
ssh your_username@your_server_ip

# 添加到authorized_keys
mkdir -p ~/.ssh
echo "你的公钥内容" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

3. 获取服务器的 known_hosts 信息：

```bash
ssh-keyscan -H your_server_ip >> ~/.ssh/known_hosts
cat ~/.ssh/known_hosts
```

## 配置 GitHub Secrets

在 GitHub 仓库设置中添加以下 Secrets：

1. `SSH_PRIVATE_KEY`：私钥内容（`cat ~/.ssh/github_actions_deploy`）
2. `KNOWN_HOSTS`：服务器的 known_hosts 内容
3. `SERVER_HOST`：服务器 IP 地址
4. `SERVER_USER`：服务器用户名

步骤：

1. 进入 GitHub 仓库 → Settings → Secrets → Actions
2. 点击"New repository secret"
3. 添加上述四个 Secrets

## 工作流程文件

已创建`.github/workflows/deploy.yml`文件，配置了自动部署流程。当你推送代码到 main 分支或手动触发时，GitHub Actions 会：

1. 检出代码
2. 安装依赖
3. 构建站点
4. 通过 SSH 将构建结果同步到服务器

## 手动触发部署

如需手动触发部署：

1. 进入 GitHub 仓库 → Actions
2. 选择"Deploy to Production"工作流
3. 点击"Run workflow"

## 故障排查

如遇部署问题：

1. 检查 GitHub Actions 日志
2. 确认服务器防火墙配置
3. 验证 SSH 密钥和权限配置
4. 检查服务器上的 Nginx 配置
