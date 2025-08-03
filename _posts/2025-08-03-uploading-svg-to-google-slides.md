---
title: "Uploading SVGs to google slides"
date: 2025-08-03
categories:
  - tech
tags:
  - info
  - problemsolving
---
I'm working with a friend, making a poster in google slides. We have a bar chart to add to the poster, so naturally we download it as an SVG (scalable vector graphics - i.e. it never gets pixelated no matter how far you zoom in) and upload it to google slides.
![error uploading](/assets/images/gslides-svg.png)
Oof. What???!!! Google products are probably the most used products by any company anywhere in all of history. How on Earth do they not allow people to upload SVGs? I was dumbstruck upon seeing this for the first time because I remembered uploading SVGs successfully in the past. It turns out that  SVGs are a security threat because they can contain javascript, so at some point in 2021 Google disallowed their use. I can't find any official announcement about this, the closest thing I found is [this support forum](https://support.google.com/docs/thread/103766233/images-in-svg-format-no-longer-supported?hl=en). Also, the SVG specification basically has a ton of functionality that almost never gets used (see this [HN thread](https://news.ycombinator.com/item?id=39079943) for some of the lore behind it).
Ok, this is a challenge. I want to get my chart into google slides as a vector graphic so when we print out our poster everything is crisp. After some dead ends, I found a pipeline that works for me (I am running Ubuntu). There is probably a more optimal way to do this. Here we go:
1. Upload SVG to LibreOffice Writer
2. Export to PDF with "Lossless compression" on ![showing export settings](/assets/images/librewriterpdf.png)
3. Open the PDF in LibreOffice Draw and select everything with Ctrl-A ![show figure selection](/assets/images/libredrawselection.png)
4. Open a new LibreOffice Impress presentation and paste into it ![showing paste](/assets/images/libreimpresspaste.png)
5. Save as .odp
6. Convert to .pptx with `libreoffice --headless --convert-to pptx blogsvgtestpres.odp`
7. Upload the .pptx to google drive
8. Open in google slides
9. Copy the figure and paste to wherever you want in google slides or google drawings! ![copying figure](/assets/images/uploadingsvgtoslides.png)

This process is more steps than it should be. But this works (for now).