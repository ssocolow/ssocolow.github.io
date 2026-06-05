# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Simon Socolow's personal website and blog — a Jekyll static site forked from Jake Tae's site, built on the **minimal-mistakes** theme and served via **GitHub Pages** at `simonsocolow.com` (see `CNAME`).

## Commands

```bash
bundle install                  # install Ruby gem dependencies (first time / after Gemfile changes)
bundle exec jekyll serve        # local dev server with live reload at http://localhost:4000
bundle exec jekyll build        # build static site into _site/
```

There is no test suite, linter, or JS build step. `_site/` is generated output and is committed but should not be hand-edited.

## Architecture

- **Theme is remote, not vendored.** `_config.yml` sets `remote_theme: mmistakes/minimal-mistakes@4.19.3`. Most layouts, includes, and styles live inside the theme gem, *not* in this repo. To override a theme file, create a local copy at the matching path under `_layouts/`, `_includes/`, or `assets/`. Files like `head/custom.html` and `footer/custom.html` are referenced in `_layouts/default.html` but resolve from the theme.
- **`_config.yml` changes require a server restart** — Jekyll does not hot-reload it.
- **Collections:** `_posts` (blog), `_portfolio` (the `portfolio` collection, currently empty), and `_pages` (standalone pages). `_pages` and `_portfolio` are added via the `include:` list so Jekyll processes them.
- **Navigation** is driven by `_data/navigation.yml` (the `main` nav bar), independent of which pages exist.
- **Permalinks:** posts use `/:categories/:title/`; portfolio uses `/portfolio/:path/`.

## Writing posts

- Filenames must follow `_posts/YYYY-MM-DD-title.md`. Front matter requires `title` and `date`; add `categories` and `tags` (both archived at `/categories/` and `/tags/`).
- **Math:** MathJax loads only when a page sets `mathjax: true` in front matter (see `_includes/mathjax.html` and `_posts/2024-12-5-24-group-theory-explainer.md`). Inline `$...$`, display `\[...\]`.
- Per `README.md`, Jake Tae's original workflow authored posts as Jupyter notebooks in `_jupyter/` and converted them to markdown via a formatter/converter script. **That script is not present in this fork** — posts here are written directly as markdown. `_jupyter/` holds only notebook source/scratch.

## Styling

- Site skins are set in `_config.yml` (`minimal_mistakes_skin`).
- Custom styles live in `assets/css/main.scss` and `assets/css/theme2.scss`. Custom component styles (e.g. the `.projects-grid` / `.project-card` markup in `_pages/projects.md`) are defined here.
