# Users and Access.pdf

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


## Page 4

The userInvitations resource represents users who have been invited to join a team in App
Store Connect. When you create a user invitation the user receives an email with a link to activate
an account and connect it to their Apple Account.
If the user accepts the invitation, the user is added to the team and the invitation is deleted. User
invitations expire after three days.
You can also get a list of all invited users, read the invite information of a single user, and find out
which apps an invited user can test.
List Invited Users
Get a list of pending invitations to join your team.
Read User Invitation Information
Get information about a pending invitation to join your team.
Invite a User
Invite a user with assigned user roles to join your team.
Overview
Topics
Getting Invited Users
Sending and Canceling Invitations
App Store Connect API / User Invitations
API Collection
User Invitations
Email invitations to join your App Store Connect team.


## Page 5

Cancel a User Invitation
Cancel a pending invitation for a user to join your team.
List All Apps Visible to an Invited User
Get a list of apps that will be visible to a user with a pending invitation.
GET /v1/userInvitations/{id}/relationships/visibleApps
object UserInvitation
The data structure that represents a User Invitations resource.
object UserInvitationCreateRequest
The request body you use to create a User Invitation.
object UserInvitationResponse
A response that contains a single User Invitations resource.
object UserInvitationsResponse
A response that contains a list of User Invitations resources.
object UserInvitationVisibleAppsLinkagesResponse
Users
Manage users on your App Store Connect team.
Sandbox Testers
Manage sandbox testers on your App Store Connect team.
Getting Visible Apps
Objects
See Also
Users and Access


## Page 6

The sandboxTesters resource represents a Sandbox Apple Account, which is an account you
use to test your app in the sandbox environment. Using this resource you can read and modify
Sandbox Apple Accounts and their data. Use App Store Connect to create or delete Sandbox App
Account. For more information, see Create Sandbox Apple Accounts. For more information about
testing in-app purchase in the sandbox environment, see Overview of testing in sandbox.
List Sandbox Testers
Get a list of Sandbox Testers for your team.
Modify a Sandbox Tester
Change the subscription renewal time rate, set interrupted purchases or change territory of
Sandbox Apple Account.
Clear Purchase History for a Sandbox Tester
Remove purchase history from a Sandbox Apple Account.
object SandboxTesterV2Response
object SandboxTesterV2UpdateRequest
Overview
Topics
Sandbox Tester Lookup and Modification
Objects
App Store Connect API / Sandbox Testers
API Collection
Sandbox Testers
Manage sandbox testers on your App Store Connect team.


## Page 7

object SandboxTestersClearPurchaseHistoryRequestV2
object SandboxTestersClearPurchaseHistoryRequestV2CreateRequest
object SandboxTestersClearPurchaseHistoryRequestV2Response
object SandboxTestersV2Response
object SandboxTesterV2
Users
Manage users on your App Store Connect team.
User Invitations
Email invitations to join your App Store Connect team.
See Also
Users and Access


