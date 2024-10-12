
local CommandModule = {}


CommandModule.admins = {339101371, 0000000} -- id dos admins(separados por virgula)

function CommandModule.hasPermission(player)
	for _, id in ipairs(CommandModule.admins) do
		if player.UserId == id then
			return true
		end
	end
	return false
end

return CommandModule
