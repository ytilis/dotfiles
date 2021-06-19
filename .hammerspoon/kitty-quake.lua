hs.hotkey.bind({"cmd"}, "escape", function()
  local kitty = hs.application.get("kitty")

  if kitty then
      if not kitty:mainWindow() then
          --hs.notify.new({title="1"}):send()
          kitty:selectMenuItem({"kitty", "New OS window"})
      elseif kitty:isFrontmost() then
          --hs.notify.new({title="2"}):send()
          kitty:hide()
      else
          --hs.notify.new({title="3"}):send()
          kitty:activate()
      end
  else
      --hs.notify.new({title="4"}):send()
      hs.application.launchOrFocus("kitty")
      kitty = hs.application.get("kitty")
  end

  kitty:mainWindow():moveToUnit'[100,75,0,0]'
  kitty:mainWindow().setShadows(false)
end)
