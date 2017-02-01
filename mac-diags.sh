#!/bin/bash
#
# Copyright (c)2017 Thomas Phillips.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Derived from:
# https://discussions.apple.com/thread/4243511?start=30&tstart=0
#
echo "kexstat"
echo "-------"
kextstat -kl | awk '!/com\.apple/{printf "%s %s\n", $6, $7}'
echo
echo "launchctl (sudo)"
echo "----------------"
sudo launchctl list | sed 1d | awk '!/0x|com\.(apple|openssh|vix)|edu\.mit|org\.(amavis|apache|cups|isc|ntp|postfix|x)/{print $3}'
echo
echo "launchctl"
echo "---------"
launchctl list | sed 1d | awk '!/0x|com\.apple|edu\.mit|org\.(x|openbsd)/{print $3}'
echo
echo "mach files"
echo "----------"
ls -1A /e*/mach* {,/}L*/{Ad,Compon,Ex,Fram,In,Keyb,La,Mail/Bu,P*P,Priv,Qu,Scripti,Servi,Spo,Sta}* L*/Fonts 2> /dev/null
echo
echo "login items"
echo "-----------"
osascript -e 'tell application "System Events" to get name of every login item' 2> /dev/null
