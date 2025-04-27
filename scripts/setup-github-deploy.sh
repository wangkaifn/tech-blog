#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# 消息函数
print_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# 检查是否已安装必要工具
if ! command -v gh &> /dev/null; then
  print_error "GitHub CLI (gh) 未安装。请先安装: https://cli.github.com/"
  exit 1
fi

# 确保用户已登录GitHub CLI
if ! gh auth status &> /dev/null; then
  print_error "请先登录GitHub CLI"
  echo "运行: gh auth login"
  exit 1
fi

# 获取仓库信息
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null)
if [ -z "$REPO" ]; then
  print_error "无法获取GitHub仓库信息。请确保当前目录是Git仓库并且关联了GitHub远程仓库。"
  exit 1
fi

print_info "配置将应用到GitHub仓库: $REPO"

# 确认继续
read -p "是否继续? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  print_info "操作已取消"
  exit 0
fi

# 创建SSH密钥对
print_info "创建新的部署SSH密钥..."
mkdir -p ./.ssh-deploy
ssh-keygen -t ed25519 -f ./.ssh-deploy/github-deploy -N "" -C "github-actions-deploy"

if [ $? -ne 0 ]; then
  print_error "生成SSH密钥失败"
  exit 1
fi

print_info "SSH密钥已创建"

# 获取服务器信息
read -p "输入服务器地址 (例如: example.com 或 IP): " SERVER_HOST
read -p "输入SSH用户名: " SERVER_USER

# 生成known_hosts
print_info "生成known_hosts记录..."
ssh-keyscan -H $SERVER_HOST > ./.ssh-deploy/known_hosts 2>/dev/null

# 显示公钥
print_info "以下是生成的公钥，需要添加到服务器的authorized_keys中:"
echo
cat ./.ssh-deploy/github-deploy.pub
echo

# 询问是否添加密钥到服务器
read -p "是否自动将密钥添加到服务器? (需要输入服务器密码) (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  ssh-copy-id -i ./.ssh-deploy/github-deploy.pub $SERVER_USER@$SERVER_HOST
else
  print_warning "您需要手动将上述公钥添加到服务器的 ~/.ssh/authorized_keys 文件中"
fi

# 添加GitHub Actions secrets
print_info "添加GitHub Actions secrets..."

# 读取私钥和known_hosts
SSH_PRIVATE_KEY=$(cat ./.ssh-deploy/github-deploy)
KNOWN_HOSTS=$(cat ./.ssh-deploy/known_hosts)

# 添加secrets到GitHub
gh secret set SSH_PRIVATE_KEY -b"$SSH_PRIVATE_KEY"
gh secret set KNOWN_HOSTS -b"$KNOWN_HOSTS"
gh secret set SERVER_HOST -b"$SERVER_HOST"
gh secret set SERVER_USER -b"$SERVER_USER"

if [ $? -ne 0 ]; then
  print_error "设置GitHub Secrets失败。请确保您有仓库写入权限。"
  exit 1
fi

print_info "GitHub Actions secrets已设置完成!"

# 清理临时文件
read -p "是否删除本地生成的SSH密钥文件? (推荐保留备份) (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf ./.ssh-deploy
  print_info "本地SSH密钥文件已删除"
else
  print_info "密钥文件保留在 ./.ssh-deploy/ 目录中"
fi

print_info "设置完成! GitHub Actions现在可以部署到您的服务器了。"
print_info "确保已创建 .github/workflows/deploy.yml 文件以配置自动部署流程。" 