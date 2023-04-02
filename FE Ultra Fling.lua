local toggle = false --Toggle
local speed = 0.4 --Increases/Decreases Speed
local positionY = 0

local LocalPlayer =  game.Players.LocalPlayer
local RunService = game:GetService("RunService")

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
end)

function fling_script(player)
    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
    BodyAngularVelocity.AngularVelocity = Vector3.new(10^6, 10^6, 10^6)
    BodyAngularVelocity.MaxTorque = Vector3.new(10^6, 10^6, 10^6)
    BodyAngularVelocity.P = 10^6

    while true do
        RunService.RenderStepped:Wait()
        LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * LocalPlayer.Character.HumanoidRootPart.CFrame.Rotation
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new()
    end

    BodyAngularVelocity.Parent = nil
end

function random_telport()
    while wait(speed) do
        spawn(function()
            if toggle then
                for i=speed,speed do
                    spawn(function()
                        local Target = game.Players:GetPlayers()
                        [math.random(1,#game.Players:GetPlayers())]
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(Target.Character.Head.Position.X, Target.Character.Head.Position.Y - positionY, Target.Character.Head.Position.Z))
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