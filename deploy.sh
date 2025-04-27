#!/bin/bash

# 服务器部署脚本
# 在GitHub Actions部署后自动重启Nginx

set -e

# 更新文件所有权
sudo chown -R www-data:www-data /var/www/tech-blog

# 检查Nginx配置是否有效
sudo nginx -t

# 重启Nginx服务
sudo systemctl restart nginx

echo "部署完成！网站已更新。" 