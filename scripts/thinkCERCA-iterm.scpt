tell application "iTerm2"
  activate

  set cercaWindow to (current window)

  tell cercaWindow

    tell current session
      split vertically with default profile
      write text "tcd"
    end tell

    tell last session of current tab
      write text "tcs"
    end tell

    set secondTab to (create tab with default profile)
    secondTab
    tell secondTab
      tell current session
        split vertically with default profile
        write text "tcf"
      end tell

      tell last session
        write text "tc"
      end tell
    end tell

    set thirdTab to (create tab with default profile)
    thirdTab
    tell thirdTab
      tell first session
        write text "tcv"
      end tell
    end tell
  end tell
end tell
