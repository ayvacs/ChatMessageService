# ChatMessageService

Easy interface for sending system messages in Roblox's default chat

## API

### Client

<b>TextChatMessage		ChatMessageService:CurrentClient(text: string)</b>

Attempts to post message to the current client only.

Returns a TextChatMessage with TextChatMessage.Status property that indicates the condition of the message.

### Server

<b>TextChatMessage		ChatMessageService:SpecifiedClients(clients: table, text: string)</b>

Attempts to post the message to the specified clients only.

Input: One array of Player instances

Returns an array of [key, value] => [username, TextChatMessage] with TextChatMessage.Status that indicates the condition of the message.

&nbsp;

<b>TextChatMessage		ChatMessageService:AllClients(text: string)</b>

Attempts to post the message to all clients.

Returns an array of [key, value] => [username, TextChatMessage] with TextChatMessage.Status that indicates the condition of the message.