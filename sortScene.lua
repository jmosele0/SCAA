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
local 	title = display.newText( "Sort By", display.contentCenterX, 8, native.systemFont, 30)
		title:setFillColor( 0, 0, 0 )
local 	background = display.setDefault("background", 220, 20, 60) 
		
		
-- Function to handle button events
local function rank( event )
 
    composer.gotoScene("rankScene", {effect="slideLeft", time=500})
	--print("overall ranking")
end


local function goBack(event)
	
		composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
end

local backBtn = widget.newButton(
    {
        label = "X",
        onRelease = goBack,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 40,
        height = 40,
		x = 290,
		y = 1, 
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)	 
-- -----------------------------------------------------------------------------------
-- overall button
-- -----------------------------------------------------------------------------------
 
	local overallBtn = widget.newButton(
    {
        label = "overall Score",
        onRelease = rank,
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
	overallBtn.y = 100
-- -----------------------------------------------------------------------------------
--	factor 1 & 3 button/factor 1
-- -----------------------------------------------------------------------------------
 
	local factor1Btn = widget.newButton(
    {
        label = "Government Accountability",
        onRelease = rank,
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
	factor1Btn.x = display.contentCenterX
	factor1Btn.y = 160
-- -----------------------------------------------------------------------------------
--	factor 2 button
-- -----------------------------------------------------------------------------------
 	local factor2Btn = widget.newButton(
    {
        label = "Absence of Corruption",
        onRelease = rank,
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
	factor2Btn.x = display.contentCenterX
	factor2Btn.y = 220
-- -----------------------------------------------------------------------------------
--	factor 4 button/factor 3
-- -----------------------------------------------------------------------------------
	local factor3Btn = widget.newButton(
    {
        label = "Fundamental Rights",
        onRelease = rank,
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
	factor3Btn.x = display.contentCenterX
	factor3Btn.y = 280
-- -----------------------------------------------------------------------------------
--	factor 5 button/factor 4
-- -----------------------------------------------------------------------------------
	local factor4Btn = widget.newButton(
    {
        label = "Order and Security",
        onRelease = rank,
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
	factor4Btn.x = display.contentCenterX
	factor4Btn.y = 340
-- -----------------------------------------------------------------------------------
--	factor 7 & 8 button/ factor 5
-- -----------------------------------------------------------------------------------
 		local factor5Btn = widget.newButton(
    {
        label = "Civil & Criminal Justice",
        onRelease = rank,
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
	factor5Btn.x = display.contentCenterX
	factor5Btn.y = 400
	
	
-- -----------------------------------------------------------------------------------
--
-- -----------------------------------------------------------------------------------
 
	sceneGroup:insert(title)
	sceneGroup:insert(overallBtn)
	sceneGroup:insert(factor1Btn)
	sceneGroup:insert(factor2Btn)
	sceneGroup:insert(factor3Btn)
	sceneGroup:insert(factor4Btn)
	sceneGroup:insert(factor5Btn)
	sceneGroup:insert(backBtn)
	
	
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