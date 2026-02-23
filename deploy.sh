#!/bin/sh

# ===== CONFIG =====
PROD_PATH="D:/Learning/local-cicd/local-cicd-prod"
APP_NAME="local-cicd-prod"

echo "🚀 Starting Deployment..."

echo "📂 Syncing files to production..."

# Copy all project files except node_modules and .git
rsync -av --delete \
  --exclude '.git' \
  --exclude 'node_modules' \
  ./ "$PROD_PATH"

cd "$PROD_PATH"

echo "📦 Installing dependencies..."
npm install

echo "🔄 Restarting application..."

pm2 stop $APP_NAME 2>nul
pm2 delete $APP_NAME 2>nul
pm2 start server.js --name $APP_NAME

echo "✅ Deployment Completed!"