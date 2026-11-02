#!/usr/bin/env bash
set -euo pipefail

usage() {
	cat <<'EOF'
Usage: run-portal.sh [path-to-exe]

Launch the Google AI Plus Portal Windows executable through Wine.
If no path is supplied, the script searches the current directory and
the directory containing this script for the v1.0.1 executable.
EOF
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
	usage
	exit 0
fi

if ! command -v wine >/dev/null 2>&1; then
	echo "Wine is required. Install it with your Linux distribution's package manager." >&2
	exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
executable="${1:-}"

if [[ -z "$executable" ]]; then
	for candidate in \
		"$PWD/Google AI Plus Portal v1.0.1.exe" \
		"$script_dir/../Google AI Plus Portal v1.0.1.exe"; do
		if [[ -f "$candidate" ]]; then
			executable="$candidate"
			break
		fi
	done
fi

if [[ -z "$executable" || ! -f "$executable" ]]; then
	echo "Executable not found." >&2
	echo "Download the v1.0.1 release, extract the .exe, then pass its path to this script." >&2
	exit 1
fi

executable="$(realpath -- "$executable")"
exec wine "$executable"
