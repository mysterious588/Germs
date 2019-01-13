--
-- Project: germs
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2015 . All Rights Reserved.
-- 
local scoreTxt
local score=0
local enemy
local titles
local background
local halfW=display.contentWidth*.5
local halfH=display.contentHeight*.5
local centerX=display.contentCenterX
local centerY=display.contentCenterY
display.setStatusBar(display.HiddenStatusBar)
local function main ()
	
background=display.newImageRect( "background.png",halfW*2,halfH*2  )
background.x=centerX
background.y=centerY

background.alpha=0

transition.to ( background, {time=1500,alpha=1,onComplete=title} )


end
function title()

	titles = display.newImage("title.png",halfW*2,halfH*2)
	titles.x=centerX
	titles.y=centerY+50
	titles.alpha=
	titles:scale ( 1, 1 )
	if display.contentHeight<719 then
		titles.xScale=.7
		titles.yScale=.7
		else
		titles.xScale=1
		titles.yScale=1
	end
	
	transition.to(titles,{alpha=1,time=1000,onComplete=trans})	
	end
	function trans()
			transition.to(titles,{alpha=1,time=3000,onComplete=trans1})	
	end
function trans1()
	transition.scaleTo ( titles, {xScale=30,yScale=30,time=1000,onComplete=play} )
end

function play ( )
	titles:removeSelf()
	background:removeSelf()


txt=display.newText(  "kill as many germs as you can,tap here to continue", centerX, centerY, Helvetica, 36 )
txt.alpha=0
txt.x=centerX
txt.y=centerY
transition.to ( txt, {alpha=1,time=1000} )
function txt:touch(event)
	
	if event.phase=="began" then
    scoreTxt = display.newText( "Score: 0", halfW, 30, "Helvetica", 22 )
	txt:removeSelf()
	timer.performWithDelay ( math.random(1000,1500), enemy ,0 )
	end
	

	
end
txt:addEventListener ( "touch", txt )
end
function enemy(obj)
enemy=display.newImage( "enemy.png"  )
enemy.x=math.random (display.contentWidth)
enemy.y=math.random(display.contentHeight)
enemy.alpha=0
enemy.xScale=.5
enemy.yScale=.5
	transition.to(enemy,{time=100,alpha=1})
enemy:addEventListener ( "touch", killEnemy )
if display.contentHeight > 721
	then 
	enemy.xScale=1
	enemy.yScale=1
	else
	enemy.xScale=.5
     enemy.yScale=.5
end
end
function killEnemy(event)
	local obj = event.target
	display.remove( obj )


 scoreTxt.text = "Score: " ..score
 score=score+1
 if score ==15 then
 	win()
end
end
function win()
	local wintxt=display.newText( "u won  ", halfW, 1, "arial", 30 )
	wintxt.alpha=0
	transition.to(wintxt,{time=500,alpha=1,y=centerX})


end



main()
