# 000_Reporting unrecognized and transactionless tokens.pdf

## Page 1

If a customer doesn’t successfully complete an external purchase, you must still report the token,
even if it has no transaction. App Store Server Notifications V2 notifies you of externa
purchase tokens you haven’t yet reported, 10 days after the system creates the token, or soon aft
ACQUISITION and SERVICES tokens expire. Report the token, including when your system
doesn’t have a record of the token.
Send a request to the Send External Purchase Report endpoint to report all external
purchase tokens. Add the following information in the ExternalPurchaseReport request body
Supply a requestIdentifier, to uniquely identify the report.
Provide the externalPurchaseId of the token you’re reporting.
Then, specify the type of report in the status field:
Use NO_LINE_ITEM when the external purchase token doesn’t have any associated
transactions.
Use UNRECOGNIZED_TOKEN when you receive an App Store server notification with an extern
purchase token your system doesn’t recognize.
Use DUPLICATE_TOKEN when your system recognizes the token, but is using another token
that’s active in the same period to report transactions. This status applies to SERVICES and
ACQUISITION tokens only.
Don’t provide a lineItems field in the request body when using the above status values.
Overview
External Purchase Serve… / Reporting unrecognized and transactionless tokens
Article
Reporting unrecognized and
transactionless tokens
Create reports for external purchase tokens that didn’t result in completed
transactions, duplicate tokens, or tokens that you learn of from an App Store serve
notification.


## Page 2

Use the NO_LINE_ITEM status to report an external purchase token that didn’t result in any
completed transactions. The following example shows the ExternalPurchaseReport request
body for a token without any associated transactions:
Apple sends notifications to your App Store Server Notifications V2 endpoint for
external purchase tokens that remain unreported. The notification has a notificationType of
EXTERNAL_PURCHASE_TOKEN and a subtype of UNREPORTED. It provides the token’s
externalPurchaseId in the externalPurchaseToken field of notification’s payload. Apple
sends the notification 10 days after it creates a token without an expiration date. For custom link
tokens, which have an expiration date, Apple sends the notification soon after the token expires.
Compare the externalPurchaseId to the tokens in your system. If your system doesn’t have a
record of a matching token, use the UNRECOGNIZED_TOKEN status to send a report to Apple.
The following example shows the ExternalPurchaseReport request body for an unrecognize
token:
If your app uses the ExternalPurchaseCustomLink API, it calls the token(for:) method t
get tokens. If there’s an active token period, the system returns the token that corresponds to tha
active period. The returned token can be an original token, or it can be a refreshed token. A
refreshed token has the same creation and expiration dates as the original token, but a different
externalPurchaseId. You can report transactions using any one of the customer’s tokens tha
represent the same active token period, and report the remaining of the tokens from the same
period as duplicate tokens.
Report a token without a completed transaction
Report an unrecognized token
Report duplicate tokens


## Page 3

For example, you can choose to report transactions using the first active SERVICES token you
receive, and report all subsequent SERVICES tokens with the same creation and expiration dates 
a duplicate.
When a customer has both an ACQUISITION and SERVICES token in the same active period, you
can report transactions using just the SERVICES token, and report the ACQUISITION token withou
any transactions.
Note
Don’t report the same transaction twice. Use only one of the SERVICES or ACQUISITION
tokens to report a transaction when both token types are active for the customer.
For more information about receiving tokens, see Receiving and decoding external purchase
tokens. The following example shows the ExternalPurchaseReport request body for a
duplicate token:


