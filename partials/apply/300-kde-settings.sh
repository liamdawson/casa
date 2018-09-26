#!/bin/bash

(
  set -e
  set -u

  _not_linux exit 0

if which kwriteconfig5 >/dev/null 2>&1
then
  # tap-to-click
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/touchpadrc" --group parameters --key Tapping true
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/touchpadrc" --group parameters --key ThreeFingerTapButton MiddleButton

  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kwinrc" --group MouseBindings --key CommandAll1 Nothing
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kwinrc" --group MouseBindings --key CommandAll2 Nothing
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kwinrc" --group MouseBindings --key CommandAll3 Nothing
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kwinrc" --group MouseBindings --key CommandAllKey Meta
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kwinrc" --group ModifierOnlyShortcuts --key Meta "org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu"

  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group DetailsMode --key ExpandableFolders false
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group General --key EditableUrl true
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group General --key FilterBar true
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group General --key GlobalViewProps true
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group General --key ShowFullPath true
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group General --key ShowFullPathInTitlebar true

  kwriteconfig5 --file "${XDG_CONFIG_HOME}/dolphinrc" --group PreviewSettings --key Plugins "directorythumbnail,imagethumbnail,jpegthumbnail"

  killall kglobalaccel5 || true

  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group ksmserver --key "Lock Session" "Meta+L,Ctrl+Alt+L\tScreensaver,Lock Session"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Window Quick Tile Bottom" "none,Meta+Down,Quick Tile Window to the Bottom"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Window Quick Tile Top" "none,Meta+Up,Quick Tile Window to the Top"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Walk Through Windows of Current Application" 'Meta+`,none,Walk Through Windows of Current Application'
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Walk Through Windows of Current Application (Reverse)" "Meta+~,none,Walk Through Windows of Current Application (Reverse)"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Window Maximize" "Meta+Up,Meta+PgUp,Maximize Window"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Walk Through Windows" "Alt+Tab,none,Walk Through Windows"
  kwriteconfig5 --file "${XDG_CONFIG_HOME}/kglobalshortcutsrc" --group kwin --key "Walk Through Windows (Reverse)" "Alt+Shift+Tab,none,Walk Through Windows (Reverse)"

  # TODO: find a better way to restart this
  kglobalaccel5 >/dev/null 2>&1 &

  qdbus org.kde.KWin /KWin reconfigure
fi
)
