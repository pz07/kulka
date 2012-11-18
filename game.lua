module(..., package.seeall)

function new()

	local gameGroup = display.newGroup()

	local physics = require("physics")
	physics.start()
	physics.setGravity(0, 10)
	N = 0
	


	-- BACKGROUND
	background = display.newImage("stripes.png")
	background.xScale, background.yScale = 2, 2.5
	gameGroup:insert(background)

	-- FLOOR --
	floor = display.newRect(0, 830, 480, 30)
	floorColor = floor:setFillColor(255, 0, 0)
	physics.addBody(floor,"static", {bounce = 0.2})
	floor.type = "destructible"
	gameGroup:insert(floor)


	-- CIRCLEs -- 
	function spawnball()
    	local ball = display.newImage("bubble.png")
    	gameGroup:insert(ball)
		ball.x = math.random(320)
		ball.y = 30
		physics.addBody(ball, {bounce = 0.5, friction = 0.9})
		
			function delete ()
			ball:removeSelf()
			N = N + 1
				if N > 4 then
				winner = display.newImage("you_win.png", 10, 400)
				winner.scene = "win"
					function changeScene(e)
 						if(e.phase == "ended") then
 							director:changeScene(e.target.scene)
 							winner:removeSelf()	
 						end
					end

					winner:addEventListener("touch", changeScene)
				end
				
			end
			
			if N > 4 then
			win = display.newImage("youwin.png")
			end
		
			function col(event)
				if(event.other.type == "destructible") then
					event.other:removeSelf()
					gameOver = display.newImage("gameover.png", 150, 400)
					gameOver.scene = "gameover"
					
					function onGameOverTouch(e)
						gameOver:removeSelf()	
 						main:changeScene(e)
					end

					gameOver:addEventListener("touch", onGameOverTouch)
						
				end
			end
			ball:addEventListener("touch", delete)
			ball:addEventListener("collision", col)
		
 	end


	--WALLS--
	local leftWall = display.newRect(0, 0, 1, display.contentHeight)
	local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight)

	physics.addBody(leftWall, "static", {bounce = 0,1})
	physics.addBody(rightWall, "static", {bounce = 0.1})


	--SHELFS--
	shelf1 = display.newImage("longcrate.png",40, 350)
	shelf1.rotation = 45
	physics.addBody(shelf1, "static", {bounce = 0.1})
	gameGroup:insert(shelf1)

	shelf2 = display.newImage("longcrate.png",100, 100)
	shelf2.rotation = 60
	physics.addBody(shelf2, "static", {bounce = 0.1})
	gameGroup:insert(shelf2)

	shelf3 = display.newImage("longcrate.png",300, 350)
	shelf3.rotation = 130
	physics.addBody(shelf3, "static", {bounce = 0.1})
	gameGroup:insert(shelf3)

	shelf4 = display.newImage("longcrate.png",180, 270)
	shelf4.rotation = 110
	physics.addBody(shelf4, "static", {bounce = 0.1})
	gameGroup:insert(shelf4)
	
	shelf5 = display.newImage("longcrate.png",340, 100)
	shelf5.rotation = 110
	physics.addBody(shelf5, "static", {bounce = 0.1})
	gameGroup:insert(shelf5)

	--START--
	timer.performWithDelay(500,spawnball,5)
	

	







return gameGroup

end