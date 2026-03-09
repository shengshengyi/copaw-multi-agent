#!/bin/bash

# 自动推送到 GitHub 脚本
# 每天凌晨1点和下午1点执行

PROJECT_DIR="/home/terrence/.copaw/workspaces/software"
LOG_FILE="/home/terrence/.copaw/workspaces/software/auto-push.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] 开始自动推送..." >> $LOG_FILE

cd $PROJECT_DIR

# 检查是否有更改需要提交
if [ -n "$(git status --porcelain)" ]; then
    echo "[$DATE] 发现未提交的更改" >> $LOG_FILE
    
    # 添加所有更改
    git add -A
    
    # 提交更改
    git commit -m "auto: 定时自动推送 [$DATE]"
    
    # 推送到 GitHub
    git push origin main 2>&1 >> $LOG_FILE
    
    if [ $? -eq 0 ]; then
        echo "[$DATE] ✅ 推送成功" >> $LOG_FILE
    else
        echo "[$DATE] ❌ 推送失败" >> $LOG_FILE
    fi
else
    echo "[$DATE] 没有需要提交的更改" >> $LOG_FILE
fi

echo "[$DATE] 完成" >> $LOG_FILE
echo "---" >> $LOG_FILE
