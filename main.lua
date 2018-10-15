---------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- require the composer library
local composer = require "composer"

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)
-- local options = {
    -- effect = "fade",
    -- time = 500,
    -- params = {
        -- someKey = "someValue",
        -- someOtherKey = 10
    -- }
-- }

-- Add any system wide event handlers, location, key events, system resume/suspend, memory, etc.

-- load scene1
composer.gotoScene( "searchScene" )
