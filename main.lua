--[[



CLIENT:



TextChatMessage		ChatMessageService:CurrentClient(text: string)
						Attempts to post message to the current client only
						Returns a TextChatMessage with TextChatMessage.Status property that indicates the condition
						of the message.



SERVER:


TextChatMessage		ChatMessageService:SpecifiedClients(clients: table, text: string)
						Attempts to post the message to the specified clients only
						Input: One array of Player instances
						Returns an array of [key, value] => [username, TextChatMessage] with TextChatMessage.Status
						that indicates the condition of the message.

TextChatMessage		ChatMessageService:AllClients(text: string)
						Attempts to post the message to all clients
						Returns an array of [key, value] => [username, TextChatMessage] with TextChatMessage.Status
						that indicates the condition of the message.

]]


local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local RBXGeneral = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")

local ChatMessageService = {}


if RunService:IsClient() then
	
	function ChatMessageService:CurrentClient(text: string)
		return RBXGeneral:DisplaySystemMessage(text)
	end
	
elseif RunService:IsServer() then
	
	function ChatMessageService:SpecifiedClients(clients: table, text: string)
		local results = {}
		for _, plr in pairs(clients) do
			results[plr.Name] = script.ClientMakeMessage:InvokeClient(plr, text)
		end
		return results
	end
	
	function ChatMessageService:AllClients(text: string)
		return ChatMessageService:SpecifiedClients(Players:GetPlayers(), text)
	end
	
end


return ChatMessageService