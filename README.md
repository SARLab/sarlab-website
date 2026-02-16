# SARLab Startup Website

> Modern investor-facing landing page for SARLab — pioneering Synthetic Aperture Radar technology.

## 🌐 Live Website

**URL:** [https://sarlab.github.io/sarlab-website](https://sarlab.github.io/sarlab-website)

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/SARLab/sarlab-website.git
cd sarlab-website

# Open in browser (macOS)
open index.html

# Or serve locally
python3 -m http.server 8000
```

## 📁 Project Structure

```
sarlab-website/
├── index.html              # Main landing page
├── assets/                 # Team photos & images
│   ├── elias-mendez.jpg
│   ├── emiliano-casalini.png
│   ├── peter-brotzer.jpg
│   └── gabriel-otero.png
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Pages auto-deployment
└── README.md
```

## 🎨 Design Features

- **Modern Dark Theme** — Professional, tech-forward design
- **Fully Responsive** — Works on all devices
- **Smooth Animations** — Scroll-based effects
- **Zero Dependencies** — Pure HTML/CSS/JS with Google Fonts only
- **SEO Optimized** — Meta tags and semantic HTML

## 🔄 Deployment

This project uses **GitHub Actions** for automatic deployment to GitHub Pages.

### Setup Instructions

1. **Create a new repository** on GitHub
2. **Push this code** to the repository
3. **Enable GitHub Pages** in repository settings
4. **Done!** The site auto-deploys on every push to `main`

### Manual Deployment

Upload `index.html` and the `assets/` folder to any static hosting:
- GitHub Pages *(free)*
- Vercel *(free)*
- Netlify *(free)*
- AWS S3
- Traditional web hosting

## 📝 Customization

### Update Contact Information
Edit line ~735 in `index.html`:
```html
<a href="mailto:your-email@domain.com" class="contact-email">
```

### Update Team Information
Team photos and bios are in the Team section (lines ~920-990).

### Update Statistics
Hero stats are on lines ~385-400.

## 📄 License

© 2026 SARLab. All rights reserved.
