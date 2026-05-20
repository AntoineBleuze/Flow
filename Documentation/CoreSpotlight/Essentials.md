# Essentials.pdf

## Page 1

Search makes your app’s content easier to find, and plays a role both inside your app and for
features like Spotlight Search, Handoff, Siri Suggestions, Reminders, and more. Making your
content searchable enhances the overall user experience of your app and improves the
discoverability of your content.
To help search find your content, create a private, on-device index using the Core Spotlight
framework and add your app’s data to that index. Search works best when you index content that
the person cares about or interacts with directly, such as favorites, items they purchased,
messages they sent and received, and so on.
In addition to the content people can see in your UI, enable the isEligibleForSearch propert
in relevant NSUserActivity objects that your app sends and receives. Enabling this property in
user-initiated activities adds those activities to the on-device index and includes them in
subsequent searches. For more information, see NSUserActivity.
After you identify the content you want to index, collect some details about it. Regardless of
whether an item is a file or some part of your app’s data structures, you provide metadata for that
item to the Core Spotlight index. You specify this metadata using a CSSearchableItem
AttributeSet object, filling out only the properties that make sense for your content. Attribute
sets include data for specific types of content, such as images and music. They also contain more
general information about an item, such as its name, who created it, the subject matter, and more
Create the CSSearchableItemAttributeSet object and fill in as many properties as makes
sense for your data. Attribute sets store simple data types such as strings, numbers, and dates to
Overview
Assemble the item attributes
Core Spotlight / Adding your app’s content to Spotlight indexes
Article
Adding your app’s content to Spotlight
indexes
Create a description for your app’s content and add it to a Spotlight index to make
it searchable.


## Page 2

make the information easier to search. The following example shows a method to index an app-
specific data type that manages a spreadsheet document. The code retrieves data from the
custom type to fill in the relevant attributes:
The CSSearchableItemAttributeSet class supports making a phone call or getting directio
to a location associated with an item. To enable these features, set the item’s supportsPhone
Call or supportsNavigation property to 1 and fill in the relevant phone number or latitude a
longitude information. Only enable these actions when it’s appropriate and they represent a
primary action someone is likely to take. For example, it makes sense to let someone call a
business, but it doesn’t make sense to let someone call a phone number that appears on a
research paper.
With the attributes you collect for each item, create a CSSearchableItem to pass to the indexin
system. For each searchable item, specify these details:
A unique identifier string for locating the item in your app’s data structures
The attribute set with the item’s metadata
An optional string that specifies the domain or owner of the item.
Create searchable items as soon as you have the information to do so. When someone creates a
new item in your app, create a searchable item for it immediately and add it to the index. When
someone changes the title of an item or other details, update the attributes and add it to the index
again. It’s very important to keep your app’s indexes up to date so that searches return current
information. People are more likely to engage with your app if it returns good search results. A hig
level of engagement also helps increase the ranking of your searchable items.
Create a searchable item to find your content later


## Page 3

The following code builds on the previous example by creating a searchable item for a custom ap
data structure. The code uses data from the data item itself to fill in various attributes.
If you expect an item to exist for an extended period of time, set an appropriate value in the item’s
expirationDate property. The system automatically expires items after a period of time, so
setting an expiration date causes the system to preserve the item until the date you specify. If the
person deletes the original data from your app, remove the associated item from the index.
To make your items appear in search results, add them to a CSSearchableIndex object. Indexe
store your app-specific data and remain on the device. You can create multiple indexes for your
app, and might do so to protect someone’s personal information. For example, a music app might
place the general catalog of songs in the default index and someone’s private playlists in an
encrypted index.
The default CSSearchableIndex object supports the indexing of items that don’t require speci
protection. When indexing content that contains more sensitive data, such as someone’s contact
information, create a more secure index using the init(name:protectionClass:) method.
The following example creates a secure index in addition to retrieving the default index for data th
doesn’t require any specific protections:
Add items to a searchable index


## Page 4

To add new items to an index, or to update items already in an index, call the indexSearchable
Items(_:completionHandler:) method of that index. The method incorporates the items
asynchronously into the index and notifies you when the work is done. Typically, you submit items
only when they change, but you might also submit items to extend their expiration date.
Important
Provide a reindexing app extension to keep the index up to date even when your app isn’t
running. For more information, see Regenerating your app’s indexes on demand.
When adding or updating large numbers of items, consider breaking those updates into multiple
batches. Batch updates make it easier for your code to recover from errors or crashes that happe
during the indexing process. The system waits for you to specify your searchable items and end t
batch update before it begins indexing the items. If an error occurs, the metadata you add to the
batch lets you determine the extent of the indexing progress, and where the error occurred.
Note
The default() index doesn’t support batch operations.
The following example shows a function that indexes several items using a batch update. You can
specify any information you want for the client data, but must limit the total size of it to 250 bytes
If any errors occur during the batch update, you can call fetchLastClientState(completio
Handler:) to determine where to start indexing your content again.
Add multiple items to the index in batches


## Page 5

Enabling Apple Intelligence summarization and prioritization
Summarize and prioritize app content using Spotlight extensions.
See Also
Essentials


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

Create a description for your app’s content and add it to a Spotlight index to make it
searchable.


