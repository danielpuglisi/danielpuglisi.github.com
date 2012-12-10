---
layout: post
title: "Keep your Heroku app alive, for free"
category: programming
date: 2012-08-27 0
permalink: "/articles/2012/08/27/keep-your-free-heroku-app-alive.html"
comments: true
---

Maybe you were in this situation before. 
You're developing a website or 
app with [Ruby on Rails](http://rubyonrails.org/) and using
a single [Heroku](http://www.heroku.com/) 
dyno to show off your current progress to your customers.
The thing is, if you are only
using one dyno for your app, 
Heroku is going to put your app back to sleep after a
certain time (5 minutes I think?) and this causes your 
app to load slower the next time a request comes in.
There [are](https://github.com/github/hubot-scripts/blob/master/src/scripts/keep-alive.coffee) 
[a](http://beouk.blogspot.ch/2012/02/keeping-heroku-awake.html) 
[few](http://danneu.com/posts/7-keeping-that-free-heroku-dyno-alive-without-feeling-unethical) 
workarounds already out there, but I wanted to have something simpler.

So I came up with a little shell script:

<script src="https://gist.github.com/3490814.js?file=keep-alive.sh"></script>

This script does nothing more than requesting every single Heroku app which is defined in the array at
the beginning of the script. 

Of course, it would be a little bit overwhelming to call this script
every 5 minutes by hand, so we are going to create a cronjob.

To accomplish this, we are adding the following line to the `/etc/crontab` file:

<script src="https://gist.github.com/3490792.js?file=crontab"></script>

This is going to execute the `keep-alive.sh` script every minute.

To complete the whole thing, put the `keep-alive.sh` file into the `/etc/cron.custom` directory
(you may have to create the directory first) and you are all set.

I run that script on a Linux server, but it should also work with OSX.
And thats it. The Heroku app shouldn't go back to sleep anymore (as long as your system is running).

Enjoy.
