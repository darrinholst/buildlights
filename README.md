# buildlights

A ruby script to monitor a hudson/jenkins rss feed and trigger a build
light via x10

## Requirements

- linux
- ruby
- [bottlerocket](http://www.linuxha.com/bottlerocket/)
- [some x10 stuff](http://www.x10.com/products/firecracker.htm)

## Usage

  gem install bottlerocket

Add the following to cron

  bottlerocket -v --hudson http://yourhudsonserver/rssLatest

## Copyright

Copyright (c) 2011 Darrin Holst. See LICENSE for details.

