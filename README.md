# Test Repository for Taufinity Secure Worker

This repo is used for integration testing of the secure worker service.

## Structure

```
templates/
  article/
    main.html       - Entry template
    head.html       - <head> partial
    header.html     - Site header partial
    footer.html     - Site footer partial
distribution/
  instagram/
    post.json       - Instagram post config
  reels/
    config.json     - Reels config
symlink-tests/
  safe-link.txt     - Symlink within repo (should work)
  MALICIOUS.md      - Instructions for creating escape symlinks
```

## Template Data Shape

Templates expect this data structure:

```json
{
  "Article": {
    "Title": "string",
    "Subtitle": "string (optional)",
    "PublishedAt": "2026-01-28T00:00:00Z"
  },
  "Translation": {
    "Content": "<p>HTML content</p>",
    "MetaDescription": "string"
  },
  "Site": {
    "Name": "string",
    "URL": "string"
  }
}
```
