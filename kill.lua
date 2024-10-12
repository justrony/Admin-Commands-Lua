local CommandModule = require(game.ServerStorage:WaitForChild("CommandModule"))

-- função principal a partir dessa function voce pode criar seus proprios comandos
local function killPlayer(player)
	if player and player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.Health = 0
	end
end
--  A segunda function sempre se repete
local function onPlayerChatted(player, message)
	if CommandModule.hasPermission(player) then
		local command, targetName = message:match("^/(%w+)%s*(.*)")

		if command == "kill" then -- nome do comando (mude caso crie um novo comando)
			if targetName == "me" then
				killPlayer(player) -- sempre mudar o nome da function se vc criar um novo comando
			else
				local targetPlayer = game.Players:FindFirstChild(targetName)
				if targetPlayer then
					killPlayer(targetPlayer) -- aqui tbm
				else
					player:SendMessage("Player não encontrado!")
				end
			end
		end
	end
end


game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		onPlayerChatted(player, message)
	end)
end)
