module(..., package.seeall)

function new()

		local gameoverGroup = display.newGroup()

		over = display.newImage("try_again.png", -120, 0)
		over.scene = "game"

		

		over:addEventListener("touch", changeScene)
		
		gameoverGroup:insert(over)
		
		return gameoverGroup

end
