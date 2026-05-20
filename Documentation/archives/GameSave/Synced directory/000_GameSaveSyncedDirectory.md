# 000_GameSaveSyncedDirectory.pdf

## Page 1

To get an instance of the directory, call openDirectory(containerIdentifier:), which
returns the directory for the iCloud container associated with the specified identifier. Calling this
method starts syncing the directory in the background on the specified container. When the game
needs to access the contents of the directory, show a UI while the directory fully syncs using the
gameSaveSyncingAlert(directory:finishedLoading:) view extension if your app use
SwiftUI, the finishSyncing(statusDisplay:) method if your app uses UIKit, or the finis
Syncing(statusDisplay:) method if your app uses AppKit.
If you’re showing your own UI, call the finishSyncing() method to wait for the directory to
finish syncing.
After the directory is ready to use, syncing pauses until you close the directory object or the obje
is deallocated. To resume syncing during the game, close and re-open the directory by calling
close() and then openDirectory(containerIdentifier:).
class func openDirectory(containerIdentifier: String?) -> GameSaveSynce
Directory
Overview
Topics
Accessing a directory
GameSave / GameSaveSyncedDirectory
Class
GameSaveSyncedDirectory
A cloud-synced directory for game-save data.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

Requests an instance of the game-save directory.
enum State
The state of the directory.
var state: GameSaveSyncedDirectory.State
The state that the game-save directory is in.
func finishSyncing() async
Waits for the directory sync to complete, without showing any user interface.
func finishSyncing(statusDisplay: NSWindow) async
Waits for the directory sync to complete, showing the sync’s progress in a modal alert.
func finishSyncing(statusDisplay: UIWindow) async
Waits for the directory sync to complete, showing the sync’s progress in a modal alert.
class Version
A representation of a version of the directory.
func resolveConflicts(with: GameSaveSyncedDirectory.Version)
Indicates that you resolved a conflict.
func triggerPendingUpload() async -> Bool
Triggers an upload of the directory for any changes that were pending.
func close()
Closes the directory, and resumes syncing the directory to the cloud.
Syncing a directory
Resolving conflicts
Finishing with a directory
Relationships
Conforms To


## Page 3

Copyable
Equatable
Identifiable
Observable
Sendable
SendableMetatype


