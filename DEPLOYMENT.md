# 🚀 Deployment Guide

This guide explains how to deploy the SARLab website to GitHub Pages.

## Prerequisites

You need a **GitHub account** and the **GitHub CLI** installed.

### Install GitHub CLI

**macOS:**
```bash
brew install gh
```

**Ubuntu/Debian:**
```bash
sudo apt install gh
# or
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

**Windows:**
```powershell
winget install --id GitHub.cli
```

Or download from: https://cli.github.com/

## Step 1: Authenticate with GitHub

Run this command and follow the prompts:

```bash
gh auth login
```

Select:
- **GitHub.com**
- **HTTPS** (recommended)
- **Login with a web browser**

This will open a browser to authenticate.

## Step 2: Run the Setup Script

From the `sar-startup-website` directory:

```bash
./deploy-setup.sh
```

This script will:
1. ✅ Check authentication
2. 📁 Create a GitHub repository
3. 🔧 Enable GitHub Pages
4. 🚀 Deploy the website

The script will ask you:
- Repository name (default: `sarlab-website`)
- Whether to make it private

## Step 3: Wait for Deployment

After the script completes, GitHub Actions will automatically build and deploy your site.

Check the status:
```bash
gh run watch
```

Or visit: `https://github.com/YOUR_USERNAME/REPO_NAME/actions`

## Step 4: View Your Website

Once deployment is complete (usually 1-2 minutes), your site will be live at:

```
https://YOUR_USERNAME.github.io/REPO_NAME
```

For example:
```
https://gabriel-otero.github.io/sarlab-website
```

## 🔄 Making Updates

Whenever you want to update the website:

```bash
# Edit files...

# Add changes
git add .

# Commit
git commit -m "Update website content"

# Push (this triggers automatic redeployment)
git push
```

The site will update automatically within 1-2 minutes.

## 📁 File Structure to Upload

If you prefer manual upload instead of GitHub Pages:

```
sar-startup-website/
├── index.html          (required)
├── assets/             (required)
│   ├── elias-mendez.jpg
│   ├── emiliano-casalini.png
│   ├── peter-brotzer.jpg
│   └── gabriel-otero.png
└── README.md
```

## 🛠️ Alternative Hosting Options

### Vercel (Free, Very Fast)
```bash
npm i -g vercel
vercel
```

### Netlify (Free)
1. Go to https://netlify.com
2. Drag and drop the `sar-startup-website` folder
3. Done!

### AWS S3
1. Create an S3 bucket
2. Enable static website hosting
3. Upload files
4. Configure CloudFront (optional, for HTTPS)

## ❓ Troubleshooting

### "gh: not authenticated"
Run: `gh auth login`

### "Repository already exists"
Choose a different repository name, or delete the existing one first.

### Site not showing up
- Check GitHub Actions status: `gh run watch`
- Ensure GitHub Pages is enabled in repository settings
- For private repos: Pages require authentication (use public for investor demos)

### Images not loading
Ensure the `assets/` folder is in the same directory as `index.html` and was committed to git.

## 📞 Support

- **GitHub CLI docs:** https://cli.github.com/manual/
- **GitHub Pages docs:** https://docs.github.com/en/pages
- **GitHub Actions docs:** https://docs.github.com/en/actions

## 📝 Custom Domain (Optional)

To use a custom domain like `sarlab.tech`:

1. Buy a domain from Namecheap, Cloudflare, etc.
2. Add a file named `CNAME` to your repository containing:
   ```
   sarlab.tech
   ```
3. Configure DNS:
   - A record: `185.199.108.153`
   - A record: `185.199.109.153`
   - A record: `185.199.110.153`
   - A record: `185.199.111.153`
4. Enable HTTPS in GitHub Pages settings
