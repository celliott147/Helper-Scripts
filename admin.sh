#!/bin/bash

# Unlock Network preference pane
security authorizationdb write system.preferences.network allow         
security authorizationdb write system.services.systemconfiguration.network allow

# Unlock Energy Saver preference pane
security authorizationdb write system.preferences.energysaver allow

# Unlock Print & Scan preference pane
security authorizationdb write system.preferences.printing allow

# Unlock Date & Time preference pane
security authorizationdb write system.preferences.datetime allow

# This must be set if you are going to allow non-admin access to any of the preference panes.
/usr/bin/security authorizationdb read system.preferences > /tmp/system.preferences.plist
/usr/bin/defaults write /tmp/system.preferences.plist group everyone
/usr/bin/defaults write /tmp/system.preferences.plist shared -bool true
/usr/bin/security authorizationdb write system.preferences < /tmp/system.preferences.plist