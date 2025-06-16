#  deploy.sh
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build:h5

# 进入生成的文件夹
cd dist/build/h5/

# 删除旧的 git 仓库
rm -rf .git

# 初始化 git
git init
git add -A
git commit -m 'deploy'

# 推送到 GitHub Pages
git push -f git@github.com:cwgpage/mine-uni.git master:pages

cd -