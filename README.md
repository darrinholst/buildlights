# buildlights

This little ruby gem will check a hudson rss feed for build failures and
turn a x10 lamp module on if any failures are found. The simplest way
to use it is to find the crapiest computer you can find to use as a
controller that has a serial port, a network connection and runs ruby. When build failures are found it will turn on A1 and
turn off A2 and vice versa for when no failures are found. Don't worry
if you don't know what that means because the default is A1 on all the
x10 stuff so just buy the [kit](http://www.x10.com/automation/ck18a_s_ps32.html) and plug the firecracker into the serial port and a light in to the tranceiver.

## Requirements

- linux (ubuntu assumed)
- ruby
- [bottlerocket](http://www.linuxha.com/bottlerocket/)
- [some x10 stuff](http://www.x10.com/products/firecracker.htm)

## Usage

    sudo apt-get install bottlerocket
    sudo gem install buildlights

Add the following to cron

    buildlights -v --hudson http://yourhudsonserver/rssLatest

**WTF?** that didn't work

Ok, it was that easy at the last gig. The current gig wasn't that easy.
For some reason it didn't recognize the serial port so here's what I
did...

* sudo mv /usr/bin/br /usr/bin/br-original
* sudo gedit /usr/bin/br

    \#!/bin/sh  
    /usr/bin/br-original --port /dev/ttys0 &@

Your situation might require to check more than once per minute that
cron provides, here's a sample script that I've used to do that...

    #!/bin/bash

    GEM_BIN=/var/lib/gems/1.8/bin
    RSS_FEED=[the feed url]
    CHECKS_PER_MINUTE=6
    SLEEP_SECONDS=$((60/$CHECKS_PER_MINUTE))

    for((i=1; i<$CHECKS_PER_MINUTE; i++)) do
        $GEM_BIN/buildlights -v --hudson $RSS_FEED &
        sleep $SLEEP_SECONDS
    done

## Copyright

Copyright (c) 2011 Darrin Holst. See LICENSE for details.

