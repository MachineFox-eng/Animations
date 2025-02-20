local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local function isR15(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        return humanoid.RigType == Enum.HumanoidRigType.R15
    else
        return false
    end
end

local function runLocalAnimate(character)
    if not isR15(character) then
        print("Personagem é R6; o script não será executado.")
        return
    end

    -- Aguardando o 'Animate' estar disponível
    local Animate = character:WaitForChild("Animate", 5)
    if not Animate then
        warn("Script 'Animate' não encontrado no personagem.")
        return
    end

    Animate.Disabled = true

    -- Aguardando o 'Humanoid' estar disponível
    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then
        warn("Humanoid não encontrado no personagem.")
        return
    end

    -- Parando qualquer animação em execução
    local animTracks = humanoid:GetPlayingAnimationTracks()
    for _, track in ipairs(animTracks) do
        track:Stop()
    end

    -- Aguardando as pastas de animação
    local idle = Animate:WaitForChild("idle", 5)
    local walk = Animate:WaitForChild("walk", 5)
    local run = Animate:WaitForChild("run", 5)
    local jump = Animate:WaitForChild("jump", 5)
    local climb = Animate:WaitForChild("climb", 5)
    local fall = Animate:WaitForChild("fall", 5)
    local swim = Animate:WaitForChild("swim", 5)
    local swimidle = Animate:WaitForChild("swimidle", 5)

    -- Aguardando as animações individuais dentro de cada pasta
    local idleAnim1 = idle:WaitForChild("Animation1", 5)
    local idleAnim2 = idle:WaitForChild("Animation2", 5)
    local walkAnim = walk:WaitForChild("WalkAnim", 5)
    local runAnim = run:WaitForChild("RunAnim", 5)
    local jumpAnim = jump:WaitForChild("JumpAnim", 5)
    local climbAnim = climb:WaitForChild("ClimbAnim", 5)
    local fallAnim = fall:WaitForChild("FallAnim", 5)
    local swimAnim = swim:WaitForChild("Swim", 5)
    local swimIdleAnim = swimidle:WaitForChild("SwimIdle", 5)

    -- Substituindo as animações
    idleAnim1.AnimationId = "http://www.roblox.com/asset/?id=10921117521"
    idleAnim2.AnimationId = "http://www.roblox.com/asset/?id=10921118894"
    walkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921111375"
    runAnim.AnimationId = "http://www.roblox.com/asset/?id=10921104374"
    jumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921322186"
    climbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921070953" -- Nova animação de escalada
    fallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921321317"
    swimAnim.AnimationId = "http://www.roblox.com/asset/?id=10921079380" -- Animação de nadar
    swimIdleAnim.AnimationId = "http://www.roblox.com/asset/?id=10921081059"

    Animate.Disabled = false
end

local function onCharacterAdded(character)
    print(character.Name .. " spawned!")

    if not isR15(character) then
        print("Personagem é R6; o script não será executado.")
        return
    end

    runLocalAnimate(character)
end

plr.CharacterAdded:Connect(onCharacterAdded)

-- Chamando a função para o personagem atual, se já estiver presente
if plr.Character then
    onCharacterAdded(plr.Character)
end
