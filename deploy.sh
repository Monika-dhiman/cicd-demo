APP_NAME="local-cicd-prod"
#!/bin/sh

# ===== CONFIG =====
PROD_PATH="D:/Learning/local-cicd/local-cicd-prod"

echo "🚀 Starting Deployment..."

echo "📂 Cleaning production folder..."
rm -rf "$PROD_PATH"/*

echo "📂 Copying project files..."
cp -r . "$PROD_PATH"

cd "$PROD_PATH"

echo "📦 Installing dependencies..."
npm install

echo "🔄 Starting or Restarting application using ecosystem..."

pm2 startOrRestart ecosystem.config.js --env production

echo "✅ Deployment Completed!"