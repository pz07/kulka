function changeScene(e)
 	if(e.phase == "ended") then
 		director:changeScene(e.target.scene)	
 	end
end

local director = require("director")
local mainGroup = display.newGroup()

mainGroup:insert(director.directorView)
director:changeScene("game")