# 001_Enabling Apple Intelligence summarization and prioritization.pdf

## Page 1

In iOS 18.4 and macOS 15.4 and later, Apple Intelligence can optionally summarize mail, message
and audio transcripts, and prioritize mail and messages content when you provide the content to
Core Spotlight.
Enable this functionality by providing a Spotlight delegate app extension for your app.
The following example demonstrates adding summarization and prioritization to a messaging app
The process you use to add a Spotlight app extension is the same for other kinds of apps; the
difference is the content type of the items that the system indexes to Spotlight.
To create a Spotlight delegate app extension, add a new target to your app’s Xcode project and
select “CoreSpotlight Delegate”.
In the app extension, override the searchableItemsDidUpdate(_:) method to write to the
app’s shared group information store, such as a database:
Overview
Create a Spotlight delegate app extension
Core Spotlight / Enabling Apple Intelligence summarization and prioritization
Article
Enabling Apple Intelligence summarization
and prioritization
Summarize and prioritize app content using Spotlight extensions.


## Page 2

Spotlight calls this method whenever a mail, message, or audio transcript you provide finishes
processing and Apple Intelligence updates it with a summary or priority.
In your messaging app, you create a CSSearchableItem that contains the content Spotlight
indexes:
The app then sets the listener flag to include summarization or prioritization (or both):
And, lastly, the app adds the CSSearchableItem to Spotlight:
In order for Apple Intelligence to summarize or prioritize a CSSearchableItem, set the following
attributes, based on the type of default app:
Mail apps
Messaging apps
Audio Transcripts
authors
authors
Create a searchable item in your app
Select the correct attributes for your default app


## Page 3

Mail apps
Messaging apps
Audio Transcripts
contentCreationDate
contentCreation
Date
contentCreationDate
domainIdentifier
domainIdentifier
domainIdentifier
htmlContentData or text
Content
textContent
transcribedText
Content
uniqueIdentifier
uniqueIdentifier
uniqueIdentifier
In iOS 18.4 and later and macOS 15.4 and later, Apple Intelligence supports optional summarizatio
of email and message threads; these are separate capabilities that your app can adopt as needed
To summarize multiple messages in a conversation, adopt INSearchForMessagesIntent in
your app. This class enables Apple Intelligence to fetch previously unread messages from a
conversation. Provide a domainIdentifier when indexing these messages into Spotlight; App
Intelligence uses the domainIdentifier to group messages into conversations.
To summarize multiple emails in a conversation, provide implementations of Assistant
Entity(schema:) in your app for the account, mailbox, and message entities; these entitie
are part of the App Intents API, and enable Apple Intelligence to fetch previously unread emails
from the conversation. As with message summarization, provide domainIdentifier when
indexing emails into Spotlight. Apple Intelligence uses the domainIdentifier to group emails
into conversations. The domainIdentifier needs to be globally unique across accounts and
mailboxes.
With this information, the email thread summarization process proceeds as follows:
1. Your app provides email for Spotlight to index. Populate the domainIdentifier property wit
the identifier for the conversation to which the email belongs.
2. The system asks Spotlight for the email identifiers for all emails sharing the same domain
Identifier.
3. The system issues a query to your app with the email identifiers from the previous step. Respo
with the emails matching the identifiers the system provides in the App Entity query.
4. Apple Intelligence combines the email from the initial indexing request and any additional emai
messages the system receives from your app as part of the follow-up request, and summarizes
their content.
Enable summarization for email and message
threads


## Page 4

5. Your app receives a callback from Core Spotlight that contains the summarization result.
Apple Intelligence only considers an item for summarization or prioritization when it meets the
following criteria:
The contentType contains one of the following UTI types: message or emailMessage, or
public.voice-audio.
The item has either the CSSearchableItemFlagNeedsSummary or CSSearchableItem
FlagNeedsPriority options set.
The contentCreationDate is no more than 24 hours old.
The content isn’t empty; this criteria applies specifically to textContent for messages, text
Content or htmlContentData for mail, and transcribedTextContentfor voice audio
transcripts.
For summarization, the CSSearchableItemFlagNeedsSummary option is set to true and
the content is at least 200 characters in length.
If you adopt INSearchForMessagesIntent to support multiple message summarization,
Apple Intelligence uses the combined content length of the unread message history, which mu
be at least 200 characters to be eligible for summarization.
For prioritization, the CSSearchableItemFlagNeedsPriority option is set.
Mail or messages need authors, and the system doesn’t summarize the same CSSearchabl
Item twice, even if you present the item to Core Spotlight again.
Note
Only mail or messages support priority classification, not audio transcripts. The contentType
must conform to one of the following types: message or emailMessage.
Adding your app’s content to Spotlight indexes
Ensure your searchable item is eligible
See Also
Essentials


## Page 5

Create a description for your app’s content and add it to a Spotlight index to make it
searchable.


