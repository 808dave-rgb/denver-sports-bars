# 🚀 Deployment Instructions

## Option A: GitHub Pages (Recommended)

### Step 1: Create GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click "New repository" (or go to https://github.com/new)
3. Name it: `denver-sports-bars`
4. Set to **Public** (required for free GitHub Pages)
5. Do NOT initialize with README (we already have one)
6. Click "Create repository"

### Step 2: Push Code to GitHub

On your VPS, run these commands:

```bash
cd /data/.openclaw/workspace/denver-sports-bars-github

# Add your GitHub repo as remote (replace YOUR-USERNAME)
git remote add origin https://github.com/YOUR-USERNAME/denver-sports-bars.git

# Rename branch to main (GitHub's default)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Note:** GitHub will ask for authentication:
- Username: Your GitHub username
- Password: Use a [Personal Access Token](https://github.com/settings/tokens) (not your GitHub password)

### Step 3: Enable GitHub Pages

1. Go to your repo: `https://github.com/YOUR-USERNAME/denver-sports-bars`
2. Click **Settings** tab
3. Scroll to **Pages** (left sidebar)
4. Under "Source":
   - Branch: `main`
   - Folder: `/ (root)`
5. Click **Save**

### Step 4: Access Your Site

Wait 1-2 minutes, then visit:

```
https://YOUR-USERNAME.github.io/denver-sports-bars/
```

**Done!** Your site is live 🎉

### Custom Domain (Optional)

Want `denversportsbars.com` instead of `username.github.io/denver-sports-bars`?

1. Buy domain from Namecheap, GoDaddy, etc. (~$12/year)
2. In your domain's DNS settings, add:
   - Type: `A` record
   - Name: `@`
   - Value: `185.199.108.153` (GitHub Pages IP)
   - Also add: `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - Type: `CNAME`
   - Name: `www`
   - Value: `YOUR-USERNAME.github.io`
3. In GitHub Pages settings, add custom domain
4. Enable "Enforce HTTPS"

Wait 24 hours for DNS propagation.

---

## Option B: Netlify (Easier, No Git Required)

### Step 1: Sign Up

1. Go to [netlify.com](https://www.netlify.com)
2. Sign up (free account)

### Step 2: Deploy

#### Method 1: Drag & Drop (Easiest)

1. Download the folder `/data/.openclaw/workspace/denver-sports-bars-github/` to your computer
2. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
3. Drag the entire folder onto the page
4. Wait 30 seconds
5. Get instant URL: `https://random-name-12345.netlify.app`

#### Method 2: GitHub Integration (Better for updates)

1. Push code to GitHub (see Option A, Steps 1-2)
2. In Netlify, click "New site from Git"
3. Choose GitHub
4. Select your `denver-sports-bars` repo
5. Build settings:
   - Build command: (leave empty)
   - Publish directory: `/`
6. Click "Deploy site"

### Step 3: Custom Domain (Optional)

1. Click "Domain settings"
2. Click "Add custom domain"
3. Follow instructions

**Your site is live!** Netlify gives you:
- Free hosting
- Free SSL (HTTPS)
- Auto-deploys on Git push
- Instant rollbacks

---

## Option C: Download & View Locally

### Download Files

From VPS:
```bash
cd /data/.openclaw/workspace/denver-sports-bars-github
tar -czf ../denver-sports-bars.tar.gz .
```

Transfer to your computer:
```bash
scp user@93.188.160.13:/data/.openclaw/workspace/denver-sports-bars.tar.gz ~/Downloads/
```

### Extract & Open
```bash
cd ~/Downloads
tar -xzf denver-sports-bars.tar.gz
open index.html  # Mac
# or
xdg-open index.html  # Linux
# or
start index.html  # Windows
```

---

## Option D: VPS Public Access

If your VPS has a web server (nginx/apache):

```bash
# Copy files to web root
sudo cp -r /data/.openclaw/workspace/denver-sports-bars-github/* /var/www/html/sports-bars/

# Access at:
http://93.188.160.13/sports-bars/
```

---

## 📱 View Right Now (Temporary)

The web server is running on port 8080:

```
http://93.188.160.13:8080/download.html
```

**Note:** This only works while the Python server is running and port 8080 is open on the firewall.

---

## 🔄 Update Your Site

After making changes:

### GitHub Pages / Netlify (via Git):
```bash
cd /data/.openclaw/workspace/denver-sports-bars-github
# Make your edits...
git add .
git commit -m "Update bar information"
git push
```

GitHub Pages: Updates in 1-2 minutes  
Netlify: Updates in 30 seconds

### Netlify (Drag & Drop):
Just drag the updated folder again - it will replace the old version

---

## 🎨 Customize

### Colors
Edit CSS in `index.html` and `denver-sports-bars.html`:
```css
/* Change primary color */
background: #3b82f6; /* Change to your color */
```

### Logo
Add to header in HTML files:
```html
<h1>
  <img src="logo.png" alt="Logo" style="height: 40px;">
  Denver Sports Bars
</h1>
```

### Content
- Edit `README.md` for description
- Edit `denver-sports-bars-google-maps.csv` to add/remove bars
- HTML files auto-update from CSV

---

## ✅ Checklist

- [ ] Created GitHub repository
- [ ] Pushed code to GitHub
- [ ] Enabled GitHub Pages
- [ ] Site accessible at github.io URL
- [ ] (Optional) Added custom domain
- [ ] (Optional) Enabled HTTPS
- [ ] Shared link with team

---

## 🆘 Troubleshooting

**"Repository not found" when pushing:**
- Check remote URL: `git remote -v`
- Update: `git remote set-url origin https://github.com/YOUR-USERNAME/denver-sports-bars.git`

**GitHub Pages not working:**
- Wait 2-3 minutes after enabling
- Check Settings → Pages for errors
- Ensure repo is Public
- Ensure branch is `main` (not `master`)

**Map not showing:**
- Check browser console (F12) for errors
- Ensure CSV file is in same directory as index.html
- Try denver-sports-bars.html (simpler version)

**Permission denied when pushing:**
- Use Personal Access Token instead of password
- Create at: https://github.com/settings/tokens

---

## 📞 Need Help?

Open an issue on the repo or contact Phil!

**Happy deploying! 🚀**
