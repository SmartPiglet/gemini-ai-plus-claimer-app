#!/usr/bin/env bash
set -euo pipefail

usage() {
	cat <<'EOF'
Usage:
  run-portal-ssh-termux.sh user@raspberry-pi [remote-command...]

Run a headless Linux portal command over SSH from Termux, extract the first
HTTPS link from its output, and open that link in Chrome on Android.

The remote command must print the generated link to stdout. If omitted, the
default command is `google-ai-plus-portal --headless`.
EOF
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" || $# -lt 1 ]]; then
	usage
	[[ $# -ge 1 ]] || exit 1
	exit 0
fi

if ! command -v ssh >/dev/null 2>&1; then
	echo "ssh is required. Install it in Termux with: pkg install openssh" >&2
	exit 1
fi

ssh_target="$1"
shift
remote_command="${*:-google-ai-plus-portal --headless}"

output="$(ssh -o BatchMode=yes "$ssh_target" "$remote_command")"
link="$(printf '%s\n' "$output" | grep -Eo 'https://[^[:space:]<>"]+' | head -n 1 || true)"

if [[ -z "$link" ]]; then
	echo "The remote command completed but did not print an HTTPS link." >&2
	printf '%s\n' "$output" >&2
	exit 1
fi

printf 'Generated link: %s\n' "$link"

# Prefer Chrome's Android package; fall back to Termux's default URL handler.
if command -v am >/dev/null 2>&1 &&
	am start -a android.intent.action.VIEW -d "$link" \
		-n com.android.chrome/com.google.android.apps.chrome.Main >/dev/null 2>&1; then
	exit 0
fi

if command -v termux-open-url >/dev/null 2>&1; then
	exec termux-open-url "$link"
fi

echo "Chrome could not be launched automatically. Open the link above in Chrome." >&2
