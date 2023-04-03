--Script made by Misaki#9446

local toggle = false --Toggle random teleport and fling
local speed = 0.1 --Increases/Decreases Speed
local positionY = 0

local LocalPlayer =  game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

function Notification(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification",{ Title = title, Text = text, Icon = "rbxthumb://type=Asset&id=12952454903&w=150&h=150", Duration = 10})
end

local key = game:GetService("UserInputService")
key.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.P then
        if toggle then
            toggle = false
            print("disabled")
            Notification("FE Ultra Fling", "Ultra Fling Disabled")
        else
            toggle = true
            print("Enabled")
            Notification("FE Ultra Fling", "Ultra Fling Enabled")
        end
	end

    if input.KeyCode == Enum.KeyCode.O then
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
end)

function fling_script(target)
    power = 500
    local bambam = Instance.new("BodyThrust")
    bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    bambam.Force = Vector3.new(power,0,power)
    LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    bambam.Location = target.Character.HumanoidRootPart.Position
end

function random_telport()
    while wait(speed) do
        spawn(function()
            if toggle then
                for i=speed,speed do
                    spawn(function()
                        local Target = game.Players:GetPlayers()
                        [math.random(1,#game.Players:GetPlayers())]
                        fling_script(Target)
                        task.wait(speed)
                    end)
                end
            end
        end)
    end
end

Notification("FE Ultra Fling", "Script made by Misaki#9446")
Notification("FE Ultra Fling", "Press P for enable / disable")
random_telport()
