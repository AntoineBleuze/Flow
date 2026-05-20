# 001_GKError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

let GKErrorDomain: String
The error domain for general game errors.


