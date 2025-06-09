-- 🔁 Auto Executor: luôn chạy lại script chính khi teleport hoặc respawn

local function loadMainScript()
    local ok, err = pcall(function()
        -- TẢI SCRIPT CHÍNH từ DookDekDEE
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/all-script-2/refs/heads/main/loader.lua"))()
    end)

    if not ok then
        warn("❌ Script error: ", err)
    else
        print("✅ Script loaded.")
    end
end

-- 1. Gọi ngay khi vào game
loadMainScript()

-- 2. Theo dõi teleport nội bộ (vào map, dungeon)
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.InProgress then
        print("🚪 Đang teleport nội bộ... chờ respawn.")
    end
end)

-- 3. Khi nhân vật được spawn lại (sau khi teleport xong)
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    print("🧍 Spawn lại nhân vật. Đang chạy lại script...")
    task.wait(3)
    loadMainScript()
end)
