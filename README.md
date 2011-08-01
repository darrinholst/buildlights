# buildlights

A ruby script to monitor a hudson/jenkins rss feed and trigger a build
light via x10

## Requirements

- linux
- ruby
- [bottlerocket](http://www.linuxha.com/bottlerocket/)
- [some x10 stuff](http://www.x10.com/products/firecracker.htm)

## Usage

    gem install buildlights

Add the following to cron

    buildlights -v --hudson http://yourhudsonserver/rssLatest

Sample script to check multiple times per minute

    #!/bin/bash
    
    GEM_BIN=/var/lib/gems/1.8/bin
    RSS_FEED=[the feed url]
    CHECKS_PER_MINUTE=6
    SLEEP_SECONDS=$((60/$CHECKS_PER_MINUTE))
    
    for((i=1; i<$CHECKS_PER_MINUTE; i++)) do
        $GEM_BIN/buildlights -v --hudson $RSS_FEED
        sleep $SLEEP_SECONDS
    done


## Copyright

Copyright (c) 2011 Darrin Holst. See LICENSE for details.

