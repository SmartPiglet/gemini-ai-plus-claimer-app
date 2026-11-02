# Google AI Plus Portal — Official Web Hub & Distribution

[![Live Deployment: Vercel](https://img.shields.io/badge/deployment-Vercel-000000?style=flat-square&logo=vercel)](https://gemini-ai-plus-claimer.vercel.app/)
[![Platform: Windows 10 / 11](<https://img.shields.io/badge/platform-Windows%2010%20%2F%2011%20(64--bit)-0284c7?style=flat-square&logo=windows>)](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases) [![Linux](https://img.shields.io/badge/Linux-Wine%20launcher-77216F?style=flat-square&logo=linux)](#linux)
[![Version: v1.0.1](https://img.shields.io/badge/release-v1.0.1-38bdf8?style=flat-square&logo=github)](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/tag/v1.0.1)
[![WCAG 2.1 AA Compliant](https://img.shields.io/badge/accessibility-WCAG%202.1%20AA-10b981?style=flat-square)](https://www.w3.org/WAI/WCAG21/quickref/)
[![Telemetry: Zero](<https://img.shields.io/badge/telemetry-Zero%20(100%25%20Local)-10b981?style=flat-square>)](#-privacy--local-execution)

Official landing page and release distribution portal for **Google AI Plus Portal** — a lightweight, zero-telemetry Windows desktop utility engineered to automate promotional student onboarding and capture the canonical official Google One offer link for 12 months of complimentary Gemini Advanced and 2TB cloud storage.

🌐 **Live Web Hub**: [https://gemini-ai-plus-claimer.vercel.app](https://gemini-ai-plus-claimer.vercel.app/)  
📦 **Official Release (v1.0.1)**: [https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/tag/v1.0.1](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/tag/v1.0.1)

---

## 📁 Repository Structure

```
gemini-ai-plus-claimer-app/
├── 404.html          # Custom, restrained 404 error page matching homepage UI
├── index.html          # Semantic, accessible landing page (Tailwind CSS CDN)
├── robots.txt          # Search engine crawler directives & sitemap reference
├── sitemap.xml         # XML sitemap for SEO discovery
├── site.webmanifest    # Web app manifest for installable/bookmark metadata
├── README.md           # Project documentation and deployment guide
├── CHANGELOG.md        # Comprehensive version history & release changelog
├── .prettierrc         # Project-level Prettier code formatting rules
├── .prettierignore     # Files excluded from Prettier formatting
├── .gitignore          # Git exclusion rules
├── .vscode/
│   ├── settings.json   # Workspace editor formatting rules (formatOnSave)
│   └── extensions.json # Recommended VS Code extensions (Prettier, Tailwind)
├── css/
│   └── style.css       # Custom scrollbars, focus rings & prefers-reduced-motion
├── js/
│   └── app.js          # Direct download routing, mobile drawer, a11y live announcer
├── linux/
│   ├── run-portal.sh             # Linux launcher for the Windows binary via Wine
│   └── run-portal-ssh-termux.sh  # SSH/headless launcher with Android Chrome handoff
└── images/
    ├── app_icon.ico    # Multi-resolution Windows application icon
    ├── app_icon.png    # High-resolution brand icon (512x512)
    ├── og-image.png    # Official 1200x630 OpenGraph & Twitter social preview banner
    ├── qrcode-bmc.png  # Buy Me a Coffee donation QR code
    ├── qrcode-gcash.JPG# GCash donation QR code
    └── shuffle.png     # UI accessory icon
```

---

## ⚡ Key Features of the Landing Page

### 1. Universal Multi-Browser Engine (New in v1.0.1)

- **Intelligent 5-Tier Discovery Cascade**: Detects and binds to existing Chromium browsers on the user's PC:
  1. Google Chrome channel (`chrome`)
  2. Microsoft Edge channel (`msedge` — pre-installed on 100% of Windows 10 & 11 PCs)
  3. Direct scan for Brave Browser, Google Chrome, Microsoft Edge, Opera, and Vivaldi
  4. Local Playwright cache (`%LOCALAPPDATA%\ms-playwright`)
  5. Unbundled fallback
- **Zero-Bloat Guarantee**: Runs out-of-the-box without downloading or bundling 400MB browser runtimes.

### 2. Transparent GitHub Releases Distribution & Open-Source Integrity

- **GitHub Releases Distribution Hub**: All download buttons and CTAs route directly to the official [GitHub Release Hub (v1.0.1)](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/tag/v1.0.1), ensuring transparent hosting, binary integrity verification (SHA-256), and compliance with Google Safe Browsing standards.
- **Open-Source Transparency**: Prominent [GitHub Repository](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app) verification badge directly on the hero section, reinforcing community trust, verifiable source code, and zero-credential-harvesting architecture.

### 2. Accessibility (WCAG 2.1 AA Compliance)

- **Bypass Blocks (`2.4.1`)**: Accessible keyboard "Skip to main content" link placed at the top of `<body>`.
- **Landmark Regions**: Proper semantic structure using `<header role="banner">`, `<main id="main-content">`, `<footer role="contentinfo">`, and uniquely labeled navigation regions.
- **Screen Reader Announcer (`4.1.3`)**: Dynamic `aria-live="polite"` region alerts assistive tech users when code snippets or hashes are copied to clipboard.
- **Sanitized Decorative SVGs (`1.1.1`)**: All decorative inline SVGs contain `aria-hidden="true" focusable="false"`.
- **Reduced Motion (`2.3.3` & `2.2.2`)**: Media queries automatically disable smooth scrolling and blinking cursors for visitors with vestibular motion sensitivities.
- **High-Contrast Palette (`1.4.3`)**: All body and disclaimer typography exceeds 7:1 contrast ratios on dark slate backgrounds.

### 3. SEO & Rich Social Previews

- **High-Resolution OpenGraph & Twitter Cards**: 1200&times;630 `og:image` and `summary_large_image` Twitter card for rich previews on Discord, Telegram, X, and Slack.
- **Structured Data (JSON-LD)**: `SoftwareApplication` and `WebSite` schemas providing Google with software version, license price ($0.00), OS compatibility, and author details for rich search snippets.
- **Search Engine Discoverability**: Deployed `robots.txt` and `sitemap.xml` referencing canonical URLs.

### 4. Telemetry & Speed Insights

- Integrated **Vercel Web Analytics** (`/_vercel/insights/script.js`) for privacy-friendly traffic analysis.
- Integrated **Vercel Speed Insights** (`/_vercel/speed-insights/script.js`) for real-user Core Web Vitals monitoring (LCP, FID, CLS).

### 5. Custom 404 Error Page & Universal Routing

- **Design Alignment**: Built with restrained typography, matching the slate dark palette (`#090d16`), full-fidelity sticky navbar, and legal footer for consistent branding.
- **Dual-Environment Support**: Features an inline environment-aware `<base>` fallback and JavaScript link adapter (`js/app.js`) that supports both local offline testing (`file://`) and live Vercel deployments (`http://` / `https://`).
- **Layout Shift Elimination**: Employs `scrollbar-gutter: stable; overflow-y: scroll;` in `css/style.css` so transitioning between the full-height landing page and 404 error page causes zero horizontal jitter.
- **Search Engine Friendly**: Tagged with `<meta name="robots" content="noindex, follow" />` and excluded in `robots.txt` / `sitemap.xml` to prevent dead links from polluting search indices.

---

## 🚀 Deployment (Vercel)

The landing page is optimized for instant static hosting on Vercel with zero build configurations required:

1. Connect `nmrisrl11/gemini-ai-plus-claimer-app` to your Vercel account.
2. Set Framework Preset to **Other** (Plain HTML).
3. The root directory `/` serves `index.html`, `css/`, `js/`, and `images/`.
4. Any push to `main` automatically triggers deployment and activates Vercel Analytics and Speed Insights.

---

## 📦 Release Package Details (v1.0.1)

| Attribute              | Specification                                                      |
| :--------------------- | :----------------------------------------------------------------- |
| **Release Version**    | `v1.0.1` (Stable)                                                  |
| **Release Archive**    | `Google AI Plus Portal v1.0.1 by nmrisrl11.zip`                    |
| **Application Binary** | `Google AI Plus Portal v1.0.1.exe`                                 |
| **Target OS**          | Windows 10 / Windows 11 (64-bit)                                   |
| **Package Type**       | Single portable binary (Zero installation)                         |
| **SHA-256 Checksum**   | `05D5D3B04C192BC90D2F835F7FC741FCC702E16A38B26FC7C5836D3AE7E7EE28` |

### Checksum Verification in PowerShell:

```powershell
Get-FileHash "Google AI Plus Portal v1.0.1.exe" -Algorithm SHA256
```

---

## 🐧 Linux

The v1.0.1 release contains a Windows executable, not a native Linux build. Linux users
can run that official binary through [Wine](https://www.winehq.org/) after verifying the
published SHA-256 checksum:

```bash
# Debian/Ubuntu example
sudo apt install wine

# Extract the release archive, then launch the executable
./linux/run-portal.sh "/path/to/Google AI Plus Portal v1.0.1.exe"
```

The launcher fails clearly when Wine or the executable is missing. A native Linux binary
requires the private automation source repository referenced in `AGENT.md`; this public
distribution repository does not contain that source.

### Raspberry Pi over SSH from Termux

For a Linux-native/headless build installed on a Raspberry Pi, run the helper from
Termux. It forwards the remote command over SSH, extracts the first HTTPS link printed
by the command, and opens it in Chrome on Android:

```bash
pkg install openssh
chmod +x linux/run-portal-ssh-termux.sh
./linux/run-portal-ssh-termux.sh pi@raspberrypi.local
```

The default remote command is `google-ai-plus-portal --headless`. To use another
Linux-native implementation, pass its command after the SSH target:

```bash
./linux/run-portal-ssh-termux.sh pi@raspberrypi.local \
  /opt/google-ai-plus-portal/bin/portal --headless
```

The remote command must print the generated HTTPS link to stdout. The helper first
tries Chrome's Android package and falls back to `termux-open-url`.

## 🛠️ Local Development & Code Quality

This project enforces strict code formatting using Prettier and VS Code editor hooks:

```bash
# Check formatting
npx prettier --check .

# Auto-format all files
npx prettier --write .
```

---

## ⚖️ Disclaimer & Non-Affiliation

This project is an independent utility provided strictly for convenience, personal educational testing, and research. This project is **not** affiliated with, sponsored by, or endorsed by Google LLC, Alphabet Inc., or Internshala. Google, Google One, and Gemini are trademarks of Google LLC.
