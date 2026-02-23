#!/bin/sh

PROD_PATH="D:/Learning/local-cicd/local-cicd-prod"
APP_NAME="local-cicd-prod"

echo "🚀 Starting Deployment..."

cd "$PROD_PATH"

echo "🔄 Pulling latest code..."
git pull origin main

echo "📦 Installing dependencies..."
npm install

echo "🔄 Restarting app..."
pm2 startOrRestart ecosystem.config.js --env production

echo "✅ Deployment Completed!"