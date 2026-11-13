--[[
    KAELIXIFY
    RIVALS-INSPIRED ARENA PACK
    Version 3.0
    For your own Roblox Studio experience.

    IMPORTANT:
    - Replace the six skybox placeholders with uploaded image asset IDs.
    - Replace the audio placeholder with an uploaded audio asset ID.
    - This transparency effect is NOT a true blur effect.
]]

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

local CONFIG = {
    BlurTransparency = 0.25,
    SoundVolume = 0.25,
    ClockTime = 15,
}

-- ARENA TEXTURES
local function blurArena()
    local arena = Workspace:FindFirstChild("Arena")

    if not arena then
        warn("[KAELIXIFY] Arena folder not found")
        return
    end

    for _, object in ipairs(arena:GetDescendants()) do
        if object:IsA("Decal") or object:IsA("Texture") then
            object.Transparency = CONFIG.BlurTransparency
        end
    end
end

-- GREY SKY
local function createGreySky()
    local oldSky = Lighting:FindFirstChildOfClass("Sky")
    if oldSky then
        oldSky:Destroy()
    end

    local sky = Instance.new("Sky")
    sky.Name = "KAELIXIFY_GreySky"

    sky.SkyboxBk = "rbxassetid://YOUR_BACK_ID"
    sky.SkyboxDn = "rbxassetid://YOUR_DOWN_ID"
    sky.SkyboxFt = "rbxassetid://YOUR_FRONT_ID"
    sky.SkyboxLf = "rbxassetid://YOUR_LEFT_ID"
    sky.SkyboxRt = "rbxassetid://YOUR_RIGHT_ID"
    sky.SkyboxUp = "rbxassetid://YOUR_UP_ID"

    sky.Parent = Lighting

    Lighting.ClockTime = CONFIG.ClockTime
    Lighting.Brightness = 1.5
    Lighting.ExposureCompensation = -0.3
    Lighting.Ambient = Color3.fromRGB(100, 100, 110)
    Lighting.OutdoorAmbient = Color3.fromRGB(115, 115, 125)
end

-- AMBIENT AUDIO
local function createAmbientSound()
    local sound = SoundService:FindFirstChild("KAELIXIFY_Ambience")
    if sound then
        sound:Destroy()
    end

    sound = Instance.new("Sound")
    sound.Name = "KAELIXIFY_Ambience"
    sound.SoundId = "rbxassetid://YOUR_AUDIO_ID"
    sound.Volume = CONFIG.SoundVolume
    sound.Looped = true
    sound.Parent = SoundService

    if sound.SoundId ~= "rbxassetid://YOUR_AUDIO_ID" then
        sound:Play()
    end
end

-- START
blurArena()
createGreySky()
createAmbientSound()

print("================================")
print(" KAELIXIFY V3.0 LOADED")
print(" GREY SKY + ARENA EFFECTS")
print("================================")
