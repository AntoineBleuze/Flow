# Exposures.pdf

## Page 1

The configuration fields listed below define the behavior for Exposure Notifications features such
as exposure matching, Exposure Risk Value (ERV) calculation, and messaging for regions manage
by a Public Health Authority (PHA). These values can be changed by using the server-to-server A
or by contacting Apple to request a change. PHAs that only support Exposure Notifications Expre
can also change these values by logging into Apple Business Register (ABR).
Note
To learn more about using these keys with the Exposure Notifications server-to-server API, see
Changing Configuration Values Using the Server‑to‑Server API.
Some keys are relevant to all Exposure Notifications behavior, while some keys are only used by
Exposure Notifications Express. Keys used to display information to users, to customize the user
interface, to adjust exposure calculations, and to configure test verification servers are only used
by Exposure Notifications Express. The other values are used by both Exposure Notifications
Express and Exposure Notifications apps.
Certain keys are marked as Required, and some are also marked Localizable, as noted in bold in t
lists below.
For keys marked Required, a PHA must configure these values for a region before it can go live wi
Exposure Notifications, but you don’t need to include required keys in every server-to-server API
request. If a required field already has a valid value, requests only need to include that key when
requesting a change to that field.
Using keys marked Localizable, you can provide different values for different languages by
appending an underscore followed by the ISO two-letter language code, then another underscore
Overview
Exposure Notification / Configuring Exposure Notifications
Article
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based
key-value pairs.


## Page 2

and then the ISO two-letter country code for the region. For example, to provide a localized value
of agencyDisplayName for French-Canadians, use the key agencyDisplayName_FR_CA.
When using the server-to-server API, you can provide multiple localized versions of the same key
the same request. In ABR, localizable fields provide a button that allows you to enter additional
localized values.
Exposure Notifications’ APIs are available in two versions. Version 1 requires a client app to
function, while Version 2 — available on iOS 13.7 and later — works both with a client app or witho
an app by using Exposure Notifications Express.
enVersion
An unsigned 8-bit integer that determines whether an app uses version 1 or 2 of the Exposur
Notifications framework.
Note
Keys you use to display information to users, customize the UI, adjust exposure calculations,
and configure test verification servers are only used by Exposure Notifications Express,
including any field that takes a color, image, or URL, or that includes header, message, or
text as part of its name.
A PHA can manage more than one region and can configure each region with different values.
These values allow you to change region-specific information:
agencyDisplayName
ABR Field: PHA Name
Name of the PHA. Used in the single-color header during onboarding, in EN settings and in
Exposure Notifications details. Required. Localizable.
regionIdentifier
ABR Field: Region
A string containing the Mobile Country Code (MCC) in version 1, or the ISO Country Code in versio
2.
goLiveDate
ABR Field: Go Live Date
Date that Exposure Notifications is available for use in this region, specified as seconds since
00:00:00 UTC on January 1, 1970.
Specify API Version
Set Region Information


## Page 3

agencyRegionName
ABR Field: Region (for example, state/province or country)
Name of the region. Required. Localizable.
agencyWebsiteURL
ABR Field: Agency Website URL
A URL that contains the agency’s website. The system presents this URL to the user in the region
detail view in the Settings app. Required.
agencyRegionName
ABR Field: Region
Name of the region the PHA manages. Used as the subtitle in the onboarding header and in variou
places in the Settings app. Required.
agencyHeaderStyle
ABR Field: Header Style
An integer used to customize the appearance of the header used in Exposure Notifications Expres
when presenting region-specific information to the user. Acceptable values are: 0 for standard
appearance with name and icon, 1 for icon-only centered, 2 for icon-only on the left, and 3 for
icon-only on the right.
agencyHeaderTextColor
ABR Field: Text Color
An array of RGB values ranging from 0.0 to 1.0 representing the text color for the text in the
header (for example, [1.0, 0.75, 0.75]).
agencyColor
ABR Field: Header Color
An array of RGB values ranging from 0.0 to 1.0 representing the accent color to use as the
background for the PHA-branded header above PHA-provided content (for example, [1.0, 1.0
0.0]).
agencyImage
ABR Field: Image URL
The URL of an image file for the agency logo, displayed in the PHA-branded header above PHA-
provided content.
agencyMessage
ABR Field: Message Body
Summary text that appears during onboarding and in settings below the branded header. Require
Localizable.
legalConsentText


## Page 4

ABR Field: Legal Consent Text
A string that contains the plain text end-user consent document provided by the PHA. Required.
Localizable.
legalConsentVersion
ABR Field: Legal Consent Version
A string that contains the semantic version or monotonically increasing number of the consent tex
Required.
exposureMatching
ABR Field: Is exposure matching enabled?
A Boolean that indicates whether the server enables APIs that accept matching temporary
exposure key files in that region.
appBundleId
ABR Field: App Bundle ID (Optional)
A string that contains the App Store bundle identifier of the app for the given region.
isTestRegion
ABR Field: Not editable
A Boolean that indicates whether this is a test region.
These keys define the security keys used to authenticate requests and sign key archives:
publicKey
ABR Field: Public Key
A string that contains the public key used to verify the Temporary Exposure Key (TEK) file
signature.
publicKeyVersion
ABR Field: Public Key Version
A string that contains the version of the public key from the PHA.
These keys define the attenuation weights that Exposure Notifications Express uses to compute
the ERV:
attenuationImmediateWeight
ABR Field: Attenuation Immediate Weight (0-250%)** **
Set Signing Key
Configure Duration Weights


## Page 5

An unsigned 16-bit integer that contains the immediate attenuation weight.
attenuationNearWeight
ABR Field: Attenuation Near Weight (0-250%)
An unsigned 16-bit integer that contains the near attenuation weight.
attenuationMedWeight
ABR Field: Attenuation Medium Weight (0-250%)
An unsigned 16-bit integer that contains the medium attenuation weight.
attenuationOtherWeight
ABR Field: Attenuation Other Weight (0-250%)
An unsigned 16-bit integer that contains the other attenuation weight.
attenuationImmediateNearThreshold
ABR Field: Attenuation Immediate Near Threshold (0-255)
An unsigned 8-bit integer that contains the attenuation threshold for immediate to near.
attenuationNearMedThreshold
ABR Field: Attenuation Immediate Med Threshold (0-255)
An unsigned 8-bit integer that contains the attenuation threshold for near to medium.
attenuationMedFarThreshold
ABR Field: Attenuation Med Far Threshold (0-255)
An unsigned 8-bit integer that contains the attenuation threshold for medium to far.
These keys define weights and thresholds that Exposure Notifications Express uses to compute t
ERV:
symptomOnsetToInfectiousnessMap
ABR Field: Infectiousness to Symptom Onset Map
An unsigned 64-bit integer mapping days since symptoms onset in the Temporary Exposure Key 
an infectiousness category. Set the value to one of the following: 00 (drop), 01 (standard
infectiousness), 10 (high infectiousness).
infectiousnessStandardWeight
ABR Field: Infectiousness Standard Weight (0-250%)
An unsigned 16-bit integer that contains the standard infectiousiness weight.
infectiousnessHighWeight
ABR Field: Infectiousness High Weight (0-250%)
Calculate Exposure Risk Values


## Page 6

An unsigned 16-bit integer that contains the high infectiousiness weight.
reportTypeConfirmedTestWeight
ABR Field: Report Type Confirmed Test Weight (0-250%)
An unsigned 16-bit integer that contains the confirmed test report type weight.
reportTypeConfirmedClinicalDiagnosisWeight
ABR Field: Report Type Confirmed Clinical Diagnosis Weight (0-250%)
An unsigned 16-bit integer that contains the confirmed clinical report type weight.
reportTypeSelfReportWeight
ABR Field: Report Type Self Report Weight (0-250%)
An unsigned 16-bit integer that contains the self report type weight.
reportTypeNoneMap
ABR Field: Report Type None Map
An unsigned 8-bit integer that maps the None value to an existing report type.
daysSinceExposureThreshold
ABR Field: Days Since Exposure Threshold (0-14)
An unsigned 8-bit integer that contains the threshold in days that EN considers history valid. For
example, 10 means only the past 10 days of history is valid.
These keys define values that set the calculation threshold for customizable exposure
classifications in Exposure Notifications Express. A PHA can define up to four classifications. If a
PHA creates more than one classification, they will be checked in order, only moving on to the nex
classification if the threshold is not met.
Replace the trailing X in the key names below with a number from 1 to 4 to specify which
classification’s value to change. For example, to change the Exposure Details Body for the second
exposure classification, you would use the key exposureDetailsBodyText_2. Setting any
threshold field to a value of 0 disables its notification.
exposureDetailsBodyText_X
ABR Field: Exposure Details Body
A string that contains the body text presented to the user when navigating to their latest exposure
details in the Settings app. Required. Localizable.
notificationSubject_X
ABR Field: Notification Subject
Set Exposure Classifications


## Page 7

A string that contains the bolded subject of the notification presented to the user when
transitioning to this exposure state. The system also presents this as the heading in the Settings
app when a user browses to their latest exposure information. Required. Localizable.
notificationBody_X
ABR Field: Notification Body
A string that contains the body text of the notification presented to the user when transitioning to
this exposure state. Required. Localizable.
classificationName_X
ABR Field: Classification Name
A string that contains the unique name of this classification configuration. This name must chang
when the thresholds for this classification change. Required.
classificationURL_X
ABR Field: Classification URL
A URL that contains the link to the PHA’s website for further guidance when the user navigates to
their latest exposure details in Settings. Required.
confirmedTestPerDaySumERVThreshold_X
ABR Field: Confirmed Test Per Day Sum ERV Threshold
A 32-bit integer that contains the confirmed test report type threshold in ERV from when the OS
raises a notification.
clinicalDiagnosisPerDaySumERVThreshold_X
ABR Field: Clinical Diagnosis Per Day Sum ERV Threshold
A 32-bit integer that contains the clinical diagnosis report type threshold in ERV from when the O
raises a notification.
selfReportPerDaySumERVThreshold_X
ABR Field: Self Report Per Day Sum ERV Threshold
A 32-bit integer that contains the self report type threshold in ERV from when the OS raises a
notification.
recursivePerDaySumERVThreshold_X
ABR Field: Recursive Per Day Sum ERV Threshold
A 32-bit integer that contains the recursive report type threshold in ERV from when the OS raises
notification.
perDaySumERVThreshold_X
ABR Field: Per Day Sum ERV Threshold
A 32-bit integer that contains the per day sum threshold in ERV from when the OS raises a
notification.


## Page 8

perDayMaxERVThreshold_X
ABR Field: Per Day Max ERV Threshold
A 32-bit integer that contains the per day maximum threshold in ERV from when the OS raises a
notification.
weightedDurationAtAttenuationThreshold_X
ABR Field: Weighted Duration at Attenuation Threshold
A 32-bit integer that contains the threshold in weighted duration-at-attenuation when the OS
raises a notification.
These keys define values that set text presented to the user by Exposure Notifications Express
upon revocation of an exposure diagnosis:
revokedNotificationBody
ABR Field: Notification Body
A string that contains body text of a notification presented to the user when transitioning to a no
exposure state due to revocation of a prior exposure. Required.
revokedNotificationSubject
ABR Field: Notification Subject
A string that contains a bolded notification presented to the user when transitioning to this
exposure state. Required.
revokedDetailsBodyText
ABR Field: Revoked Details Body
A string that contains body text presented to the user when navigating to their latest exposure
details in the Settings app. Required. Localizable.
revokedURL
ABR Field: Revoked URL
A URL to the PHA’s website for further guidance when the user navigates to their latest exposure
details in the Settings app. Required.
These keys define values the system uses to interact with your key server.
tekLocalDownloadIndexFile
ABR Field: TEK Local Download Index File
A URL that contains the TEK download endpoint index file. Required.
Set Exposure Revoked Notifications
Configure Key Server Information


## Page 9

tekLocalDownloadBasePath
ABR Field: TEK Local Download Base Path
A URL that contains the TEK base path. Required.
tekPublishInterval
ABR Field: TEK Publish Interval in Hours
An unsigned 8-bit integer that contains how often the PHA expects to update TEK for downloadin
specified in hours. Valid values are 2, 4, 8, or 24. Required.
tekUploadURL
ABR Field: TEK Upload URL
A URL that contains the agency’s upload key server. Required.
These keys define values used to verify a positive diagnosis before uploading key files to the key
server when using Exposure Notifications Express:
testVerificationIntroMessage
ABR Field: Test Verifiction Intro Message
A string that contains an introductory message from the PHA explaining the purpose of test
verification and key upload. Required. Localizable.
verificationCodeLearnMoreURL
ABR Field: Verification Learn More URL
A URL that contains the PHA’s website where user can learn more about use of cerification codes
and get help if something isn’t working. Required.
testVerificationURL
ABR Field: Test Verification URL
A URL that contains the agency’s test verification server. Used to exchange valid verification code
for long-term authentication tokens. Required.
testVerificationCertificateURL
ABR Field: Test Verification Certificate URL
A URL used to retrieve a certificate and per-key metadata for a batch of TEKs before uploading
them to the key server. Required.
testVerificationAPIKey
ABR Field: Test Verification API Key
An API key, required to talk to the Test Verification server. Required.
Configure Test Verification Server Information


## Page 10

class ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk scoring
behavior.
class ENExposureWindow
A set of scan events from observed beacons within a time span.
class ENScanInstance
The aggregation of attenuations of beacons received during a scan.
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.
See Also
Exposures


## Page 11

Supporting Exposure Notifications in iOS 12.5
Important
This class is available in iOS 12.5, and in iOS 13.5 and later.
The ExposureNotification framework defines an Exposure Risk Value (ERV) to allow Health
Authorities to define when to alert a user that they may have been exposed to someone diagnose
with COVID-19. The app uses the ERV to calculate the user’s Meaningful Exposure Minutes (MEM
value. Health Authorities have flexibility in calculating this value by setting weights and values
related to Bluetooth attenuations, infectiousness of the affected individual, and diagnosis report
type. They can also determine what threshold will result in a notification.
Mentioned in
Overview
Exposure Notification / ENExposureConfiguration
Class
ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk
scoring behavior.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 12

Important
While the ERV is measured in MEMs, the system actually calculates and returns a number of
seconds, rounded to the nearest minute. For example, if a person has an ERV of 2 MEMs, the
app returns a value of 120 (seconds). Convert ERVs to minutes before displaying it to the user
by dividing the returned value by 60.
The calculation method described in this document is available starting with iOS 14. To adopt this
method of risk assessment, set the ENAPIVersion key to the integer value 2 in the app’s Info
.plist file. For more information on the V1 calculation used in earlier versions of iOS, see
Exposure Risk Value Calculation in ExposureNotification Version 1.
The following diagram shows how to calculate an ERV:
The class defines three sets of weights that give priority to the components of the ERV: minutes-a
attenuation, infectiousness, and report type.
The weighted minutes-at-attenuation assigns priority to the amount of time that the user is near
beacons at different Bluetooth attenuations. Assign values between 0–250 percent to weights tha
represent Immediate, Near, Medium, and Other distances.


## Page 13

The infectiousness weight modifies the ERV based on the affected userʼs infectiousness level for
the day of exposure relative to the day of symptom onset. To set the infectiousness level for when
there is no symptom onset date provided, use ENDaysSinceOnsetOfSymptomsUnknown. A
user’s infectiousness level can be ENInfectiousness.high, ENInfectiousness.standar
or ENInfectiousness.none. Assign both infectiousnessHighWeight and
infectiousnessStandardWeight a value between 0 percent and 250 percent.
The weighted report type assigns priority to the method of diagnosis. Assign values ranging from
0–250 percent to weights that represent a confirmed test diagnosis, clinical diagnosis, self-
reported diagnoisis, and recursive diagnosis.
In addition to setting the weights, you can perform additional filtering by setting daysSinceLast
ExposureThreshold to limit the number of days to consider when calculating the risk level.
Calculating an Example Exposure Risk Value


## Page 14

The following diagrams illustrate calculating an ERV using a real-world scenario.
The weighted minutes-at-attenuation shows 5 minutes of immediate exposure with a 150 percent
weight, 10 minutes of near exposure with a 100 percent weight, 10 minutes of medium exposure
with a 50 percent weight, and 5 minutes of other exposure with a 0 percent weight.
The weighted infectiousness indicates days –14 to –6 from the current day with no infectiousness
days –5 to –3 with 100 percent of standard infectiousness, days –2 to +5 with 200 percent high
infectiousness, days +6 to +10 with 100 percent standard infectiousness, and days +11 to +14 wit
no infectiousness.
Here are the weighted report types for all three tests:
The result of the calculation shows an ERV of 45 minutes:


## Page 15

Important
To prevent an ERV of 0, set any unused weight to 100 percent.
var attenuationDurationThresholds: [NSNumber]
The configurable signal-loss thresholds for calculating exposure risk.
var immediateDurationWeight: Double
The weight assigned to a risk level indicating the duration of the user’s exposure at immedia
distance.
var mediumDurationWeight: Double
The weight assigned to a risk level indicating the duration of the user’s exposure at medium
distance.
var nearDurationWeight: Double
The weight assigned to a risk level indicating the duration of the user’s exposure at close
distance.
var otherDurationWeight: Double
The weight assigned to a risk level indicating the duration of the user’s exposure at a large
distance.
Topics
Configuring Duration


## Page 16

var daysSinceLastExposureThreshold: Int
The number of days to consider when calculating the risk level.
var infectiousnessForDaysSinceOnsetOfSymptoms: [NSNumber : NSNumber]?
The mapping between the days since onset of symptoms to the degree of infectiousness.
var infectiousnessHighWeight: Double
The weight to apply for severe infectiousness.
var infectiousnessStandardWeight: Double
The weight to apply for mild infectiousness.
let ENDaysSinceOnsetOfSymptomsUnknown: Int
A value used when the number of days since onset of symptoms is unknown.
Deprecated
var reportTypeConfirmedClinicalDiagnosisWeight: Double
The weight assigned to a risk level based on a confirmed clinical diagnosis.
var reportTypeConfirmedTestWeight: Double
The weight assigned to a risk level based on a confirmed test.
var reportTypeRecursiveWeight: Double
The weight assigned to a risk level based on an exposure to someone exposed to someone
else.
var reportTypeSelfReportedWeight: Double
The weight assigned to a risk level based on a self-reported diagnoisis.
var reportTypeNoneMap: ENDiagnosisReportType
The report type to map an unknown diagnosis to.
Exposure Risk Value Calculation in ExposureNotification Version 1
Configuring Infectiousness
Configuring Report Types
Determining Exposure Risk Level in Version 1


## Page 17

Learn how to determine a user’s risk of exposure.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based key-value
pairs.
class ENExposureWindow
A set of scan events from observed beacons within a time span.
class ENScanInstance
The aggregation of attenuations of beacons received during a scan.
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.
Relationships
Inherits From
Conforms To
See Also
Exposures


## Page 18

Important
This property is available in iOS 12.5, and in iOS 13.7 and later.
An exposure window contains information about a potential exposure in a 30–minute interval. The
system returns an array of exposure windows through the completion handler when the app
invokes getExposureWindows(summary:completionHandler:). Exposure windows are
only available when an app specified an ENAPIVersion of 2 in the app’s Info.plist file.
var calibrationConfidence: ENCalibrationConfidence
The transmitting device’s calibration confidence.
var date: Date
The date that the exposure occurred.
Overview
Topics
Getting Window Properties
Exposure Notification / ENExposureWindow
Class
ENExposureWindow
A set of scan events from observed beacons within a time span.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 19

var diagnosisReportType: ENDiagnosisReportType
The report type of the observed diagnosis.
var infectiousness: ENInfectiousness
How infectious the user is, based on the number of days since the onset of symptoms.
var scanInstances: [ENScanInstance]
An array of scans corresponding to a beacon associated with an exposure.
var variantOfConcernType: ENVariantOfConcernType
The variant of concern associated with this user.
enum ENVariantOfConcernType
A set of user-definable types that indicate variants of concern.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based key-value
pairs.
Relationships
Inherits From
Conforms To
See Also
Exposures


## Page 20

class ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk scoring
behavior.
class ENScanInstance
The aggregation of attenuations of beacons received during a scan.
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.


## Page 21

Important
This property is available in iOS 12.5, and in iOS 13.7 and later.
var minimumAttenuation: ENAttenuation
The minimum attenuation of beacons received during the scan.
var secondsSinceLastScan: Int
The number of seconds elapsed since the previous scan.
var typicalAttenuation: ENAttenuation
The aggregation of the attenuations of beacons received during the scan.
Overview
Topics
Getting Scan Instance Properties
Exposure Notification / ENScanInstance
Class
ENScanInstance
The aggregation of attenuations of beacons received during a scan.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 22

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based key-value
pairs.
class ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk scoring
behavior.
class ENExposureWindow
A set of scan events from observed beacons within a time span.
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.
Relationships
Inherits From
Conforms To
See Also
Exposures


## Page 23

Attenuation
The minimum and maximum signal attenuations.
Risk Level
The minimum and maximum risk levels.
Risk Level Value
The minimum and maximum risk level values.
Risk Score
The minimum and maximum risk score.
Risk Weight
The minimum, default, and maximum risk weights.
struct ENActivityFlags
Activities that occur while the app isn’t running.
enum ENCalibrationConfidence
The transmitting device’s calibration confidence.
enum ENDiagnosisReportType
The type of a report that describes the origin of a diagnosis.
enum ENInfectiousness
Topics
Enumerations
Exposure Notification / Exposure Parameter Limits
API Collection
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.


## Page 24

The degree to which a person’s symptoms may indicate transmission risk.
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based key-value
pairs.
class ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk scoring
behavior.
class ENExposureWindow
A set of scan events from observed beacons within a time span.
class ENScanInstance
The aggregation of attenuations of beacons received during a scan.
See Also
Exposures


