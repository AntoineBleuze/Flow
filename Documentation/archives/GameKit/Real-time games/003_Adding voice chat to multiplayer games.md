# 003_Adding voice chat to multiplayer games.pdf

## Page 1

Important
The GKVoiceChat class is deprecated. Use SharePlay instead. See Enable the local player to
choose other players and startGroupActivity(playerHandler:).
Use the GKVoiceChat class to implement voice communication among players in a multiplayer
game. Enable the player to communicate with all players in a group chat or a subset of players
using separate audio channels. GameKit handles the low-level voice encoding and transmission fo
you; you add the controls to choose players, start and stop chats, mute players, and change the
volume.
To learn about audio channels, see the AVFAudio framework.
Note
A player can only participate in voice chat when their device has a microphone and it’s
connected to a Wi-Fi network. But, your game can configure and start voice chat when the
device isn’t currently capable of using voice chat. If conditions change to allow voice chat —
for example, the device connects to Wi-Fi — the voice chat object automatically connects to
the associated channel.
To configure voice chat, add the NSMicrophoneUsageDescription key to the Information
Property List in your project. Set it to a string that GameKit presents to the player when your gam
attempts to access the microphone. The string needs to state the reason your game needs acces
Overview
Configure voice chat
GameKit / Adding voice chat to multiplayer games
Article
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.


## Page 2

to the microphone. If the user doesn’t allow access, when you attempt to start voice chat, it fails
with an error.
Next, activate the system audio so that GameKit can use the default audio session for voice chat.
You can use one or more separate audio channels for voice chat. For example, use one channel fo
communicating with all the players and another channel for communicating between team
members.
Create a GKVoiceChat object that specifies a unique name for the channel. To communicate on
the same channel, players need to use the same channel name. A GameKit match can have multip
channels, and a player can join as many channels as they want. If the player joins multiple channe
GameKit mixes the audio it receives from each channel into one audio output.
To start voice chat on a channel, set the voice chat properties, such as the volume level, and invo
the start() method.
The first time your game accesses the microphone on the player’s device, the system presents a
dialog to the user that displays the reason your app wants permission to use the microphone. If yo
don’t provide a reason that the system presents to the player or the player doesn’t grant
permission, GameKit won’t start the channel. To provide a reason, add the NSMicrophoneUsage
Description key to the Information Property List.
Create separate voice channels
Start voice chat


## Page 3

If the player grants permission, the voice chat object connects to the channel and GameKit notifie
other players connected to the channel that the player joined the chat. When the player is
connected, GameKit automatically plays voice data from other players.
After you start voice chat on a channel, the player can hear the other players speak but you need 
activate the microphone so GameKit can begin transmitting the player’s voice to the channel.
For a single channel, you can enable the microphone immediately after you start the chat, so that
the player can begin speaking. Alternatively, you can provide a control for the player to activate th
microphone when speaking, like a push-to-talk style interface. Use the isActive property to
enable the microphone:
If the match has multiple channels, only one channel can use the microphone at a time. When you
activate a channel, GameKit deactivates the other channels in the match. So, you need to provide
control in the interface for the player to choose the channel before speaking.
You need to implement an interface that displays the status of players, shows when players
connect and speak, mutes other players, and changes the volume of individual channels.
First, update your interface when the state of a player changes. Set the playerVoiceChatStat
DidChangeHandler property to perform an action when a player connects, speaks, or
disconnects from the chat. For example, highlight the avatar for the player who is speaking.
Activate and switch the microphone between channels
Add controls and feedback to your interface


## Page 4

Then, you can add a control that allows the player to mute other players including themselves usin
the setPlayer(_:muted:) method. Finally, add another control for the player to adjust the
volume of individual channels using the volume property.
To stop transmitting data over the channel, use the stop() method, and deactivate the audio
session. If you mute all the players, GameKit still sends the data to the local player, so instead use
the stop() method.
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Stop voice chat
See Also
Real-time games


## Page 5

Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
matches.
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find the best
matches.
class GKMatchRequest
An object that encapsulates the parameters to create a real-time or turn-based match.
class GKMatchmaker
An object that creates matches with other players without presenting an interface to the
players.
class GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and automatch to
fill any empty slots.
protocol GKInviteEventListener
A protocol that handles invite events from Game Center.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


