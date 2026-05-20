# 000_Users.pdf

## Page 1

The users resource represents an App Store Connect user. You can change or delete users, but
you cannot add them directly. To add users, create a userInvitation. App Store Connect add
the user to your team when they accept the invitation.
List Users
Get a list of the users on your team.
Read User Information
Get information about a user on your team, such as name, roles, and app visibility.
Modify a User Account
Change a user’s role, app visibility information, or other account details.
Remove a User Account
Remove a user from your team.
Overview
Topics
Getting User Information
Modifying and Removing User Accounts
Listing, Adding, and Removing App Access
App Store Connect API / Users
API Collection
Users
Manage users on your App Store Connect team.


## Page 2

List All Apps Visible to a User
Get a list of apps that a user on your team can view.
Get All Visible App Resource IDs for a User
Get a list of app resource IDs to which a user on your team has access.
Add Visible Apps to a User
Give a user on your team access to one or more apps.
Replace the List of Visible Apps for a User
Replace the list of apps a user on your team can see.
Remove Visible Apps from a User
Remove a user on your team’s access to one or more apps.
object User
The data structure that represents a Users resource.
object UserUpdateRequest
The request body you use to update a User.
object UserResponse
A response that contains a single Users resource.
object UsersResponse
A response that contains a list of Users resources.
object UserVisibleAppsLinkagesRequest
A request body you use to add or remove visible apps from a user.
object UserVisibleAppsLinkagesResponse
A response body that contains a list of related resource IDs.
type UserRole
Strings that represent user roles and permissions in App Store Connect.
Objects and Data Types
See Also


## Page 3

User Invitations
Email invitations to join your App Store Connect team.
Sandbox Testers
Manage sandbox testers on your App Store Connect team.
Users and Access


