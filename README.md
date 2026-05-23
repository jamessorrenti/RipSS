# RipSS — Rippling Product Launch RSS Feeds

This repo hosts RSS feeds for Rippling's IT product launches. The XML files are regenerated and committed automatically by a Google Apps Script attached to the Product Launch Comms spreadsheet whenever launches are published.

## Available feeds

| Scope | URL |
|---|---|
| All launches | https://jamessorrenti.github.io/RipSS/all.xml |
| All IT launches | https://jamessorrenti.github.io/RipSS/it.xml |
| IT — Identity | https://jamessorrenti.github.io/RipSS/it-iam.xml |
| IT — Device Management | https://jamessorrenti.github.io/RipSS/it-mdm.xml |
| IT — Inventory Management | https://jamessorrenti.github.io/RipSS/it-ivm.xml |
| IT — Automated Compliance | https://jamessorrenti.github.io/RipSS/it-ac.xml |

## How to subscribe

- **RSS reader** (Feedly, NetNewsWire, Inoreader, etc.): paste any URL above into your reader.
- **Slack**: run `/feed subscribe <url>` in the channel where you want updates.

## How it works

A Google Apps Script attached to the Product Launch Comms spreadsheet generates these XML files and commits them via the GitHub API after every publish. GitHub Pages serves the static files at the URLs above.

The XML reflects the live state of the spreadsheet's `Published` tab — same content that goes into the public Slack announcements.

## Maintainer

James Sorrenti — j.sorrenti@rippling.com
