-- Information Scene


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
	
	local group = display.newGroup()
	

        -- Code here runs when the scene is still off screen (but is about to come on screen)
	-- its just a text field at the moment

local 	title = display.newText( "Information", display.contentCenterX, 8, native.systemFont, 30)
		title:setFillColor( 0, 0, 0 )
		
local 	background = display.setDefault("background", 220, 20, 60) 
			
local 	widget=require("widget")
local scroll = widget.newScrollView
	 {
		left = 0,
		top = 50,
		width = 400,
		height = 500,
		topPadding = -50,
		bottomPadding = 10,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		backgroundColor = {1,1,1,1},
		listener = scrollListener,
 }
 
local function goBack(event)
	
	composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
end


-- Sort Button
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
		fontSize = 10,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)		

-----------------------------------------------------------------------------------------------------------------
-- Scrolling
-----------------------------------------------------------------------------------------------------------------

local	image=display.newImage(event.params.countryName.."-01.png")
		image.x=55
		image.y=95
		image.width=80
		image.height=80
	
	--sceneGroup:insert(image)



-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
-- Button looping
-----------------------------------------------------------------------------------------------------------------
 
 -- constant variables for buttons
squareSize = 80
label = 60
yCount = 120
xCount = 0

	
	
	-- print data
	currentCountry = event.params.countryName
	printIndex = 1
	
	countryInfo = display.newText( currentCountry, 175, 100, arial, 16 )
	countryInfo:setFillColor( 1, 0, 0 )
	scroll:insert(countryInfo)
	
	openingLines = display.newText(currentCountry.." has been studied by the World Justice Project and has been given the following scores out of 1:", 155, 270, 300, 200, arial, 16)
	openingLines:setFillColor(0,0,0)
	scroll:insert(openingLines)
	
	
-----------------------------------------------------------------------------------------------------------------
-- Loops through tables and prints out the data for the countries
-----------------------------------------------------------------------------------------------------------------
	yloc = 335
	yloc1 = 270
	while(printIndex <= 55) do
	for key,value in pairs(countryData[printIndex]) do 
	if(key == "Country") then typeOfInfo = display.newText(value..":", 155, yloc, 300, 200, arial, 12)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc = yloc + 50 scroll:insert(typeOfInfo) end end 
	for key,value in pairs(countryData[printIndex]) do 
	if(key == currentCountry) then typeOfInfo = display.newText(value, 20, yloc1, arial, 12)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc1 = yloc1 + 50 scroll:insert(typeOfInfo) end end
	printIndex = printIndex + 1 

	end
	
	hyperLink = "https://www.google.com.au/search?q="..currentCountry.."+media&source=lnms&tbm=nws" --hyperlink
	--put button at bottom of page and insert have it system.openURL(hyperLink)
	local newsButton  = display.newText("Country News (Click Me!)", 175, 150, arial, 16)
	newsButton:setFillColor( 0, 0, 0 )
	function newsButton:tap()
	system.openURL( hyperLink ) -- open URL in browser
	end

	newsButton:addEventListener('tap', newsButton) -- when text is pressed it opens the url
	
	
	scroll:insert(image)
	scroll:insert(newsButton)
	sceneGroup:insert(title)
	sceneGroup:insert(scroll)
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