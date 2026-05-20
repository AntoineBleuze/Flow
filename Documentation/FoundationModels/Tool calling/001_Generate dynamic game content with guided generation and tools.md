# 001_Generate dynamic game content with guided generation and tools.pdf

## Page 1

This sample code project demonstrates the Foundation Models framework and its ability to
generate dynamic content for a game. Instead of using the same dialog script for customer
encounters, the app dynamically generates dialog so that each time a player talks to a character,
they can have a different conversation.
Overview
Foundation Models / Generate dynamic game content with guided generation and tools
Sample Code
Generate dynamic game content with
guided generation and tools
Make gameplay more lively with AI generated dialog and encounters personalized
to the player.
Download
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
Xcode 26.0+


## Page 2

The game combines several framework capabilities — like guided generation and tool calling — to
create dynamic, personalized gameplay experiences. You interact with both scripted characters,
like the head barista, and procedurally generated customers, each with unique personalities,
appearances, and coffee orders. As you serve customers, you can engage in conversations, take
custom coffee orders, and receive feedback on your brewing skills — all powered by an on-device
foundation model.
Note
This sample code project is associated with WWDC25 sessions 301: Deep Dive into the
Foundation Models Framework.
The sample app generates dialog for characters by using Character to describe the character,
like the barista:
Generate character dialog


## Page 3

A persona is a detailed description of the character that the model should pretend to be. The ap
uses a fixed error response when it encounters a generation error or content that the system
blocks for safety.
The DialogEngine class manages conoversations for all characters in the game using Languag
ModelSession. Each character maintains their own conversation session, allowing for persisten
contextual dialog that remembers previous interactions. When a conversation begins with a
character, the dialog engine creates a new session with specific instructions that define the
character’s personality and role:
When the player provides input text to talk to the character, the sample app uses the input as a
prompt to the session. When generating a response, the dialog engine includes safety mechanism
to keep conversations on topic. It maintains block lists for words and phrases that characters
shouldn’t discuss, ensuring nonplayer characters (NPCs) focus on coffee-related topics. If the ap
generates content containing blocked terms, it automatically resets the conversation and provide
the default error response for the character.


## Page 4

If the output dialog fails the blocked phrases check, the model may break character or discuss
something that’s outside of the game world. To keep the dialog immersive, set nextUtterance 
the character’s fixed error response and reset the session.
The EncounterEngine creates unique customer encounters using the Generable protocol to
generate structured content. Each encounter produces an NPC with a name, coffee order, and
visual description.
The process of generating an NPC uses a LanguageModelSession with a prompt that provide
examples of the output format:
Generate random encounters


## Page 5

Each generated NPC includes a GenerableImage that creates a visual representation of the
character by using Image Playground. The image generation avoids human-like appearances,
focusing instead on fantastical creatures, animals, and objects that fit the dream realm aesthetic.
The GenerableImage class shows how to use GenerationSchema to describe the properties
and guides of the object. This allows for creating dynamic schemas when all of the details of the
generable type isn’t known until runtime.
The game uses the on-device model to evaluate player performance through the judge
Drink(drink:) method in the encounter engine. When the player creates a coffee drink for a
customer, the model assumes the customer’s persona and provides feedback on whether the drin
matches their original order.
The judging system creates a new LanguageModelSession that uses the specific customer’s
personality and preferences, and a prompt that provides the drink details for the model to evaluat
Use a language model to judge in-game creations


## Page 6

The model then compares the player’s creation against the customer’s original order, providing
contextual feedback that’s authentic to the character’s personality. This creates a dynamic
evaluation system where the same drink might receive different reactions from different custome
based on their unique preferences and personas.
For customers that the sample generates, provide the dialog engine with custom tools, like
CalendarTool to create more personalized interactions. This allows characters to reference the
player’s on-device information, making conversations feel more natural and connected to the
player’s actual life.
The CalendarTool integrates with EventKit to access the player’s calendar events, and allows
characters to reference real upcoming events that involve the customer’s name if they are an
attendee:
The tool description tells the model what it uses the tool for:
The sample app also provides a ContactTool that accesses the player’s contacts to find names
of people born in specific months. This allows the game to generate a coffee shop customer with
names the player is familiar with.
Use tools to personalize game content


## Page 7

Expanding generation with tool calling
Build tools that enable the model to perform tasks that are specific to your use case.
protocol Tool
A tool that a model can call to gather information at runtime or perform side effects.
See Also
Tool calling


