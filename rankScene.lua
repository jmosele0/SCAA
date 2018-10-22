local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

 

-- ===================================================================================
-- Scene event functions
-- ===================================================================================

local widget = require( "widget" )
 
-- Function to handle button events
local function showOptions( event )
 
    composer.gotoScene("sortScene", {effect="slideRight", time=500, params=customParams})
	
end
 
-- Create the widget
local sortBtn = widget.newButton(
    {
        label = "SORT",
        onRelease = showOptions,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 40,
        height = 40,
		x = 290,
		y = 1, 
		fontSize = 10,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

-----------------------------------------------------------------------------------------------------------------
-- country buttons Function
-----------------------------------------------------------------------------------------------------------------

local function showInfo(event)
    
	local customParams={
	    countryName=event.target.id
	}

	composer.gotoScene("infoScene", {effect="slideLeft", time=500, params=customParams})
	
end


local widget=require("widget")


-----------------------------------------------------------------------------------------------------------------
-- Country buttons looping
-----------------------------------------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

    local sceneGroup = self.view



 
	
end
   
    
-----------------------------------------------------------------------------------------------------------------
-- Scrolling
----------------------------------------------------------------------------------------------------------------- 
-- show()
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
 
 
 
 	--jake test
	local 	countryTest = {}
	local 	dataTest = {}
	local 	buttons = {value}
	local	buttonView={}
	
	
	for key,value in pairs(countryData[1]) do
		if(key ~= "Country" and key ~= "Zimbabwe" and key ~= "Zambia") then
			table.insert(countryTest, key)
			table.insert(dataTest, value)
		end 
	end
	
local 	sort_relative = function(ref, t, cmp)
local 	n = #ref
    assert(#t == n)
local r = {}
    for i=1,n do r[i] = i end
		if not cmp then cmp = function(a, b) return a < b end end
			table.sort(r, function(a, b) return cmp(ref[a], ref[b]) end)
		for i=1,n do r[i] = t[r[i]] end
    return r
	end
	
	xCount = 50
	yCount = 20
	wide = 40
	short = 40
	local sorted = sort_relative(dataTest, countryTest)
	for key, value in pairs(sorted) do
	
	print(value)
--[[still not working at the moment		
		labels = value[key]
		
		buttons = {}
		
		buttons[key] = widget.newButton(
		{
		label = value,
		labelColor = {default = {0,0,0}},
		lableYOffset = 60,
		onRelease = showInfo,
		id = buttons[key],
		x = xCount,
		y = yCount + 50,
		width = wide,
		height = short,
		defaultFile = labels.."-01.png"
		}
		)
	 
--]]
	end

  if ( phase == "will" ) then
  
	
   
    
    --sceneGroup:insert(searchBar)
    sceneGroup:insert(sortBtn)
--]]
	

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