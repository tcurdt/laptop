#!/bin/zsh

set -e

FROM=${FROM:-/Volumes/Mirror}

restore()
{
  POS=$(eval echo $1)
  SRC="$FROM$POS"
  DST="$POS"

  if [ -e "$SRC" ]; then

    echo "restoring $SRC -> $DST"

    if [ -d "$SRC" ]; then
      SRC="$SRC/"
      mkdir -p "$DST"
    fi

    rsync -arv --exclude=.DS_Store "$SRC" "$DST"

  else
    echo "not found $SRC"
  fi
}

restore "~/.gitconfig"
restore "~/.gitignore_global"
restore "~/.twitter.json"
restore "~/.npmrc"
restore "~/.netlify"

restore "~/.ssh"
restore "~/.aws"
restore "~/.gnupg"
restore "~/Library/LaunchAgents/org.vafer.setenv.openscad.plist"
# restore "~/Library/Application Support/Google/Chrome"
restore "~/Library/Application Support/Sublime Text 3"
restore "~/Library/Application Support/Viscosity"
restore "~/Library/Preferences/com.viscosityvpn.Viscosity.plist"
restore "~/Library/Application Support/Alfred"
restore "~/Library/Application Support/Resilio Sync"
restore "~/Shared"
# restore "~/Library/Application Support/SuperDuper!"
# restore "~/Library/Preferences/com.blacey.SuperDuper!.plist"
restore "~/Library/Application Support/Charles"
restore "~/Library/Application Support/Little Snitch"
# restore "~/Library/Application Support/Transmission"
restore "~/Library/Application Support/MacDive"
# restore "~/Library/Application Support/Code"
# restore "~/Library/Preferences/com.microsoft.VSCode.helper.plist"
# restore "~/Library/Preferences/com.microsoft.VSCode.plist"
# restore "~/.vscode"
# restore "~/Library/Application Support/NetNewsWire"
restore "~/Library/Preferences/com.blackpixel.netnewswire.plist"
restore "~/Library/Containers/com.moneymoney-app.retail"
restore "~/Library/Preferences/com.hamrick.vuescan.plist"
restore "~/Library/Preferences/vuescan.ini"
# restore "~/Books"
restore "~/Library/Preferences/calibre"
restore "~/Library/Application Support/Faxbot"
restore "~/Library/Preferences/ch.sudo.cyberduck.plist"
restore "~/Library/Application Support/PrusaSlicer"
restore "~/Library/Preferences/ChiTuBox"
# restore "~/Library/Preferences/uk.co.menial.Base.plist"
restore "~/Library/Application Support/Base"
# restore "~/Library/Application Support/Handbrake"
# restore "~/Library/Application Support/Blackmagic Design/DaVinci Resolve"
# restore "~/Library/Preferences/Blackmagic Design/DaVinci Resolve"
# restore "~/Library/Preferences/com.blackmagic-design.DaVinciResolve.plist"

# restore "~/Library/Application Support/Dash"
# restore "~/Library/Application Support/Firefox"
# restore "~/Library/Application Support/mkcert"
# restore "~/Library/Application Support/Signal"
# restore "~/Library/Application Support/WhatsApp"


