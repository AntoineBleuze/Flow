# Getting usage information.pdf

## Page 1

expirationDate
date-time
The date and time when the usage information is considered expired. This
value can be at most one year in the future.
merchantLogoName
string
The name of an image that represents the merchant—their logo.
merchantName
string
(Required)
merchantToken
Identifier
string
(Required) The merchant token identifier. This value must match the identifie
of the merchant token for which you provided the usage information.
modificationDate
date-time
(Required) The date and time when the usage information was last modified
otherUsage
Description
string
A localized description of other usage, such as being a fallback payment
method with the merchant.
pastPayments
[PastPayment]
A list of past payments.
schemaVersion
number
(Required) A name representing the bank and the card used for the
transaction.
Properties
Apple Pay Merchant Tok… / UsageInformation
Object
UsageInformation
Information about the usage of a merchant token, such as past and upcoming
payments.


## Page 2

Value: 1
upcomingPayments
[UpcomingPayment]
A list of upcoming payments to display in the order provided.


