#!/usr/bin/env bash
#
# Create a new blog post in _posts/ with the date and front matter prefilled.
#
# Usage:
#   ./new_post.sh "My Post Title"
#   ./new_post.sh                     # prompts for the title
#
# Produces: _posts/YYYY-MM-DD-my-post-title.md

set -euo pipefail

usage() {
  cat <<'USAGE'
new_post.sh - create a new blog post in _posts/ with the date and front matter prefilled.

Usage:
  ./new_post.sh "My Post Title"   Create a post with the given title
  ./new_post.sh                   Prompt for the title interactively
  ./new_post.sh -h | --help       Show this help

Output:
  _posts/YYYY-MM-DD-my-post-title.md
  (today's date is filled in automatically; the title is slugified for the filename)
USAGE
}

case "${1:-}" in
  -h|--help)
    usage
    exit 0
    ;;
esac

# Run from the repo root regardless of where the script is invoked.
cd "$(dirname "$0")"

# Get the title from the first arg, or prompt for it.
title="${1:-}"
if [[ -z "$title" ]]; then
  read -rp "Post title: " title
fi
if [[ -z "$title" ]]; then
  echo "Error: a title is required." >&2
  exit 1
fi

date="$(date +%Y-%m-%d)"

# Slugify: lowercase, spaces/underscores -> hyphens, strip non-alphanumerics,
# collapse repeated hyphens, trim leading/trailing hyphens.
slug="$(printf '%s' "$title" \
  | tr '[:upper:]' '[:lower:]' \
  | tr ' _' '-' \
  | sed -E 's/[^a-z0-9-]//g; s/-+/-/g; s/^-+//; s/-+$//')"

file="_posts/${date}-${slug}.md"

if [[ -e "$file" ]]; then
  echo "Error: $file already exists." >&2
  exit 1
fi

cat > "$file" <<EOF
---
title: "${title}"
date: ${date}
categories:
  - blog
tags:
  -
---

EOF

echo "Created $file"
