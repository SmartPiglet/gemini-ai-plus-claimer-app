# AGENT.md — Project Blueprint & AI Context Handoff

> **For Future AI Agents & Developers**:  
> This file is the primary context and architectural blueprint for the **Google AI Plus Portal** landing page and distribution hub (`gemini-ai-plus-claimer-app`). Read this document first before writing code, modifying layout, updating links, or making releases.

---

## 1. 📌 Executive Summary & Project Purpose

- **Product Name**: Google AI Plus Portal
- **Type**: High-conversion, accessible, zero-telemetry landing page & distribution hub
- **Production URL**: [https://gemini-ai-plus-claimer.vercel.app](https://gemini-ai-plus-claimer.vercel.app/)
- **Distribution Repository (Public)**: [https://github.com/nmrisrl11/gemini-ai-plus-claimer-app](https://github.com/nmrisrl11/gemini-ai-plus-claimer-app)
- **Underlying Desktop Software**: A standalone, native Windows 10/11 (64-bit) portable executable. Linux users can launch that binary through Wine using `linux/run-portal.sh`; this repository does not contain the private automation source needed for a native Linux build.
- **CRITICAL REPOSITORY BOUNDARY**:
  - `gemini-ai-plus-claimer-app` is the **PUBLIC** static landing page and compiled release distribution repository.
  - The actual Python automation source code is located in a **SEPARATE PRIVATE REPOSITORY** (`gemini-ai-plus-claimer`).
  - **DO NOT** commit Python automation source files, backend logic, or sensitive scripts into this public repository.

---

## 2. 🏗️ Tech Stack & Philosophy

| Layer               | Technology                            | Details                                                                                                                                       |
| :------------------ | :------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------------------------- |
| **Markup**          | HTML5 Semantic                        | Strictly structured with ARIA landmarks, WCAG 2.1 AA compliance, zero broken tags                                                             |
| **Styling**         | Tailwind CSS (CDN) + Custom CSS       | Loaded via Tailwind CDN (`tailwind.config` in `<head>`), dark slate theme palette (`#090d16` base, `#0f172a` cards, `#0284c7` sky brand)      |
| **Custom CSS**      | `css/style.css`                       | Restrained slate scrollbars, hairline focus-visible rings (`#38bdf8`), terminal blinking animation, `@media (prefers-reduced-motion: reduce)` |
| **Interactivity**   | Vanilla JavaScript (`js/app.js`)      | Single centralized `CONFIG` object, dynamic download routing, mobile drawer, accessible clipboard copy with live announcements                |
| **Fonts**           | Google Fonts                          | `Inter` (UI typography) & `JetBrains Mono` (code, terminal, and spec readouts)                                                                |
| **Code Formatter**  | Prettier                              | Project-scoped `.prettierrc` (tabs, tabWidth: 4, printWidth: 100), `.vscode/settings.json` formatOnSave enabled                               |
| **Hosting & CI/CD** | Vercel                                | Plain HTML framework preset; automatic deploys triggered on `git push origin main`                                                            |
| **Analytics**       | Vercel Web Analytics + Speed Insights | Client-side HTML quickstart snippets inside `<head>`                                                                                          |

---

## 3. 📂 Repository File Tree & Purpose

```
gemini-ai-plus-claimer-app/
├── AGENT.md            # You are here: comprehensive AI agent context and architecture
├── README.md           # User-facing repository overview, quickstart, and binary checksums
├── 404.html            # Custom 404 error page (dual file:// and http/https routing)
├── CHANGELOG.md        # Semantic Versioning change log (Keep a Changelog format)
├── index.html          # Core landing page (SEO, semantic markup, SVG icons, schema)
├── robots.txt          # Crawler instructions referencing canonical sitemap
├── sitemap.xml         # XML sitemap with weekly frequency for search engines
├── site.webmanifest    # Progressive web app / mobile bookmark metadata
├── .prettierrc         # Prettier formatting configuration
├── .prettierignore     # Prettier ignore patterns
├── .gitignore          # Git exclusion rules (ignores binaries, logs, temp files)
├── .vscode/
│   ├── settings.json   # VS Code formatOnSave and default formatter setup
│   └── extensions.json # Recommended VS Code extensions (Prettier, Tailwind)
├── css/
│   └── style.css       # Custom scrollbars, focus rings, reduced-motion overrides
├── js/
│   └── app.js          # Client-side configuration, download routing, a11y announcer
├── linux/
│   ├── run-portal.sh             # Linux launcher for the Windows binary via Wine
│   └── run-portal-ssh-termux.sh  # SSH/headless launcher with Android Chrome handoff
└── images/
    ├── app_icon.ico    # Multi-resolution Windows desktop icon (16x16 to 256x256)
    ├── app_icon.png    # High-resolution (512x512) master logo asset
    ├── og-image.png    # Official 1200x630 OpenGraph & Twitter large card social preview
    ├── qrcode-bmc.png  # Buy Me a Coffee QR code (160x160)
    ├── qrcode-gcash.JPG# GCash QR code (160x160)
    └── shuffle.png     # Randomize accessory icon
```

---

## 4. 🧭 Page Structure & UX Walkthrough

### 1. Header & Navigation (`<header role="banner">`)

- **Brand Logo**: High-res logo tile with scale transition on hover.
- **Desktop Nav**: Pill links (`Overview`, `How It Works`, `Features`, `Requirements`, `Support Dev`, `FAQ`).
- **Direct Download CTA**: Desktop-visible button triggering the `.zip` release.
- **Mobile Hamburger**: Accessible `<button id="mobile-menu-btn">` with `aria-controls="mobile-menu"`, `aria-expanded="false"`, `min-h-[44px] min-w-[44px]`, toggles mobile drawer with auto-close on navigate or <kbd>Esc</kbd>.

### 2. Hero Section

- **Status Badges**: `Windows 10 / 11 64-bit`, `v1.0.1 Portable`, and `Zero Telemetry`.
- **Primary Headline**: _"Automate your 1-Year Google AI Plus access. Locally. Effortlessly."_
- **Primary CTA**: Large Sky-600 button wired to direct `.zip` release asset.
- **Release History Link**: Subtitle link to view all releases on GitHub (`releases-link`).
- **Value Pills**: Checkmarks for _"No installation needed"_, _"Uses pre-installed Chrome or Edge"_, and _"100% Local credential storage"_.

### 3. Desktop Application UI Mockup (`role="region" aria-label="Desktop application interface preview"`)

- **Responsive Titlebar**: Displays short title `Google AI Plus Portal` on mobile (`< sm`), expanding to `Google AI Plus (1-Year Access) Portal — v1.0.1` on desktop (`≥ sm`). Visual window minimize/maximize/close icons marked `aria-hidden="true"`.
- **Account Setup Panel**: Simulated inputs for target Gmail and demographic info with a "Randomize Info" action button.
- **Execution Readout**: Visual progress indicator bar, pipeline status steps, and a live terminal log box with a blinking cyan cursor (`.term-cursor`).

### 4. "Why Navigate Gateways Manually?" Section

- Highlights the problem (complex multi-step educational portals, email verifications, timeouts) vs the utility's automated headless approach.

### 5. 5-Step Provisioning Pipeline (`#how-it-works`)

- Visual step progression with numbered glowing badges:
  1. Profile Setup & Demographic Generation
  2. Headless Chrome/Edge Automation Engine
  3. Safe Native OTP Prompt Dialog
  4. Canonical Link Extraction & Token Resolution
  5. One-Click Google One Access & Activation

### 6. Architectural Pillars (`#features`)

- 6 cards covering: Zero-Bloat Portable Engine, 100% Local & Private Execution, Canonical Link Extraction, Dual Delivery Support, Smart Challenge/Error Safety, and Built-in Diagnostics (<kbd>F12</kbd>).

### 7. Specifications & Expectations Grid (`#requirements`)

- Two symmetrically balanced cards using `flex flex-col justify-between`:
  - **System Requirements**: OS (Win 10/11), Browser (Chrome/Edge), Python (Not required for `.exe`), Account type (Personal Gmail), Package (Standalone portable), and Native Taskbar AppUserModelID note.
  - **Google One Expectations & Limits**: Explains the Google One `$0.00 Billed Today` identity verification payment method requirement, personal account eligibility, and single-use promo link rules.

### 8. Support Developer / Coffee (`#support`)

- Developer appreciation cards with QR codes (`qrcode-bmc.png` and `qrcode-gcash.JPG`) with `loading="lazy" decoding="async"` and explicit dimensions.

### 9. Frequently Asked Questions (`#faq`)

- Semantic `<details>` and `<summary>` accordions with custom chevron animations and keyboard accessibility for questions on account security, credit card requirement, Google policies, and diagnostics.

### 10. Footer (`<footer role="contentinfo">`)

- Navigation links wrapped in `<nav aria-label="Footer Navigation">`, developer profile, Back to top link, and thorough legal disclaimers.

### 11. Custom 404 Error Page (`404.html`)

- **Restrained Branding**: Matches the exact header navigation and uniform footer of `index.html`.
- **Status Badge**: Glowing cyan `Error 404` status pill.
- **Copywriting**: Clean, concise copy ("Page not found") without overwhelming marketing sections.
- **Actions**: Two focused call-to-action buttons: "Back to Homepage" and "Download App".
- **Robots Directive**: Marked with `<meta name="robots" content="noindex, follow" />` to safeguard SEO integrity.

---

## 5. 🔗 Release & Direct Download Architecture

- **Release Tag URL**: `https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/tag/v1.0.1`
- **Release Archive Filename**: `Google AI Plus Portal v1.0.1 by nmrisrl11.zip`
- **Application Binary Filename**: `Google AI Plus Portal v1.0.1.exe`
- **Binary SHA-256 Checksum**: `05D5D3B04C192BC90D2F835F7FC741FCC702E16A38B26FC7C5836D3AE7E7EE28`
- **Repository Visibility Rule**: The repository `gemini-ai-plus-claimer-app` **MUST REMAIN PUBLIC**. If set to private, any anonymous visitor clicking download will receive a GitHub `404 Not Found` error.
- **Centralized Configuration in `js/app.js` (Single Source of Truth)**:
  ```javascript
  const CONFIG = {
  	VERSION: "v1.0.1",
  	REPO_URL: "https://github.com/nmrisrl11/gemini-ai-plus-claimer-app",
  	get DIRECT_DOWNLOAD_URL() {
  		return `${this.REPO_URL}/releases/tag/${this.VERSION}`;
  	},
  	get RELEASES_URL() {
  		return `${this.REPO_URL}/releases`;
  	},
  	get LATEST_RELEASE_URL() {
  		return `${this.REPO_URL}/releases/latest`;
  	},
  };
  ```
  - **Dynamic Link Wiring**: Any element with `.direct-download-link` or `.releases-link` automatically adopts these URLs on load. In static HTML, buttons use the resilient permanent fallback `https://github.com/nmrisrl11/gemini-ai-plus-claimer-app/releases/latest`.
  - **Dynamic Version Wiring**: Any element with `.app-version-text` automatically synchronizes with `CONFIG.VERSION` on load, removing hardcoded version strings across all pages and layouts.
  - **Dynamic Schema Synchronization**: Dynamically updates `softwareVersion` and `downloadUrl` inside `<script id="app-schema">`.
  > **Safe Browsing & Trust Design**: Download buttons route transparently to official GitHub Releases instead of direct binary streams, ensuring automated security crawlers verify the open-source hosting origin.

---

## 6. ♿ Accessibility (WCAG 2.1 AA) Compliance Details

1. **Skip Navigation Link (SC 2.4.1)**:
   Located immediately after `<body>`:
   ```html
   <a
   	href="#main-content"
   	class="sr-only focus:not-sr-only focus:fixed focus:top-4 focus:left-4 focus:z-50 ..."
   >
   	Skip to main content
   </a>
   ```
   `<main id="main-content" tabindex="-1">` is programmatically focusable.
2. **Decorative SVGs (SC 1.1.1)**:
   All 26 decorative SVGs contain `aria-hidden="true" focusable="false"`.
3. **Screen Reader Live Announcer (SC 4.1.3)**:
   An assertive/polite live region exists before `</body>`:
   ```html
   <div id="a11y-announcer" class="sr-only" aria-live="polite" aria-atomic="true"></div>
   ```
   When `copySnippet()` runs, it populates this div to announce clipboard updates to blind users.
4. **Reduced Motion (SC 2.3.3 & 2.2.2)**:
   In `css/style.css`, `@media (prefers-reduced-motion: reduce)` disables smooth scrolling and animations for vestibular accessibility.
5. **Color Contrast (SC 1.4.3)**:
   All text against `#090d16` (slate-950) uses `#94a3b8` (slate-400, 7.58:1) or lighter, exceeding WCAG AAA requirements.

---

## 7. 🔍 SEO & Social Metadata Configuration

- **Canonical URL**: `https://gemini-ai-plus-claimer.vercel.app/`
- **Theme Color**: `#090d16` (dark color scheme)
- **OpenGraph**:
  - `og:image`: `https://gemini-ai-plus-claimer.vercel.app/images/og-image.png`
  - Dimensions: `1200 x 630`
  - `og:image:alt`: `Google AI Plus Portal — Automated 1-Year Access Generator Open Graph Preview`
- **Twitter / X**:
  - `twitter:card`: `summary_large_image`
  - `twitter:image`: `https://gemini-ai-plus-claimer.vercel.app/images/og-image.png`
- **Structured Data (JSON-LD)**:
  Embedded `@graph` with `SoftwareApplication` (specifying price $0.00, operatingSystem, downloadUrl) and `WebSite`.
- **Crawlability**:
  `robots.txt` and `sitemap.xml` are active in root.

---

## 8. 📊 Vercel Telemetry Integration

The `<head>` contains official HTML snippets:

```html
<!-- Vercel Web Analytics -->
<script>
	window.va =
		window.va ||
		function () {
			(window.vaq = window.vaq || []).push(arguments);
		};
</script>
<script defer src="/_vercel/insights/script.js"></script>

<!-- Vercel Speed Insights -->
<script>
	window.si =
		window.si ||
		function () {
			(window.siq = window.siq || []).push(arguments);
		};
</script>
<script defer src="/_vercel/speed-insights/script.js"></script>
```

---

## 9. 🛡️ 404 Architecture, Uniformity & Routing Rules

1. **Native Vercel 404 Serving**:
   - Vercel automatically matches unmatched requests (e.g., `/test` or `/broken/path`) and serves `/404.html` with an HTTP `404 Not Found` status without changing the browser URL.
2. **Dual-Environment Link Resolution**:
   - In `<head>` of `404.html`, an inline script checks `window.location.protocol`. If not `file:`, it injects `<base href="/" />` so that assets (CSS, images, icons, scripts) load from the root domain even from deeply nested 404 paths (e.g. `/foo/bar/bad`).
   - In `js/app.js`, an environment link adapter dynamically routes relative `index.html#...` anchors to root `/#...` on web servers, while preserving relative links when double-clicking `404.html` locally via `file://`.
3. **Footer Uniformity & Border Boundary**:
   - The boundary between page content and the footer must always be a **single 1px line**.
   - `<section id="faq">` in `index.html` has NO bottom border (`border-b`), allowing the footer's `<footer class="border-t border-slate-800">` to act as the sole divider.
   - The copyright row must strictly use `text-[11px] text-slate-400` across both `index.html` and `404.html` for uniform rendering and WCAG 2.1 AA contrast compliance.
4. **Layout Shift Elimination**:
   - `css/style.css` enforces `html { overflow-y: scroll; scrollbar-gutter: stable; }`. This reserves the vertical scrollbar track across both the long landing page and the short 404 page, preventing navbar horizontal jitter.

---

## 10. 🛠️ Instructions for Future AI Agents

When working on this repository:

1. **Prettier Formatting is Mandatory**:
   Always run Prettier before committing:
   ```bash
   npx prettier --write .
   ```
2. **Preserve Semantic HTML**:
   Keep tag hierarchy balanced (`h1` &rarr; `h2` &rarr; `h3`). Do not insert unescaped special characters without proper HTML entities (`&bull;`, `&uarr;`, `&times;`).
3. **Preserve ARIA & Accessibility**:
   Never add an `<svg>` without checking if it needs `aria-hidden="true" focusable="false"`. Ensure all interactive buttons have explicit `type="button"` and labels.
4. **Deploy Verification**:
   After pushing to `main`, wait ~15 seconds and verify that the production URL [gemini-ai-plus-claimer.vercel.app](https://gemini-ai-plus-claimer.vercel.app) returns `HTTP 200` with the updated changes.
