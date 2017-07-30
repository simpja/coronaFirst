-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect("background.png", 640, 1136)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect("platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-5

local moon = display.newImageRect("moon.png", 300, 220)
moon.x = display.contentCenterX
moon.y = display.contentCenterY
moon.alpha = 0.8

local physics = require( "physics")
physics.start()

physics.addBody(platform, "static")
physics.addBody(moon, "dynamic", {radius=50, bounce=0.3})

local function pushMoon()
	moon:applyLinearImpulse(0, -0.75, moon.x, moon.y)
end

moon:addEventListener("tap", pushMoon)