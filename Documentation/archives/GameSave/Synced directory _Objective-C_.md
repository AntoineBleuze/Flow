# Synced directory _Objective-C_.pdf

## Page 1

To get an instance of the directory, call open(forContainerIdentifier:), which returns the
directory for the iCloud container associated with the specified identifier. Calling this method star
syncing the directory in the background on the specified container. When the game needs to
access the contents of the directory, show a UI while the directory fully syncs using the finish
Syncing(_:completionHandler:) method. If you’re showing your own UI, call the finish
Syncing(completionHandler:) method to wait for the directory to finish syncing.
After the directory is ready to use, syncing pauses until you close the directory object or the obje
is deallocated. To resume syncing during the game, close and re-open the directory by calling
close() and then open(forContainerIdentifier:).
class func open(forContainerIdentifier: String?) -> GSSyncedDirectory
Requests an instance of the game-save directory.
var directoryState: GSSyncedDirectoryState
The state of the directory.
Overview
Topics
Accessing a directory
GameSave / GSSyncedDirectory
Class
GSSyncedDirectory
A cloud-synced directory for game-save data.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

class GSSyncedDirectoryState
Represents the state and its associated properties of the directory
func finishSyncing(UIWindow, completionHandler: () -> Void)
Waits for the directory sync to complete, showing the sync’s progress in a modal alert.
func finishSyncing(completionHandler: () -> Void)
Waits for the directory sync to complete, without showing any user interface.
class GSSyncedDirectoryVersion
func resolveConflicts(with: GSSyncedDirectoryVersion)
Indicates that you resolved a conflict.
func triggerPendingUpload(completionHandler: (Bool) -> Void)
Triggers an upload of the directory for any changes that were pending.
func close()
Closes the directory, and resumes syncing the directory to the cloud.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Syncing a directory
Resolving conflicts
Finishing with a directory
Relationships
Inherits From
Conforms To


## Page 3

Hashable
NSObjectProtocol


