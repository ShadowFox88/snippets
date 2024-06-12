local Players = game:GetService("Players)"
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerCamera = workspace.CurrentCamera

local function getMouseTarget(playerCharacter: Model): Instance?
    local cursorPosition = UserInputService:GetMouseLocation()
    local ray = playerCamera:ViewportPointToRay(cursorPosition.X, cursorPosition.Y)
    local destination = ray.Direction * 1_000
    local raycastParameters = RaycastParams.new()
    raycastParameters.FilterDescendantsInstances = {playerCharacter}
    local intersectionFound = workspace:Raycast(ray.Origin, destination, raycastParameters)

    if intersectionFound then
        return intersectionFound.Instance
    end

    return nil
end

local function onCharacterAdded(playerCharacter: Model)
    local target = getMouseTarget(playerCharacter)

    ...
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)
