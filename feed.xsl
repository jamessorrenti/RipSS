<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"
              doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/rss/channel/title"/></title>
        <style><![CDATA[
          :root { color-scheme: light; }
          * { box-sizing: border-box; }
          body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
                         Oxygen, Ubuntu, Cantarell, sans-serif;
            max-width: 760px;
            margin: 3rem auto;
            padding: 0 1.25rem 3rem;
            line-height: 1.55;
            color: #1a1a1a;
            background: #fff;
          }
          header.feed {
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 1.25rem;
            margin-bottom: 1.5rem;
          }
          header.feed h1 {
            font-size: 1.75rem;
            font-weight: 600;
            margin: 0 0 0.4rem;
            color: #111;
          }
          header.feed .description {
            color: #555;
            margin: 0;
            font-size: 0.95rem;
          }
          .subscribe {
            background: #f6f8fa;
            border: 1px solid #e1e4e8;
            border-radius: 6px;
            padding: 0.8rem 1rem;
            margin: 1.5rem 0 2rem;
            font-size: 0.88rem;
            color: #444;
          }
          .subscribe strong { color: #1a1a1a; }
          .subscribe code {
            background: #fff;
            padding: 0.1rem 0.45rem;
            border: 1px solid #d0d7de;
            border-radius: 3px;
            font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
            font-size: 0.85em;
          }
          .item {
            padding: 1.25rem 0;
            border-bottom: 1px solid #eaecef;
          }
          .item:last-child { border-bottom: none; }
          .item-header {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            gap: 1rem;
            margin-bottom: 0.4rem;
            flex-wrap: wrap;
          }
          .item-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: #111;
          }
          .item-title a {
            color: #0969da;
            text-decoration: none;
          }
          .item-title a:hover { text-decoration: underline; }
          .item-meta {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.82rem;
            color: #6e7681;
            white-space: nowrap;
          }
          .item-category {
            background: #eef3fb;
            color: #1c5390;
            padding: 0.12rem 0.55rem;
            border-radius: 3px;
            font-weight: 500;
            white-space: nowrap;
          }
          .item-desc {
            color: #2c2e33;
            margin: 0.5rem 0 0;
            white-space: pre-wrap;
            font-size: 0.95rem;
          }
          footer {
            color: #6e7681;
            font-size: 0.82rem;
            margin-top: 3rem;
            padding-top: 1rem;
            border-top: 1px solid #eaecef;
          }
          footer a { color: #0969da; text-decoration: none; }
          footer a:hover { text-decoration: underline; }
          @media (max-width: 540px) {
            body { margin: 1.5rem auto; }
            .item-header { flex-direction: column; gap: 0.3rem; }
            .item-meta { font-size: 0.78rem; }
          }
        ]]></style>
      </head>
      <body>
        <header class="feed">
          <h1><xsl:value-of select="/rss/channel/title"/></h1>
          <p class="description"><xsl:value-of select="/rss/channel/description"/></p>
        </header>

        <div class="subscribe">
          <strong>Subscribe:</strong> Paste this page's URL into an RSS reader
          (Feedly, NetNewsWire, Inoreader, etc.) or run
          <code>/feed subscribe &lt;url&gt;</code> in Slack.
        </div>

        <xsl:choose>
          <xsl:when test="/rss/channel/item">
            <xsl:for-each select="/rss/channel/item">
              <article class="item">
                <div class="item-header">
                  <h2 class="item-title">
                    <xsl:choose>
                      <xsl:when test="link">
                        <a href="{link}"><xsl:value-of select="title"/></a>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="title"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </h2>
                  <span class="item-meta">
                    <xsl:if test="category">
                      <span class="item-category"><xsl:value-of select="category"/></span>
                    </xsl:if>
                    <xsl:if test="pubDate">
                      <xsl:value-of select="substring(pubDate, 6, 11)"/>
                    </xsl:if>
                  </span>
                </div>
                <p class="item-desc"><xsl:value-of select="description"/></p>
              </article>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <p style="color:#6e7681">No items yet. Check back after the next publish.</p>
          </xsl:otherwise>
        </xsl:choose>

        <footer>
          Maintained by <a href="mailto:j.sorrenti@rippling.com">James Sorrenti</a>.
          Auto-updated from the Product Launch Comms spreadsheet whenever launches are published.
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
