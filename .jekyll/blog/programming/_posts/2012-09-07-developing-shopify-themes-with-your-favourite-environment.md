---
layout: post
title: "Developing Shopify Themes in your favourite environment"
category: programming
date: 2012-09-07 0
permalink: "/articles/2012/09/07/developing-shopify-themes-in-your-favourite-environment.html"
comments: true
---

**TL;DR: I hate it when I can't develop code in my favourite environment. So I found this glorious gem
called [shopify\_theme](https://github.com/Shopify/shopify\_theme) 
which automatically syncs shopify themes to your connected shop.**

I've been lately working on a [Shopify](http://shopify.com) store and the client who I work for
wishes a customized desgin which looks like their original website. I had to find out, that
this process wasn't that compatible with my expectation how to develop code 
and Shopify's integrated webeditor.

Truth to be told, Shopify's online editor sucks (to be fair, every webeditor sucks when you wan't
to develop code with it). So I was looking for another solution. Shopify promotes that you can
develop templates with their [Textmate Bundle](http://wiki.shopify.com/Shopify_Textmate_Bundle). 
Hmm no thank you... I didn't wanted to install Textmate only for developing one template.

Then there was this [OSX App](http://wiki.shopify.com/Theme_Sync_App) which 
I got recommended from the Shopify Support. You can download & upload your themes with it but 
the performance is terrible. Also a no go.

The final solution I came up with and using right now is this remarkably gem called
[shopify\_theme](https://github.com/Shopify/shopify_theme) from Shopify itself.
It can watch for changes on theme files and if it detects something, it automatically
syncs the files to the shop. I just ask myself why they don't list this gem anywhere.
Maybe I haven't searched enough.

Anyway. This is how I like to work. Thank you Shopify.
