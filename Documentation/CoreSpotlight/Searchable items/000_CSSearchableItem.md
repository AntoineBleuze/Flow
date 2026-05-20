# 000_CSSearchableItem.pdf

## Page 1

Enabling Apple Intelligence summarization and prioritization
Adding your app’s content to Spotlight indexes
Searching for information in your app
A CSSearchableItem uniquely identifies a part of your app’s content, and provides the metada
that Spotlight indexes and uses to find that content later. As part of indexing your app’s content,
you create searchable items and fill them with details about your app’s content and where to find 
After indexing the content, you can then execute queries using the Core Spotlight APIs to find the
items you indexed. People can also use the system’s Spotlight search interface to find your app’s
content.
When you create or update content in your app, create a CSSearchableItem for that content if
you want it to be searchable. A searchable item contains identification strings you use to locate th
item in your content and a CSSearchableItemAttributeSet object with details about the
item. For the metadata, you typically want to provide values for the title, displayName, and
contentType attributes at a minimum. If you’re indexing a file on disk, provide a value for the
contentURL attribute. Fill in as many other attributes as makes sense for the content you’re
indexing.
Mentioned in
Overview
Core Spotlight / CSSearchableItem
Class
CSSearchableItem
The details of your app-specific content that someone might search for on their
devices.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

After creating a searchable item, index it using a CSSearchableIndex object. As you update yo
app’s content, update your CSSearchableItem objects for that content and index them right
away. If you delete content, similarly delete the searchable items from the index. Keeping your
app’s indexes current ensures that searches return valid information. For more information on
indexing your content, see Adding your app’s content to Spotlight indexes.
init(uniqueIdentifier: String?, domainIdentifier: String?, attributeSet
CSSearchableItemAttributeSet)
Returns a searchable item associated with the specified identifier, domain identifier, and
attribute set.
var uniqueIdentifier: String
The value that uniquely identifies the searchable item within your app.
var domainIdentifier: String?
An optional identifier that represents the domain or owner of the item.
var attributeSet: CSSearchableItemAttributeSet
The set of attributes that contain metadata associated with the item in a CSSearchable
ItemAttributeSet object.
var expirationDate: Date!
The date after which the searchable item should no longer exist.
var isUpdate: Bool
A Boolean value that indicates whether to treat the item as an update instead of a new item.
let CSSearchableItemActionType: String
Indicates that the activity type to continue is related to a searchable item.
let CSSearchableItemActivityIdentifier: String
The key you use to access a searchable item in a user activity object.
Topics
Getting a searchable item
Setting attributes on a searchable item
Continuing a search or activity


## Page 3

let CSQueryContinuationActionType: String
Indicates that the activity type to continue is a search or query.
let CSSearchQueryString: String
Provides the key for the current query in the info dictionary of the user activity object.
func compare(byRank: CSSearchableItem) -> ComparisonResult
Compares two items by rank and returns the result.
struct UpdateListenerOptions
The set of options that contain metadata-associated summarization and prioritization of a
searchable item.
convenience init(appEntity: some IndexedEntity)
Initializes a new searchable item with the relevant fields populated from the provided app
entity.
convenience init<Entity>(appEntity: Entity, priority: Int)
Initializes a new searchable item with the relevant fields populated from the provided app
entity.
var updateListenerOptions: CSSearchableItem.UpdateListenerOptions
func associateAppEntity(some IndexedEntity, priority: Int)
Associates an app entity with this searchable item.
Comparing items
Structures
Initializers
Instance Properties
Instance Methods
Relationships


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CSSearchableItemAttributeSet
The detailed metadata for a searchable item.
class CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
class CSLocalizedString
An object that displays localized text in search results related to your app.
class CSPerson
An object that represents a person in the context of search results.
Inherits From
Conforms To
See Also
Searchable items


