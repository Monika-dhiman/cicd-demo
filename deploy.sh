#!/bin/sh

# ===== CONFIG =====
PROD_PATH="D:/Learning/local-cicd/local-cicd-prod"
APP_NAME="local-cicd-prod"

echo "🚀 Starting Deployment..."

echo "📂 Cleaning production folder..."

# Remove old files
rm -rf "$PROD_PATH"/*

echo "📂 Copying project files..."

# Copy everything except .git and node_modules
cp -r * "$PROD_PATH"

cd "$PROD_PATH"

echo "📦 Installing dependencies..."
npm install

echo "🔄 Restarting application..."

pm2 stop $APP_NAME 2>nul
pm2 delete $APP_NAME 2>nul
pm2 start server.js --name $APP_NAME

echo "✅ Deployment Completed!"