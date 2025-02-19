local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local function isR6(character)
    return character:FindFirstChild("Torso") ~= nil and character:FindFirstChild("Right Leg") ~= nil
end

local function runLocalAnimate(character)
    if isR6(character) then
        print("Character is R6, script will not run.")
        return
    end

    -- Aguardando o carregamento do 'Animate' e do 'Humanoid'
    local Animate = character:WaitForChild("Animate")
    local Humanoid = character:WaitForChild("Humanoid")

    Animate.Disabled = true

    -- Parando qualquer animação em execução
    local animtrack = Humanoid:GetPlayingAnimationTracks()
    for _, track in pairs(animtrack) do
        track:Stop()
    end

    -- Aguardando o carregamento das animações
    local idle = Animate:WaitForChild("idle")
    local walk = Animate:WaitForChild("walk")
    local run = Animate:WaitForChild("run")
    local jump = Animate:WaitForChild("jump")
    local climb = Animate:WaitForChild("climb")
    local fall = Animate:WaitForChild("fall")
    local swim = Animate:WaitForChild("swim")
    local swimidle = Animate:WaitForChild("swimidle")

    -- Substituindo as animações
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921070953"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=99384245425157"
    Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=113199415118199"
    Animate.Disabled = false
end

local function onCharacterAdded(character)
    print(character.Name .. " spawned!")
    if isR6(character) then
        print("Character is R6, script will not run.")
        return
    end
    runLocalAnimate(character)
end

plr.CharacterAdded:Connect(onCharacterAdded)

-- Chamando a função para o personagem atual, se já estiver presente
if plr.Character then
    onCharacterAdded(plr.Character)
end
