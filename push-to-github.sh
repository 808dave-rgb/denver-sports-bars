#!/bin/bash
# Quick GitHub Push Script

echo "🚀 Denver Sports Bars - GitHub Upload Script"
echo ""
echo "This script will push your visualizations to GitHub"
echo ""
read -p "Enter your GitHub username: " USERNAME
echo ""
echo "Great! Now follow these steps:"
echo ""
echo "1️⃣ Go to: https://github.com/new"
echo "2️⃣ Repository name: denver-sports-bars"
echo "3️⃣ Set to: Public"
echo "4️⃣ Do NOT check 'Initialize with README'"
echo "5️⃣ Click 'Create repository'"
echo ""
read -p "Press ENTER when you've created the repo..."
echo ""
echo "📤 Pushing code to GitHub..."

cd /data/.openclaw/workspace/denver-sports-bars-github

git remote remove origin 2>/dev/null
git remote add origin https://github.com/${USERNAME}/denver-sports-bars.git
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! Code pushed to GitHub"
    echo ""
    echo "🌐 View your repo: https://github.com/${USERNAME}/denver-sports-bars"
    echo ""
    echo "Now enable GitHub Pages:"
    echo "1. Go to: https://github.com/${USERNAME}/denver-sports-bars/settings/pages"
    echo "2. Under 'Source', select branch: main"
    echo "3. Click Save"
    echo "4. Wait 2 minutes"
    echo "5. Visit: https://${USERNAME}.github.io/denver-sports-bars/"
    echo ""
    echo "🎉 Your visualizations will be live!"
else
    echo ""
    echo "⚠️ Push failed. You'll need a Personal Access Token."
    echo ""
    echo "Quick fix:"
    echo "1. Go to: https://github.com/settings/tokens"
    echo "2. Click 'Generate new token (classic)'"
    echo "3. Give it a name: 'Denver Sports Bars'"
    echo "4. Check: 'repo' permissions"
    echo "5. Generate token"
    echo "6. Copy the token"
    echo "7. Run this script again"
    echo "8. When prompted for password, paste the TOKEN (not your GitHub password)"
fi
