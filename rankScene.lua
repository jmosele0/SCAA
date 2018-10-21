local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

 

-- ===================================================================================
-- Scene event functions
-- ===================================================================================

-- -----------------------------------------------------------------------------------
-- Search function
-- -----------------------------------------------------------------------------------

labeld=50
xCount=50
yCount=120
squareSize=80
local function searchCountries(text)
temp={}
xCount=50
yCount=yCount+140
leng=string.len(text)
if (string.sub(text,1,1)==string.sub(text,1,1):lower()) then
     for i=1, #buttons do
        str=buttons[i].id:lower()
        if (text==str:sub(1, leng)) then
              table.insert(temp,buttons[i])
        end
     end
else
     for i=1, #buttons do
        str=buttons[i].id
        if (text==str:sub(1, leng)) then
              table.insert(temp,buttons[i])
        end
     end
end
buttonView=temp
for i=1, #buttonView do
    buttonView[i].x=xCount
    buttonView[i].y=yCount
	if (string.find(buttonView[i].label, "\n")~=nil) then
	buttonView[i].y=buttonView[i].y+10
	end
	
   
end
--composer.removeScene("searchScene", true)
composer.gotoScene("searchScene")
end



local function inputCountries( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        
 
    elseif ( event.phase == "editing" ) then
	    
		
		searchCountries(event.newCharacters)
        
    end
end


-- local function goBack(event)
	
		-- composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
-- end

-- local		backButton = widget.newButton(
			-- {
				-- onRelease = goBack,
				-- label = "X",
				-- x = 300,
				-- y = 80,
				-- width = 80,
				-- height = 80,
			-- }
			-- )
	-- sceneGroup:insert(backButton)
-----------------------------------------------------------------------------------------------------------------
-- Sort Button and function
-----------------------------------------------------------------------------------------------------------------
	
local widget = require( "widget" )
 
-- Function to handle button events
local function showOptions( event )
 
    composer.gotoScene("sortScene", {effect="slideLeft", time=500, params=customParams})
	
end
 
-- Create the widget
local srtButton = widget.newButton(
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
buttons = {}


buttonView={}

-----------------------------------------------------------------------------------------------------------------
-- Country buttons looping
-----------------------------------------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

    local sceneGroup = self.view
	countries ={ "Afghanistan", "Albania", "Antigua and\n   Barbuda", "Argentina", "Australia", "Austria", "Bahamas", "Bangladesh", "Barbados", "Belarus", "Belgium",
 "Bolivia", " Bosnia and \nHerzegovina", "Botswana", "Brazil", "Bulgaria", "Burkina Faso", "Cambodia", "Cameroon", "Canada", "Chile", "China", "Colombia", "Costa Rica",
 "Cote d'Ivoire", "Croatia", "  Czech \nRepublic", "Denmark", "Dominica", "Dominican \n Republic", "Ecuador", "Egypt", "El Salvador", "Estonia", "Ethiopia", "Finland",
 "France", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guyana", "Honduras", "Hong Kong", "Hungary", "India", "Indonesia", "Iran", "Italy",
 "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kyrgyzstan", "Lebanon", "Liberia", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Mexico", "Moldova",
 "Mongolia", "Morocco", "Myanmar", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Nigeria", "Norway", "Pakistan", "Panama", "Peru", "Philippines", "Poland",
 "Portugal", "Republic of \n    Korea", "Romania", "Russia", "Senegal", "Serbia", "Sierra Leone", "Singapore", "Slovenia", "South Africa", "Spain", "Sri Lanka",
 "  St. Kitts\nand Nevis", "St. Lucia", "Suriname", "Sweden", "Tanzania", "Thailand", "      The \nGrenadines", "Trinidad and \n    Tobago", "Tunisia", "Turkey", 
 "Uganda", "Ukraine", "United Arab \n  Emirates", "  United \nKingdom", "United \nStates", "Uruguay", "Venezuela", "Vietnam"}
--]]	
	altCountries={"Antigua and Barbuda","Bosnia and Herzegovina", "Czech Republic", "Dominican Republic", "Republic of Korea", "St. Kitts and Nevis", "St. Vincent and the Grenadines", "Trinidad and Tobago",
 "United Arab Emirates", "United Kingdom", "United States of America"}	
    t=1
	for i = 1, #countries do
	-- Create 2D array to hold our objects.
	labels=countries[i]
	if (string.find(labels, "\n")~=nil) then
	labels=altCountries[t]
	t=t+1
	labeld=60
	
	else
	labeld=50
	
	end
	
	
	
	xCount = 50
	yCount = yCount+140
	
	buttons[i] = widget.newButton(
	{
	label = countries[i],
	labelColor = {default = {0,0,0}},
	labelYOffset = labeld,
	onRelease = showInfo,
	id = labels,
	x = xCount, 
	y = yCount,
	width = 80,
	height = 80,
	defaultFile=labels.."-01.png"
	}
	)
	buttons[i].label=countries[i]

	
	
	

	
	end
countries=nil
altCountries=nil

buttonView=buttons
    
	local function goBack(event)
	
		 composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	 end

	local		backButton = widget.newButton(
			 {
				 onRelease = goBack,
				 label = "X",
				 x = 300,
				 y = 60,
				 width = 80,
				 height = 80,
			 }
			 )
	 sceneGroup:insert(backButton)
	 

 
	
end
   
    
-----------------------------------------------------------------------------------------------------------------
-- Scrolling
----------------------------------------------------------------------------------------------------------------- 
-- show()
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  if ( phase == "will" ) then
    local scrollView = widget.newScrollView
	 {
		left = 0,
		top = 50,
		width = 400,
		height = 500,
		topPadding = -50,
		bottomPadding = 50,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		backgroundColor = {1,1,1,1},
		
 }
 
 for i=1, #buttonView do

	    scrollView:insert(buttonView[i])
end	

   
    sceneGroup:insert(scrollView)
    sceneGroup:insert(searchBar)
    sceneGroup:insert(srtButton)
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
searchBar = native.newTextField( 140, 0, 250, 50 )
searchBar:addEventListener( "userInput", inputCountries )
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -----------------------------------------------------------------------------------
 
return scene