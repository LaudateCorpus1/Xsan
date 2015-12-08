#!/usr/bin/env bash

sudo cat >/tmp/com.xsan.plist <<EOL
<?xml version="1.0" encoding="UTF-8”?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
            <string>com.xsan</string>
        <key>ProgramArguments</key>
            <array>
              <string>/usr/local/bin/com.xsan.sh</string>
            </array>
        <key>RunAtLoad</key>
            <true/>
        <key>StandardOutPath</key>
            <string>/var/log/com.xsan.log</string>
        <key>StandardErrorPath</key>
            <string>/var/log/com.xsan.err</string>
    </dict>
</plist>
EOL

sudo cat >/tmp/com.xsan.sh <<EOL
launchctl unload /System/Library/LaunchDaemons/com.apple.xsan.plist
launchctl load /System/Library/LaunchDaemons/com.apple.xsan.plist
EOL

sudo mv /tmp/com.xsan.plist /System/Library/LaunchDaemons/com.xsan.plist
sudo mv /tmp/com.xsan.sh /usr/local/bin/com.xsan.sh

launchctl load -w /System/Library/LaunchDaemons/com.xsan.plist