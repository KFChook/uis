task.spawn(function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer
    repeat task.wait() until LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")

    local gui = Instance.new("ScreenGui")
    gui.Name = "KFChookDiscordWatermark"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.DisplayOrder = 9999
    pcall(function() gui.Parent = LocalPlayer.PlayerGui end)

    local notif = Instance.new("Frame")
    notif.Name = "DiscordWatermark"
    notif.Size = UDim2.fromOffset(210, 53)  -- Changed back to 210
    notif.Position = UDim2.fromOffset(-250, 85)
    notif.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
    notif.BorderSizePixel = 0
    notif.AutomaticSize = Enum.AutomaticSize.Y
    notif.AnchorPoint = Vector2.new(0, 0)
    notif.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 3)
    corner.Parent = notif

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(23, 23, 29)
    stroke.Transparency = 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = notif

    local padding = Instance.new("UIPadding")
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = notif

    local title = Instance.new("TextLabel")
    title.Text = "KFCHook Discord"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(7, 6)
    title.AutomaticSize = Enum.AutomaticSize.XY
    title.BorderSizePixel = 0
    title.Parent = notif

    local info = Instance.new("TextLabel")
    info.Text = "Click to copy  discord.gg/sxaNQcJTn"
    info.Font = Enum.Font.Gotham
    info.TextSize = 14
    info.TextColor3 = Color3.fromRGB(145, 145, 145)
    info.BackgroundTransparency = 1
    info.Position = UDim2.fromOffset(9, 22)
    info.AutomaticSize = Enum.AutomaticSize.XY
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextWrapped = true
    info.BorderSizePixel = 0
    info.Parent = notif

    local infoPadding = Instance.new("UIPadding")
    infoPadding.PaddingBottom = UDim.new(0, 17)
    infoPadding.PaddingRight = UDim.new(0, 8)
    infoPadding.Parent = info

    local bar = Instance.new("Frame")
    bar.AnchorPoint = Vector2.new(0, 1)
    bar.Position = UDim2.new(0, 8, 1, -6)
    bar.Size = UDim2.fromOffset(0, 5)
    bar.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    bar.BorderSizePixel = 0
    bar.Parent = notif

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 999)
    barCorner.Parent = bar

    local lifetime = 8

    TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.fromOffset(20, 85)
    }):Play()

    TweenService:Create(bar, TweenInfo.new(lifetime, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, -16, 0, 5)
    }):Play()

    local function copyToClipboard(text)
        if setclipboard then
            setclipboard(text)
            local originalText = info.Text
            local originalColor = info.TextColor3
            info.Text = "✓ Copied!"
            info.TextColor3 = Color3.fromRGB(75, 181, 67)
            task.wait(1.5)
            info.Text = originalText
            info.TextColor3 = originalColor
        elseif toclipboard then
            toclipboard(text)
            local originalText = info.Text
            local originalColor = info.TextColor3
            info.Text = "✓ Copied!"
            info.TextColor3 = Color3.fromRGB(75, 181, 67)
            task.wait(1.5)
            info.Text = originalText
            info.TextColor3 = originalColor
        end
    end

    local clickable = Instance.new("TextButton")
    clickable.Size = UDim2.new(1, 0, 1, 0)
    clickable.BackgroundTransparency = 1
    clickable.Text = ""
    clickable.Parent = notif

    clickable.MouseButton1Click:Connect(function()
        copyToClipboard("discord.gg/sxaNQcJTn")
    end)

    task.wait(lifetime)

    local slideOut = TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.fromOffset(-250, 85)
    })
    slideOut:Play()
    slideOut.Completed:Wait()
    gui:Destroy()
end)
