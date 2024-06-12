local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function onPlayerAdded(player)
	-- the rest of your code goes here...
end

-- this block will run only if the script is being run within studio

-- the reason this is done in the first place is because the server run by
-- studio fires the PlayerAdded event way before we can even connect a function
-- to the event - to combat this, we get every player and pass the player into
-- it, running it directly
if RunService:IsStudio() then
	for _, player in Players:GetPlayers() do
		task.spawn(onPlayerAdded, player)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
