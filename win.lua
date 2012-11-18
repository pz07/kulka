module (..., package.seeall)

function new()

		local winGroup = display.newGroup()
		
		rock = display.newImage("yourock.jpg", 40, 200)
		winner = display.newImage("tryagain.png", 0, 400)
		
		winner.scene = "game"

		winner:addEventListener("touch", changeScene)

		winGroup:insert(winner)
		winGroup:insert(rock)

		return winGroup
end