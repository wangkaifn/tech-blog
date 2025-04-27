#!/bin/bash
set -e

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 打印带颜色的信息
info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
  echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
  echo -e "${RED}[ERROR]${NC} $1"
  exit 1
}

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
   error "此脚本必须以root权限运行。请使用sudo运行。"
fi

# 更新系统
info "更新系统包..."
apt-get update && apt-get upgrade -y

# 安装必要的软件
info "安装必要的软件..."
apt-get install -y nginx curl git

# 配置防火墙
info "配置防火墙规则..."
if ! command -v ufw &> /dev/null; then
    apt-get install -y ufw
fi

ufw allow 'Nginx Full'
ufw allow 22/tcp
ufw --force enable

# 配置Nginx
info "配置Nginx..."
cat > /etc/nginx/sites-available/tech-blog << EOF
server {
    listen 80;
    listen [::]:80;

    # 域名设置
    server_name front-end.qingjiai.com;
    
    # 网站根目录
    root /var/www/tech-blog;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }

    # 错误页面
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /var/www/tech-blog;
    }
}
EOF

# 创建网站目录
info "创建网站目录..."
mkdir -p /var/www/tech-blog

# 创建测试页面
cat > /var/www/tech-blog/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Tech Blog - Coming Soon</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }
        .container {
            text-align: center;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tech Blog</h1>
        <p>Coming soon! Site is being prepared for deployment.</p>
    </div>
</body>
</html>
EOF

# 设置适当的权限
info "设置目录权限..."
chown -R www-data:www-data /var/www/tech-blog
chmod -R 755 /var/www

# 启用站点
info "启用Nginx站点配置..."
ln -sf /etc/nginx/sites-available/tech-blog /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# 测试Nginx配置
info "测试Nginx配置..."
nginx -t

# 重启Nginx
info "重启Nginx服务..."
systemctl restart nginx

info "======================="
info "服务器设置完成!"
info "请记得更新Nginx配置中的域名，然后再次重启Nginx"
info "使用以下命令编辑配置："
info "  nano /etc/nginx/sites-available/tech-blog"
info "完成后重启Nginx："
info "  systemctl restart nginx"
info "=======================" 