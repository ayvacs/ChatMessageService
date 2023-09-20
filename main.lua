local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local RBXGeneral = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")

local ChatMessageService = {}

local startTime = tick()
function debounce()
	-- wait for chat to initialize
	repeat wait() until (tick() - startTime) >= 1
end

if RunService:IsClient() then
	
	function ChatMessageService:CurrentClient(text: string)
		debounce()
		return RBXGeneral:DisplaySystemMessage(text)
	end
	
elseif RunService:IsServer() then
	
	function ChatMessageService:SpecifiedClients(clients: table, text: string)
		debounce()
		local results = {}
		for _, plr in pairs(clients) do
			results[plr.Name] = script.ClientMakeMessage:InvokeClient(plr, text)
		end
		return results
	end
	
	function ChatMessageService:AllClients(text: string)
		debounce()
		return ChatMessageService:SpecifiedClients(Players:GetPlayers(), text)
	end
	
end


return ChatMessageService