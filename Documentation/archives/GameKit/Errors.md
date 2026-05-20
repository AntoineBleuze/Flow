# Errors.pdf

## Page 1

Finding multiple players for a game
enum Code
Error codes for the GameKit error domain.
static var authenticationInProgress: GKError.Code
The system can’t complete the requested operation because the local player is already
authenticating.
static var cancelled: GKError.Code
The system canceled the requested operation or the user disabled it.
static var challengeInvalid: GKError.Code
The challenge request failed due to invalid challenge data.
Deprecated
Mentioned in
Topics
Error Codes
GameKit / GKError
Structure
GKError
The error structure used by this framework.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

static var communicationsFailure: GKError.Code
The system can’t complete the requested operation due to an error communicating with the
server.
static var gameSessionRequestInvalid: GKError.Code
The properties of the game session request are impossible to fulfill.
static var gameUnrecognized: GKError.Code
The system can’t complete the requested operation because Game Center doesn’t recogniz
the app.
static var invalidCredentials: GKError.Code
The system can’t complete the requested operation because the user name or password are
incorrect.
static var invalidParameter: GKError.Code
The system can’t complete the requested operation because one or more parameters are
invalid.
static var invalidPlayer: GKError.Code
The system can’t complete the requested operation because the player is invalid.
static var invitationsDisabled: GKError.Code
The system can’t complete the requested operation because the receiving player has disabl
invitations.
static var matchNotConnected: GKError.Code
The system can’t complete the requested operation because the match isn’t connected to
other players.
static var matchRequestInvalid: GKError.Code
The system can’t complete the requested operation because the match request is invalid.
static var notAuthenticated: GKError.Code
The system can’t complete the requested operation because the system hasn’t initialized th
local player.
static var notSupported: GKError.Code
The app doesn’t have Game Center enabled.
static var parentalControlsBlocked: GKError.Code
The system can’t complete the requested operation because the user disabled this feature i
Restrictions.


## Page 3

static var playerPhotoFailure: GKError.Code
The system can’t complete the requested operation to retrieve a player’s photo.
static var playerStatusExceedsMaximumLength: GKError.Code
The player’s status exceeds the maximum length.
static var playerStatusInvalid: GKError.Code
The player’s status is invalid.
static var scoreNotSet: GKError.Code
The system can’t complete the requested operation because the system hasn’t set the score
static var turnBasedInvalidParticipant: GKError.Code
The system can’t complete the requested operation because the specified participant is
invalid.
static var turnBasedInvalidState: GKError.Code
The system can’t complete the requested operation because the session is in an invalid state
static var turnBasedInvalidTurn: GKError.Code
The system can’t complete the requested operation because the participant doesn’t have th
required turn state.
static var turnBasedMatchDataTooLarge: GKError.Code
The system can’t complete the requested operation because the match data is too large.
static var turnBasedTooManySessions: GKError.Code
The system can’t complete the requested operation because it exceeds the maximum numb
of sessions.
static var ubiquityContainerUnavailable: GKError.Code
The system can’t complete the requested operation because the user hasn’t signed in to
iCloud or hasn’t enabled iCloud Drive.
static var underage: GKError.Code
The system can’t complete the requested operation because this feature isn’t available to
underage players.
static var unexpectedConnection: GKError.Code
An unexpected player has connected to a match.
static var unknown: GKError.Code
The system can’t complete the requested operation due to an unknown error.


## Page 4

static var userDenied: GKError.Code
The system can’t complete the requested operation because the user denied it.
static var restrictedToAutomatch: GKError.Code
The system can’t complete the requested operation because the player is using automatch.
static var apiNotAvailable: GKError.Code
The system can’t complete the requested operation because the API isn’t available.
static var notAuthorized: GKError.Code
The system can’t complete the requested operation because the system hasn’t authorized t
player.
static var connectionTimeout: GKError.Code
The system can’t complete the requested operation because the connection timed out.
static var apiObsolete: GKError.Code
The system can’t complete the requested operation because Apple deprecated the API.
static var iCloudUnavailable: GKError.Code
The system can’t complete the requested operation because it can’t access the player’s
iCloud account.
static var lockdownMode: GKError.Code
The system can’t complete the requested operation because the player enabled Lockdown
Mode on the device.
static var appUnlisted: GKError.Code
The system can’t complete the requested operation because the game isn’t available on the
App Store.
static var friendListDescriptionMissing: GKError.Code
The system denies access to the local player’s friends list because the game didn’t provide a
reason.
static var friendListRestricted: GKError.Code
The system restricts access to the local player’s friends list.
static var friendListDenied: GKError.Code
The local player denies access to their friends list.
static var friendRequestNotAvailable: GKError.Code
The player can’t send a friend request at this time from this device.


## Page 5

static var errorDomain: String
static var debugMode: GKError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
Error codes for the GameKit error domain.
let GKErrorDomain: String
The error domain for general game errors.
Error Domain
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 6

case gameUnrecognized
The system can’t complete the requested operation because Game Center doesn’t recogniz
the app.
case notSupported
The app doesn’t have Game Center enabled.
case appUnlisted
The system can’t complete the requested operation because the game isn’t available on the
App Store.
case unknown
The system can’t complete the requested operation due to an unknown error.
case cancelled
The system canceled the requested operation or the user disabled it.
Topics
Configuration Errors
Communication Errors
GameKit / GKError / GKError.Code
Enumeration
GKError.Code
Error codes for the GameKit error domain.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 7

case communicationsFailure
The system can’t complete the requested operation due to an error communicating with the
server.
case invalidPlayer
The system can’t complete the requested operation because the player is invalid.
case invalidParameter
The system can’t complete the requested operation because one or more parameters are
invalid.
case gameSessionRequestInvalid
The properties of the game session request are impossible to fulfill.
case apiNotAvailable
The system can’t complete the requested operation because the API isn’t available.
case connectionTimeout
The system can’t complete the requested operation because the connection timed out.
case apiObsolete
The system can’t complete the requested operation because Apple deprecated the API.
case userDenied
The system can’t complete the requested operation because the user denied it.
case invalidCredentials
The system can’t complete the requested operation because the user name or password are
incorrect.
case notAuthenticated
The system can’t complete the requested operation because the system hasn’t authorized t
player.
case authenticationInProgress
The system can’t complete the requested operation because the local player is already
authenticating.
case parentalControlsBlocked
The system can’t complete the requested operation because the user disabled this feature i
Restrictions.
Player-Related Errors


## Page 8

case playerStatusExceedsMaximumLength
The player’s status exceeds the maximum length.
case playerStatusInvalid
The player’s status is invalid.
case underage
The system can’t complete the requested operation because this feature isn’t available to
underage players.
case playerPhotoFailure
The system can’t complete the requested operation to retrieve a player’s photo.
case ubiquityContainerUnavailable
The system can’t complete the requested operation because the user hasn’t signed in to
iCloud or hasn’t enabled iCloud Drive.
case notAuthorized
The system can’t complete the requested operation because the system hasn’t authorized t
player.
case iCloudUnavailable
The system can’t complete the requested operation because it can’t access the player’s
iCloud account.
case lockdownMode
The system can’t complete the requested operation because the player enabled Lockdown
Mode on the device.
case friendListDescriptionMissing
Access to the local player’s list of friends denied for lack of a reason.
case friendListRestricted
Access to the local player’s list of friends restricted.
case friendListDenied
Access to the local player’s list of friends denied.
case friendRequestNotAvailable
The player can’t send a friend request at this time from this device.
Friend List Errors


## Page 9

case matchRequestInvalid
The system can’t complete the requested operation because the match request is invalid.
case unexpectedConnection
An unexpected player has connected to a match.
case invitationsDisabled
The system can’t complete the requested operation because the receiving player has disabl
invitations.
case matchNotConnected
The system can’t complete the requested operation because the match isn’t connected to
other players.
case restrictedToAutomatch
The system can’t complete the requested operation because the player is using automatch.
case turnBasedMatchDataTooLarge
The system can’t complete the requested operation because the match data is too large.
case turnBasedTooManySessions
The system can’t complete the requested operation because it exceeds the maximum numb
of sessions.
case turnBasedInvalidParticipant
The system can’t complete the requested operation because the specified participant is
invalid.
case turnBasedInvalidTurn
The system can’t complete the requested operation because the participant doesn’t have th
required turn state.
case turnBasedInvalidState
The system can’t complete the requested operation because the session is in an invalid state
Matchmaking Errors
Turn-Based Game Errors
Leaderboard Errors


## Page 10

case scoreNotSet
The system can’t complete the requested operation because the system hasn’t set the score
case challengeInvalid
The challenge request failed due to invalid challenge data.
Deprecated
case debugMode
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct GKError
The error structure used by this framework.
Challenges Errors
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Errors


## Page 11

let GKErrorDomain: String
The error domain for general game errors.


## Page 12

struct GKError
The error structure used by this framework.
enum Code
Error codes for the GameKit error domain.
See Also
Errors
GameKit / GKErrorDomain
Global Variable
GKErrorDomain
The error domain for general game errors.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


