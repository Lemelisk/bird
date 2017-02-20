#!/bin/bash
set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR/registry"

ruby utils/bgp-filter.rb --format bird < data/filter.txt > /etc/bird/filter4.conf.new
mv /etc/bird/filter4.conf.new /etc/bird/filter4.conf

ruby utils/bgp-filter.rb --format bird < data/filter6.txt > /etc/bird/filter6.conf.new
mv /etc/bird/filter6.conf.new /etc/bird/filter6.conf

birdc configure
birdc6 configure
