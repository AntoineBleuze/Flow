# 003_Preferences Utilities.pdf

## Page 1

Several functions return a preference value as a Core Foundation property list object.
You can use the function CFGetTypeID(_:) to determine the value’s type. For more information
about property lists, see Property List Programming Topics for Core Foundation.
Core Foundation provides a simple, standard way to manage user (and application) preferences.
Core Foundation stores preferences as key-value pairs that are assigned a scope using a
combination of user name, application ID, and host (computer) names. This makes it possible to
save and retrieve preferences that apply to different classes of users. Core Foundation preference
is useful to all applications that support user preferences. Note that modification of some
preferences domains (those not belonging to the “Current User”) requires root privileges (or Adm
privileges prior to OS X v10.6)—see Authorization Services Programming Guide for information on
how to gain suitable privileges.
Unlike some other Core Foundation types, CFPreferences is not toll-free bridged to its
corresponding Cocoa Foundation framework class (NSUserDefaults). CFPreferences is thread
safe.
func CFPreferencesCopyAppValue(CFString, CFString) -> CFPropertyList?
Obtains a preference value for the specified key and application.
Overview
Overview
Topics
Getting Preference Values
Core Foundation / Preferences Utilities
API Collection
Preferences Utilities


## Page 2

func CFPreferencesCopyKeyList(CFString, CFString, CFString) -> CFArray?
Constructs and returns the list of all keys set in the specified domain.
func CFPreferencesCopyMultiple(CFArray?, CFString, CFString, CFString) 
> CFDictionary
Returns a dictionary containing preference values for multiple keys.
func CFPreferencesCopyValue(CFString, CFString, CFString, CFString) ->
CFPropertyList?
Returns a preference value for a given domain.
func CFPreferencesGetAppBooleanValue(CFString, CFString, UnsafeMutable
Pointer<DarwinBoolean>?) -> Bool
Convenience function that directly obtains a Boolean preference value for the specified key.
func CFPreferencesGetAppIntegerValue(CFString, CFString, UnsafeMutable
Pointer<DarwinBoolean>?) -> CFIndex
Convenience function that directly obtains an integer preference value for the specified key.
func CFPreferencesSetAppValue(CFString, CFPropertyList?, CFString)
Adds, modifies, or removes a preference.
func CFPreferencesSetMultiple(CFDictionary?, CFArray?, CFString,
CFString, CFString)
Convenience function that allows you to set and remove multiple preference values.
func CFPreferencesSetValue(CFString, CFPropertyList?, CFString, CFStrin
, CFString)
Adds, modifies, or removes a preference value for the specified domain.
func CFPreferencesAppSynchronize(CFString) -> Bool
Writes to permanent storage all pending changes to the preference data for the application,
and reads the latest preference data from permanent storage.
func CFPreferencesSynchronize(CFString, CFString, CFString) -> Bool
For the specified domain, writes all pending changes to preference data to permanent
storage, and reads latest preference data from permanent storage.
Setting Preference Values
Synchronizing Preferences


## Page 3

func CFPreferencesAddSuitePreferencesToApp(CFString, CFString)
Adds suite preferences to an application’s preference search chain.
func CFPreferencesRemoveSuitePreferencesFromApp(CFString, CFString)
Removes suite preferences from an application’s search chain.
func CFPreferencesAppValueIsForced(CFString, CFString) -> Bool
Determines whether or not a given key has been imposed on the user.
func CFPreferencesCopyApplicationList(CFString, CFString) -> CFArray?
Constructs and returns the list of all applications that have preferences in the scope of the
specified user and host.
Deprecated
Application, Host, and User Keys
Keys used to specify the common preference domains.
Preferences Programming Topics for Core Foundation
Base Utilities
Byte-Order Utilities
Core Foundation URL Access Utilities
Socket Name Server Utilities
Adding and Removing Suite Preferences
Miscellaneous Functions
Constants
See Also
Related Documentation
Utilities


## Page 4

Time Utilities


