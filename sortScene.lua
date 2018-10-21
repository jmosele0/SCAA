-- Sort Scene


local composer = require( "composer" )

 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
	
			
	local widget = require( "widget" )
 
	--[[ overallRank = {}
	
	 for i = 1, #overallRank do
		-- countryData[56][i]
	 end
--]]	
 
-- Function to handle button events
local function sortOverall( event )
 
    composer.gotoScene("rankScene", {effect="slideLeft", time=500, params=customParams})
	print("overall ranking")
end


local function goBack(event)
	
		composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
end

local		backButton = widget.newButton(
			{
				onRelease = goBack,
				label = "X",
				x = 300,
				y = 80,
				width = 80,
				height = 80,
			}
			)
	 
-- Create the widget
local overallBtn = widget.newButton(
    {
        label = "overall Score",
        onRelease = sortOverall,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 300,
        height = 40, 
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)
	
	overallBtn.x = display.contentCenterX
	overallBtn.y = display.contentCenterY
	
	
	sceneGroup:insert(overallBtn)
	sceneGroup:insert(backButton)
	
	
	 elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene