tell application "iTerm2"
  activate

  set cercaWindow to (current window)

  tell cercaWindow

    tell current session
      split vertically with default profile
      write text "editorial-server"
    end tell

    tell last session of current tab
      write text "editorial"
    end tell

    set secondTab to (create tab with default profile)
    secondTab
    tell secondTab
      tell current session
        write text "veditorial"
      end tell
    end tell
  end tell
end tell
