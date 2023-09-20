local TextChatService = game:GetService("TextChatService")
local RBXGeneral = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")


game:GetService("ReplicatedStorage").ChatMessageService.ClientMakeMessage.OnClientInvoke = function(text: string)
	--print("Printing message: (" .. (tostring(text) or "?") .. ")")
	return RBXGeneral:DisplaySystemMessage(text)
end