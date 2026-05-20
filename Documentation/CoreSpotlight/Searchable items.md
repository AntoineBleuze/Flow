# Searchable items.pdf

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


## Page 5

Adding your app’s content to Spotlight indexes
Searching for information in your app
A CSSearchableItemAttributeSet contains an extensive set of attributes that describe you
app’s content. Attributes include information such as its title and a brief description. They can als
refer to who created the item, what kind of data it represents, when someone created it, and more
During the indexing process, you create CSSearchableItem objects and use a CSSearchable
ItemAttributeSet to fill in the attributes for that item. During a search, you can query the inde
for items with attributes that match specific values.
When creating a CSSearchableItem, it’s important to fill out as much information in the
accompanying CSSearchableItemAttributeSet object as possible. You don’t have to provid
values for every attribute. Instead, choose attributes that match the domain of your content. This
type divides attributes into groups such as media, documents, events, places, music, images, and
more. You can also add custom attributes to describe new types of content. When defining custo
attributes, be as specific as possible in your definition, and provide a value for the contentType
Tree property so your custom attribute inherits from a known type.
Mentioned in
Overview
Core Spotlight / CSSearchableItemAttributeSet
Class
CSSearchableItemAttributeSet
The detailed metadata for a searchable item.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 6

Important
Modify a CSSearchableItemAttributeSet object on only one thread at a time.
Concurrent access to properties in an attribute set has undefined behavior.
init(contentType: UTType)
Creates an attribute set for the specified content type.
func setValue((any NSSecureCoding)?, forCustomKey: CSCustomAttributeKey
Sets the value for a custom attribute key.
func value(forCustomKey: CSCustomAttributeKey) -> (any NSSecureCoding)?
Returns the value associated with the specified custom attribute key.
var isPriority: NSNumber?
A Boolean value that indicates whether the mail or messages content represents a prioritized
item.
var textContentSummary: String?
A string that presents the Apple Intelligence summarization of the item.
var transcribedTextContent: String?
A string that represents the text the system transcribed.
var audiences: [String]?
A class of entity for which the item is intended or useful.
var contentDescription: String?
A description of the item’s content.
Topics
Getting an attribute set
Working with custom attributes
Describing Apple Intelligence prioritization and summarization
Describing documents


## Page 7

var creator: String?
The name of the app that created the content.
var encodingApplications: [String]?
The name of the apps that converted the original content into a PDF stream.
var fileSize: NSNumber?
The size of the document file.
var fontNames: [String]?
An array of font names the document uses.
var identifier: String?
A formal identifier that references the document the item represents.
var kind: String?
A description of the kind of document the item represents.
var pageCount: NSNumber?
The number of pages in the document.
var pageHeight: NSNumber?
The height of the document page, in points (72 points per inch).
var pageWidth: NSNumber?
The width of the document page, in points (72 points per inch).
var securityMethod: String?
The security method (a type of encryption) that protects the document file.
var subject: String?
The subject of the document.
var theme: String?
The theme of the document.
var alternateNames: [String]?
An array of localized strings that represent alternate display names for the item.
var contentType: String?
The uniform type identifier (UTI) of the item.
Describing general attributes


## Page 8

var contentTypeTree: [String]?
An attribute type that identifies a custom hierarchy of types to describe the attributes of you
item.
var contentURL: URL?
The file URL of the content to index.
var darkThumbnailURL: URL?
The local file URL of the thumbnail image for the item when Dark Mode is active.
var displayName: String?
A localized string that contains the name of the item, suitable to display in the user interface
var keywords: [String]?
An array of keywords associated with the item, such as work, birthday, important, and so on.
var metadataModificationDate: Date?
The date on which the last metadata attribute was changed.
var path: String?
The complete path to the item.
var rankingHint: NSNumber?
A number that indicates the relative importance of the item among other items from the app
var relatedUniqueIdentifier: String?
The unique identifier for the item to which the activity is related.
var thumbnailData: Data?
Image data that represents the thumbnail of the item.
var thumbnailURL: URL?
The local file URL of the thumbnail image for the item.
var title: String?
The title of the item.
var domainIdentifier: String?
An identifier that represents the domain or owner of the item.
var weakRelatedUniqueIdentifier: String?
The unique identifier for the item to which the activity is related, but not linked.


## Page 9

var userCreated: NSNumber?
A value that indicates the user created the item.
var userCurated: NSNumber?
A value that indicates the user selected the item.
var userOwned: NSNumber?
A value that indicates the user purchased or owns the item.
var allDay: NSNumber?
A value that indicates if the event covers an entire day.
var completionDate: Date?
The date on which the item was completed.
var dueDate: Date?
The date on which the item is due.
var endDate: Date?
The end date for the item.
var importantDates: [Date]?
An array of important dates associated with the item.
var startDate: Date?
The start date for the item.
var altitude: NSNumber?
The altitude of the item in meters above sea level, expressed using the WGS84 datum.
var city: String?
The city of the item’s origin according to guidelines that the provider establishes.
var country: String?
Describing user involvement
Describing events
Describing places


## Page 10

The full, publishable name of the country or region in which the intellectual property of the
item was created, according to guidelines the provider establishes.
var gpsAreaInformation: String?
Information about the GPS area.
var gpsdop: NSNumber?
The GPS dilution of precision value.
var gpsDateStamp: Date?
The date and time related to the GPS value.
var gpsDestBearing: NSNumber?
The bearing to the destination point.
var gpsDestDistance: NSNumber?
The distance to the destination point.
var gpsDestLatitude: NSNumber?
The latitude of the destination point.
var gpsDestLongitude: NSNumber?
The longitude of the destination point.
var gpsDifferental: NSNumber?
The differential correction applied to the GPS receiver.
var gpsMapDatum: String?
The geodetic data that the GPS receiver uses.
var gpsMeasureMode: String?
The measurement precision mode in use by the GPS receiver.
var gpsProcessingMethod: String?
The location finding method that the GPS receiver uses.
var gpsStatus: String?
The status of the GPS receiver.
var gpsTrack: NSNumber?
The direction of travel of the item in degrees from true north.
var headline: String?
A publishable string that provides a synopsis of the contents of the item.


## Page 11

var imageDirection: NSNumber?
The direction of the item’s image in degrees from true north.
var instructions: String?
Instructions that concern the use of the item, such as an embargo or warning.
var latitude: NSNumber?
The latitude of the item, in degrees north of the equator, expressed using the WGS84 datum
var longitude: NSNumber?
The longitude of the item, in degrees east of the prime meridian, expressed using the WGS8
datum.
var namedLocation: String?
The name of the location or point of interest associated with the item.
var speed: NSNumber?
The speed of the item, in kilometers per hour.
var stateOrProvince: String?
The province or state of origin according to guidelines the provider establishes.
var timestamp: Date?
The timestamp on the item.
var fullyFormattedAddress: String?
The fully formatted address of the item, received from MapKit.
var postalCode: String?
The postal code for the item according to guidelines the provider establishes.
var subThoroughfare: String?
The sublocation, such as a street number, for the item according to guidelines the provider
establishes.
var thoroughfare: String?
The thoroughfare, such as a street name, associated with the location for the item according
to guidelines the provider establishes.
var comment: String?
A comment related to the media file.
Describing media


## Page 12

var contentCreationDate: Date?
The creation date of an edited or optimized version of the song or composition.
var contentModificationDate: Date?
The date on which the contents of the file was last modified.
var contentSources: [String]?
An array of sources from which the media was obtained.
var copyright: String?
The copyright date of the content.
var downloadedDate: Date?
The most recent date on which the file was downloaded or received.
var editors: [String]?
A list of editors who have worked on the file.
var lastUsedDate: Date?
The date on which the file was last used.
var participants: [String]?
A list of people who are visible in an image or movie or written about in a document.
var projects: [String]?
A list of projects of which this file is a part.
var addedDate: Date?
The date on which the item was moved into its current location.
var codecs: [String]?
The codecs used to encode/decode the media.
var contactKeywords: [String]?
A list of contacts who are associated with the content in some way, not including the author.
var deliveryType: NSNumber?
The delivery type of the file.
var duration: NSNumber?
The duration (if appropriate) of the content of the file, in seconds.
var mediaTypes: [String]?


## Page 13

The media types present in the content.
var organizations: [String]?
A list of companies or organizations that created the content.
var streamable: NSNumber?
A value that indicates if the content is prepared for streaming.
var totalBitRate: NSNumber?
The total bit rate of the media, combining audio and video.
var audioBitRate: NSNumber?
The audio bit rate of the media.
var version: String?
A version string associated with the file.
var videoBitRate: NSNumber?
The video bit rate of the media.
var contributors: [String]?
A list of people, organizations, or services that made contributions to the media content.
var languages: [String]?
A list of the included languages for the intellectual content of the media.
var publishers: [String]?
A list of people, organizations, services, or other entities responsible for making the media
available.
var rights: String?
A link to information about the rights held in and over the media.
var role: String?
Indicates the role of the content creator.
var contentRating: NSNumber?
A value that indicates if the media contains explicit content.
var coverage: [String]?
A list of descriptors that specify the extent or scope of the media.
var director: String?
The name of the director of the media (for example, a movie director).


## Page 14

var genre: String?
The genre of the media.
var information: String?
Information about the media.
var local: NSNumber?
A value that indicates if the media is local.
var originalFormat: String?
The original format of the media.
var originalSource: String?
The original source of the media.
var performers: [String]?
A list of performers in the media.
var playCount: NSNumber?
A user-supplied play count for the media.
var producer: String?
The producer of the content.
var rating: NSNumber?
The user-supplied rating of the media.
var ratingDescription: String?
A description of the rating.
var url: URL?
The URL associated with the media.
var album: String?
The title for a collection of audio media.
var artist: String?
The artist associated with the media.
var audioChannelCount: NSNumber?
The number of channels in the audio data that the file contains.
Describing music


## Page 15

var audioEncodingApplication: String?
The name of the application that encoded the data the audio file contains.
var audioSampleRate: NSNumber?
The sample rate of the audio data the file contains, as a float value representing Hz (audio
frames per second), such as 44100.0 or 22254.54.
var audioTrackNumber: NSNumber?
The track number of a song or audio composition when part of an album.
var composer: String?
The composer of the song or audio composition that the audio file contains.
var keySignature: String?
The musical key of the song or audio composition that the file contains, such as C, Dm, or
F#m.
var lyricist: String?
The lyricist or text writer for the song or audio composition that the file contains.
var musicalGenre: String?
The musical genre of the song or audio composition that the file contains, such as jazz, pop,
rock, or classical.
var recordingDate: Date?
The recording date of the song or composition.
var tempo: NSNumber?
The tempo of the music that the audio file contains, in beats per minute.
var timeSignature: String?
The time signature of the musical composition that the audio or MIDI file contains, in a string
such as “4/4” or “7/8”.
var generalMIDISequence: NSNumber?
A value that indicates whether the MIDI sequence the file contains is set up for use with a
general MIDI device.
var musicalInstrumentCategory: String?
The category of the instrument associated with the audio file.
var musicalInstrumentName: String?
The name of an instrument within the context of an instrument category.


## Page 16

var isoSpeed: NSNumber?
The ISO speed setting at the time the camera captured the image.
var acquisitionMake: String?
The manufacturer of the device that captured the image.
var acquisitionModel: String?
The model of the device that captured the image.
var aperture: NSNumber?
The size of the lens aperture at the time the camera captured the image, as a log-scale APEX
value.
var bitsPerSample: NSNumber?
The number of bits per sample.
var cameraOwner: String?
The owner of the camera that captured the image.
var colorSpace: String?
The color space model the image uses, such as RGB, CMYK, YUV, or YCbCr.
var flashOn: NSNumber?
A value that indicates if the camera used a flash to capture the image.
var focalLength: NSNumber?
The actual focal length of the lens, in millimeters.
var focalLength35mm: NSNumber?
A value that indicates if the focal length is 35mm.
var layerNames: [String]?
An array that contains the names of the various layers in the file.
var lensModel: String?
The model of the lens that captured the image.
var orientation: NSNumber?
The orientation of the data.
Describing images


## Page 17

var pixelCount: NSNumber?
The total number of pixels in the image.
var pixelHeight: NSNumber?
The height of the item, such as image or video frame height, in pixels.
var pixelWidth: NSNumber?
The width of the item, such as image or video frame width, in pixels.
var whiteBalance: NSNumber?
The white balance setting when the camera captured the image.
var exifgpsVersion: String?
The version of GPS Info IFD header that was used to generate the metadata for the image.
var exifVersion: String?
The version of the EXIF header that was used to generate the metadata for the image.
var exposureMode: NSNumber?
The mode the camera used for the exposure of the image.
var exposureProgram: String?
The class of the program the camera used to set exposure when capturing the image.
var exposureTime: NSNumber?
The time that the lens was open during exposure, in seconds.
var exposureTimeString: String?
The time that the lens was open during exposure, in a string, such as “1/250 seconds”.
var fNumber: NSNumber?
The focal length of the lens, divided by the diameter of the aperture when the camera
captured the image.
var hasAlphaChannel: NSNumber?
Indicates if the image file has an alpha channel.
var maxAperture: NSNumber?
The smallest F number of the lens.
var meteringMode: String?
The metering mode.


## Page 18

var profileName: String?
The name of the color profile the camera used for the image.
var redEyeOn: NSNumber?
A value that indicates if the camera used red-eye reduction when capturing the image.
var resolutionHeightDPI: NSNumber?
The resolution height of the image, in DPI.
var resolutionWidthDPI: NSNumber?
The resolution width of the image, in DPI.
Common Mailbox Identifiers
Constants that describe common mailbox names.
var htmlContentData: Data?
The HTML content of the document encoded as an NSData object representing a UTF-8
encoded string.
var accountHandles: [String]?
An array of the canonical handles for the account with which the message is associated.
var accountIdentifier: String?
The unique identifier for the account with which the message is associated, if any.
var additionalRecipients: [CSPerson]?
An array of CSPerson objects representing the content of the Cc: field in an email message
var authorAddresses: [String]?
An array of addresses associated with the author of the message.
var authorEmailAddresses: [String]?
An array of email addresses associated with the author of the message.
var authorNames: [String]?
An array of names representing the authors who have worked on the message.
var authors: [CSPerson]?
An array of CSPerson objects representing the content of the From: field in an item.
var emailAddresses: [String]?
Describing messages


## Page 19

An array of email addresses associated with the message.
var emailHeaders: [String : [Any]]?
A dictionary that contains all the headers of the message.
var hiddenAdditionalRecipients: [CSPerson]?
An array of CSPerson objects representing the content of the Bcc: field in an email messag
var instantMessageAddresses: [String]?
An array of instant message addresses for the message.
var likelyJunk: NSNumber
A value that indicates if the message is likely to be considered junk.
var mailboxIdentifiers: [String]?
An array of mailbox identifiers associated with the message.
var phoneNumbers: [String]?
An array of phone numbers associated with the message.
var primaryRecipients: [CSPerson]?
An array of CSPerson objects representing the content of the To: field in an email message
var recipientAddresses: [String]?
An array of addresses associated with the recipients of the message.
var recipientEmailAddresses: [String]?
An array of email addresses associated with the recipient.
var recipientNames: [String]?
An array of names representing the recipients of this message.
var textContent: String?
The textual content of the message.
var containerDisplayName: String?
A localized string that specifies the name of a container to which the item belongs, suitable t
display in the user interface.
var containerIdentifier: String?
The identifier of the container to which the item belongs.
Describing containment


## Page 20

var containerOrder: NSNumber?
The order of the item within the container.
var containerTitle: String?
The title of the container to which the item belongs.
var actionIdentifiers: [String]
The identifiers that specify custom actions the app supports for the item.
var supportsNavigation: NSNumber?
A value that indicates whether the item contains information sufficient to provide navigation 
the location it represents.
var supportsPhoneCall: NSNumber?
A value that indicates whether the item contains information sufficient to allow a phone call t
a number associated with the item.
var sharedItemContentType: UTType?
The file type of the item to enable the user to share items from Spotlight.
let CSActionIdentifier: String
A key that specifies the action’s identifier in a user activity.
var providerDataTypeIdentifiers: [String]?
An array of identifiers that corresponds to data representations the delegate provides.
var providerFileTypeIdentifiers: [String]?
An array of identifiers that corresponds to file representations the delegate provides.
var providerInPlaceFileTypeIdentifiers: [String]?
An array of identifiers that corresponds to in-place file representations the delegate provides
init(itemContentType: String)
Creates an attribute set for the specified content type.
Deprecated
Supporting actions
Providing item representations
Deprecated


## Page 21

func associateAppEntity<Entity>(Entity, priority: Int)
Associates an app entity with this searchable item.
func move(from: CSSearchableItemAttributeSet)
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
class CSSearchableItem
The details of your app-specific content that someone might search for on their devices.
class CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
class CSLocalizedString
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Searchable items


## Page 22

An object that displays localized text in search results related to your app.
class CSPerson
An object that represents a person in the context of search results.


## Page 23

The CSCustomAttributeKey class defines a key that you can associate with a custom attribut
for a searchable item. Item attributes provide metadata about the item that can be indexed and
displayed to users in search results.
Although the Core Spotlight framework provides several predefined attributes, such as title and
description, you can create a CSCustomAttributeKey object to specify a custom attribute tha
makes sense in your domain.
convenience init?(keyName: String)
Returns a new custom attribute key with the specified name.
init?(keyName: String, searchable: Bool, searchableByDefault: Bool,
unique: Bool, multiValued: Bool)
Returns a new custom attribute key with the specified name and properties.
Overview
Topics
Creating a custom attribute
Getting the attribute details
Core Spotlight / CSCustomAttributeKey
Class
CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 24

var keyName: String
The name of the custom attribute key.
var isMultiValued: Bool
A Boolean value that indicates if the custom attribute is likely to have multiple values, such a
arrays, associated with it.
var isSearchable: Bool
A Boolean value that indicates if the custom attribute can be specified as a search term.
var isSearchableByDefault: Bool
A Boolean value that indicates if the custom attribute should be searchable by default.
var isUnique: Bool
A Boolean value that indicates if duplicate custom attribute values should be treated as the
same value to save storage space.
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
Relationships
Inherits From
Conforms To
See Also


## Page 25

class CSSearchableItem
The details of your app-specific content that someone might search for on their devices.
class CSSearchableItemAttributeSet
The detailed metadata for a searchable item.
class CSLocalizedString
An object that displays localized text in search results related to your app.
class CSPerson
An object that represents a person in the context of search results.
Searchable items


## Page 26

The CSLocalizedString class helps you localize text in searchable items. You can use a
CSLocalizedString object in place of an NSString object to display localized text in search
results related to your app.
For example, you might use the following code to define a CSLocalizedString object for a
searchable item you want to identify as “Song” in English:
Overview
Topics
Specifying localized strings
Core Spotlight / CSLocalizedString
Class
CSLocalizedString
An object that displays localized text in search results related to your app.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 27

init(localizedStrings: [AnyHashable : Any])
Initializes a CSLocalizedString object with the specified dictionary of localized strings.
func localizedString() -> String
Returns the localized string for the current language.
NSString
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
ExpressibleByExtendedGraphemeClusterLiteral
ExpressibleByStringLiteral
ExpressibleByUnicodeScalarLiteral
Hashable
NSCoding
NSCopying
NSItemProviderReading
NSItemProviderWriting
NSMutableCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Getting a localized string
Relationships
Inherits From
Conforms To
See Also


## Page 28

class CSSearchableItem
The details of your app-specific content that someone might search for on their devices.
class CSSearchableItemAttributeSet
The detailed metadata for a searchable item.
class CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
class CSPerson
An object that represents a person in the context of search results.
Searchable items


## Page 29

A CSPerson object represents a person in the context of search results. You can create a
CSPerson object when you have a display name and a contact handle of some kind, such as an
email address or phone number.
If you create a CSPerson object to represent a specific contact, you can use the value of the
contact’s identifier property for the person object’s contactIdentifier property. Using the
same value lets you avoid using names or phone numbers to look up the contact that’s associated
with a person.
init(displayName: String?, handles: [String], handleIdentifier: String)
Returns a new CSPerson object initialized with the specified display name and contact
attributes.
var contactIdentifier: String?
Overview
Topics
Initializing a person object
Accessing person properties
Core Spotlight / CSPerson
Class
CSPerson
An object that represents a person in the context of search results.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 30

The identifier for the contact associated with the person.
var displayName: String?
A display name for the person.
var handleIdentifier: String
A key that identifies the type of contact property represented by the person object’s handle.
var handles: [String]
An array of contact handles related to the person.
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
class CSSearchableItem
The details of your app-specific content that someone might search for on their devices.
class CSSearchableItemAttributeSet
Relationships
Inherits From
Conforms To
See Also
Searchable items


## Page 31

The detailed metadata for a searchable item.
class CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
class CSLocalizedString
An object that displays localized text in search results related to your app.


