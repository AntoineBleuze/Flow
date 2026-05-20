# 001_User Invitations.pdf

## Page 1

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


## Page 2

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


