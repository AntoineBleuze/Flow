# Tax codes and pricing.pdf

## Page 1

Apps that use the Advanced Commerce API manage their own catalog of in-app purchases and
their respective SKUs, including their prices. When supplying a price, be sure to use the supporte
number of decimal places, as shown in the section below. In the API, provide the price value in
milliunit format.
When setting a price for your SKU, it’s strongly recommended that you choose from the 900 price
points that the App Store supports across 175 storefronts and 44 currencies. To view or download
a .csv file that includes all the storefronts, currencies, and price points:
In App Store Connect, log in with an App Manager role.
Select Apps, and choose your app.
In the left menu, select Pricing and Availability.
Select Available Prices by Country or Region.
Select Download All Prices and Currencies.
For price point information by currency, see App Store Pricing Update.
To determine the currency to use at runtime, check the device’s App Store storefront. For a list of
currencies that the App Store supports for each storefront, see Financial reports regions and
currencies. For information about getting the current storefront in the app, see the current
property of Storefront. For more information on currency, see currency.
Discussion
Determine the currency at runtime
Advanced Commerce API / Specifying prices for Advanced Commerce SKUs
Article
Specifying prices for Advanced Commerce
SKUs
Provide prices for SKUs with the supported number of decimal places, in milliunits
of currency.


## Page 2

The Advanced Commerce API accepts prices in milliunit format, as noted in the documentation,
such as for the price type.
To determine a price in milliunits, multiply the price by 1000. One unit of a currency equals 1000
milliunits. The following table shows examples of valid prices in milliunit format:
Price
Milliunits
USD 1.99
1990
KRW 3300
3300000
JPY 359
359000
Note
The payment sheet and other customer communications automatically display prices in the
standard format, not in milliunits.
The App Store supports either zero or two decimal places for prices, depending on the currency.
The following table shows examples of valid and invalid prices, based on the number of decimal
places they use:
Currency
Supported deci‐
mal places
Valid price example (and
milliunit equivalent)
Invalid price example (and
milliunit equivalent )
USD
2
1.45 (1450)
$1.095 (1095)
JPY
0
310 (310000)
310.95 (310950)
Important
Don’t exceed the supported number of decimal places when you supply a price in the
Advanced Commerce API. If your API call includes more decimal digits on a price than its
currency supports, the system doesn’t display the payment sheet and fails with an error.
Provide prices in milliunit format in API calls
Use the supported number of decimal places for prices


## Page 3

The following currencies don’t support any decimal places:
Currency code
Decimal places
CLP
0
COP
0
DKK
0
HKD
0
HUF
0
IDR
0
INR
0
JPY
0
KRW
0
KZT
0
MXN
0
NGN
0
NOK
0
PHP
0
PKR
0
RUB
0
SEK
0
THB
0
TWD
0
TZS
0
Look up the supported number of decimal places by
currency code


## Page 4

Currency code
Decimal places
VND
0
The following currencies support two decimal places:
Currency code
Decimal places
AED
2
AUD
2
BGN
2
BRL
2
CAD
2
CHF
2
CNY
2
CZK
2
EGP
2
EUR
2
GBP
2
ILS
2
MYR
2
NZD
2
PEN
2
PLN
2
QAR
2
RON
2
SAR
2


## Page 5

Currency code
Decimal places
SGD
2
TRY
2
USD
2
ZAR
2
Choosing tax codes for your SKUs
Select a tax code for each SKU that represents a product your app offers as an in-app
purchase.
Handling subscription price changes
Initiate a price change and manage communications with your subscribers through the App
Store.
See Also
Tax codes and pricing


## Page 6

Each SKU, which represents a unique product that your app offers as an in-app purchase, needs 
tax code. You provide the tax code value each time you use the Advanced Commerce API to
transact.
Use the following table to look up tax codes for your products.
Note
Other tax codes are available, similar to those listed in Set a tax category. If you don’t see an
appropriate tax code for your product in the table below, send a request using the Advanced
Commerce API Access form on the Advanced Commerce API page.
Select the tax code for your subscription or one-time purchase based on the following tax
categories, subcategories, and attributes. You can use the App Store Software category as a
default.
Tax category / Tax
subcategory
Selected attributes
Tax code for
subscriptions
Tax code for
one-time
purchases
App Store Software
(Default)
No selectable attributes
C003-00-1
C003-00-2
Overview
Look up tax codes for in-app purchases
Advanced Commerce API / Choosing tax codes for your SKUs
Article
Choosing tax codes for your SKUs
Select a tax code for each SKU that represents a product your app offers as an in-
app purchase.


## Page 7

Tax category / Tax
subcategory
Selected attributes
Tax code for
subscriptions
Tax code for
one-time
purchases
Audiobooks / Has
ISBN, ISSN, or ECN
Available for offline listening
S007-01-1
S007-01-2
Audiobooks / Has
ISBN, ISSN, or ECN
Available for offline listening
The standard (list) price is
displayed
Contains stories with distributed
speaker roles, noises, and music
S007-010409-
1
S007-010409-2
Audiobooks / Does
not have ISBN, ISSN,
or ECN
Available for offline listening
S008-02-1
S008-02-2
Books / Has ISBN,
ISSN, or ECN
Available for offline viewing
The standard (list) price is
displayed
Contains interactive features
(excluding dictionary, notation,
and commenting features)
Contains profane or swear words
S001-
03050614-1
S001-03050614
2
Books / Has ISBN,
ISSN, or ECN
Available for offline viewing
The standard (list) price is
displayed
Contains profane or swear words
Depicts illegal acts, including
theft, assault, drug taking, or
robbery
S001-
03060714-1
S001-03060714
2
Books / Does not
have ISBN, ISSN, or
ECN
Available for offline viewing
A complete book (not an
excerpt)
S002-
02040708-1
S002-
02040708-2


## Page 8

Tax category / Tax
subcategory
Selected attributes
Tax code for
subscriptions
Tax code for
one-time
purchases
Contains profane or swear words
Depicts illegal acts, including
theft, assault, drug taking, or
robbery
Boosting
No selectable attributes
N/A
C025-00-2
Games
Primarily played online
C009-0102-1
C009-01-2
Video / Pay-Per-View
No attribute selected
N/A
S022-00-2
Video / Pay-Per-View
Exclusively features live TV
broadcasting and/or linear
programming
N/A
S022-01-2
Video / Purchase for
permanent access
Content is available for offline
viewing
N/A
S020-01-2
Video / Rental
Content is primarily accessed
through streaming
N/A
S019-01-2
Video / Subscription
No attribute selected
S021-08-1
S021-08-2
Video / Subscription
Live TV broadcasting and/or
linear programming make up
more than 10% of total content
S021-0308-1
S021-0308-2
For more information about tax categories, see Set a tax category.
Specifying prices for Advanced Commerce SKUs
Provide prices for SKUs with the supported number of decimal places, in milliunits of
currency.
Handling subscription price changes
See Also
Tax codes and pricing


## Page 9

Initiate a price change and manage communications with your subscribers through the App
Store.


## Page 10

The Advanced Commerce API provides a standard UI to facilitate price increases for subscription
and manage the subscriber consent process.
Note
The AppStore doesn’t currently support the Advanced Commerce price increase mechanism in
India.
Use the Change Subscription Price endpoint in the Advanced Commerce API (ACA) to
initiate a price change for an individual subscription item. The UI the framework provides manage
all of the necessary interactions and communication with a person using your app, including:
Consent management for price increases.
Notifications about price increases when the price increase doesn’t requite explicit consent.
A standard UI sheet that App Store displays to obtain explicit user consent, if required, or an
acknowledgment of the price increase if explicit consent isn’t required. Examples of these
sheets and an explanation of the information they display about your app and the subscription
are shown below.
Overview
Implement the Advanced Commerce Subscription
price change API
Advanced Commerce API / Handling subscription price changes
Article
Handling subscription price changes
Initiate a price change and manage communications with your subscribers throug
the App Store.


## Page 11



## Page 12

The App Store checks if a price increase requires consent, and follows different paths depending
on whether a subscriber needs to explicitly consent to a price increase or not.
The App Store requests explicit consent from the subscriber if the price increase meets any of the
following criteria:
The subscriber is located in a region that requires consent for any price changes. For more
information about these regions, see Auto-renewable subscription price increase thresholds.
The price increase is:
More than 50 percent of the current price; and
Understand consent management and price change
communication
Follow the consent-needed path


## Page 13

The difference in price exceeds 5 United States Dollars (USD) per period for nonannual
subscriptions, or 50 USD per year for annual subscriptions. International equivalents for
prices not in USD are based on current exchange rates with specific thresholds subject to
change based on changes in taxes or foreign exchange rates.
The subscriber had a price increase for the same subscription within the past 12 months.
The subscriber is located in South Korea and is converting from a free trial to a paid subscriptio
or from a discounted offer to a standard subscription price. For subscribers in South Korea, see
Implement communication and consent management for South Korea at the end of this article.
When conditions require consent, the App Store notifies subscribers via email, price increase
sheet, and push notification, according to the timelines below. If a subscriber doesn’t take any
action, the App Store continues to request consent no more than once per week for each method
You can’t raise the price until you receive the subscriber’s consent.
The following notification timeline applies to all cases, except for subscribers in South Korea who
are converting from free trials and discount offers:
Subscription interval
Email, price increase sheet, and push notif‐
ication timelines
For 2-month, 3-month, 6-month, and annual
subscriptions
60 days before the renewal date
Monthly subscriptions
27 days before the renewal date
Weekly subscriptions
7 days before the renewal date
When a price increase doesn’t need the subscriber’s consent, the App Store only notifies
subscribers about the new price. When the App Store increases the price of multiple items within
bundle, none of which require consent, it uses a single API request so the subscriber receives a
summary of the price increases. The App Store combines notifications into a single communicatio
per method (a single email, one price increase sheet, and a single push notification).
The App Store uses the following communications methods and timelines to notify subscribers:
Follow the consent not-needed path


## Page 14

Email
For all subscription durations, the App Store sends an email 27 days before the renewal date.
Note that for weekly subscriptions, the App Store calls the Change Subscription Price
endpoint on the fourth consecutive renewal to increase the price.
Price increase sheet
The App Store displays a price increase sheet at the first app launch after the subscriber has
entered the notice period.
Push notification
The App Store displays a push notification seven days before the renewal date if the
subscriber hasn’t viewed the price increase sheet in-app.
Note
Unlike when requesting consent, the App Store doesn’t send a push notification if the
subscriber acknowledges the price increase on the sheet. Notifying via email is still a
requirement in either case.
Several conditions may affect your ability to change or update a subscription, including:
During the price increase window, the renewal uses the increased price that the developer has
specified using Change Subscription Price if you make any of the following changes to
the subscription:
Adding an item
Removing an item
Changing an item
Resubscribing using the Subscription Modification API or the Subscription Reactivation API
If the subscription status is auto-renew = false or if the subscription is in a grace period or
billing retry state, you can’t call the Change Subscription Price endpoint.
If the SubscriptionPriceChangeItem is currently in the offer period, you can’t call Chang
Subscription Price.
Understand change subscription conditions and
limitations
Understand interactions with other ACA operations


## Page 15

Several conditions can affect your ability to update a subscription. There may be specific
interactions and rules that apply to price increases, depending on which Advanced Commerce AP
you need to use.
If you need to reactivate items, call the SubscriptionReactivateInAppRequest API. The
following conditions apply to reactivations:
If the App Store communicated the price increase, it reactivates the items you provide through
the items key in the properties you supply to the SubscriptionReactivateInApp
Request request at the higher price. Failing to explicitly reactivate an item doesn’t result in the
App Store activating the higher price, because the App Store needs to communicate the price
increase and receive consent through the normal process.
If the App Store hasn’t communicated the price increase, it schedules the price increase
communications for the next eligible date.
If you need to modify a subscription, call the SubscriptionModifyInAppRequest API. Price
increases interact with the ACA in a specific way depending on if the call resets or retains the billi
cycle.
If the price increase will take place during a retain billing cycle, the following rules apply:
If the App Store communicated the price increase:
If the price increase is pending consent, the higher price is shown in the Payment Sheet, and
the user must consent to the price increase via the in-app sheet that appears, or via Manage
Subscriptions.
If the subscriber consented to the price increase, or the price increase doesn’t require
consent, the Payment Sheet shows the higher price.
If the subscriber declined the price increase, the item doesn’t appear in the Payment Sheet.
If the item’s SKU is changing to a different product SKU (such as from SKU BASIC to SKU
PREMIUM), the change invalidates the price increase, since the new SKU represents a different
product.
When the App Store sends an offer with an item subject to a price increase, it’s a special
consideration; in this case, you send the higher price of the item, and the App Store reschedule
the price increase for after the offer period has completed, at which point, the item renews at t
higher price.
If the price increase will take place during a reset billing cycle, the following rules apply:
If the App Store hasn’t communicated the price increase, the price increase is invalidated.
If the the App Store communicated the price increase, the App Store applies the new price only
if the item is sent with the higher price, using the SubscriptionModifyChangeItem.
As described above, changing the item to a different product (such as changing from BASIC
SKU to a Premium SKU) invalidates the price increase, as the item represents a different


## Page 16

product.
If you need to change a subscription’s metadata, call the Change Subscription Metadata.
Metadata-only changes, such as changing the SKU from SKU A to SKU B, preserves the price
increase because it isn’t a change in product, but rather a change to the product SKU.
If you need to call the ACA Migration API to migrate a subscription that a subscriber purchased
through In-App Purchase to a subscription you manage using the Advanced Commerce API, the
following rules apply:
If the In-App purchase product has a pending price increase through App Store Connect, the
App Store doesn’t allow the migration if it has already communicated the price increase to the
subscriber.
The App Store doesn’t allow migrations if the item is currently subject to a price increase, and
the App Store already sent price increase communications to the subscriber.
If there’s an upcoming price increase, the App Store migrates the pending price increase as we
The following table describes the meaning of prince increase status values:
Price increase
info status
Description
priceIncrease
Info
.SCHEDULED
Indicates the App Store scheduled the price increase for the
SubscriptionPriceChangeItem.
priceIncrease
Info.PENDING
Indicates there’s a pending price increase for the SubscriptionPrice
ChangeItem that requires subscriber consent, and the subscriber hasn’t
yet consented. If the subscriber doesn’t consent, the Subscription
PriceChangeItem expires at the end of the billing cycle.
priceIncrease
Info.ACCEPTED
Indicates that the subscriber consented to a price increase for the
SubscriptionPriceChangeItem.
The following table describes the notifications and status values for a subscription price change
item that requires consent:
Understand price increase status and update values


## Page 17

Notification
type
Subtype
Property details
Description
PRICE
_CHANGE
-
price
IncreaseInfo
.SCHEDULED
Indicates that you called the Change
Subscription Price endpoint. This
notification only applies to apps that use the
Advanced Commerce API.
PRICE
_INCREASE
PENDING
price
IncreaseInfo
.PENDING
Indicates there’s a pending price increase fo
the SKU that requires subscriber consent,
and the subscriber hasn’t yet consented. If
the subscriber doesn’t consent, the SKU
expires at the end of the billing cycle.
PRICE
_INCREASE
ACCEPTED
price
IncreaseInfo
.ACCEPTED
Indicates that the subscriber consented to a
price increase for the SKU.
EXPIRED
PRICE
_INCREASE
-
Indicates that the auto-renewable
subscription expired because the subscribe
didn’t consent to the price increase, and
allowed the subscription to expire.
EXPIRED
VOLUNTARY
-
Indicates that the subscriber voluntarily
canceled the auto-renewable subscription.
This notification type and subtype isn’t
specific to price increases.
DID_RENEW
-
-
Indicates the SKU renewed. Always check
JWSRenewalInfo and the
JWSTransaction information to provide
service to the list items.
The following table describes the notifications and status values for a subscription price change
item that doesn’t require consent:
Notification
type
Subtype
Property details
Description
PRICE
_CHANGE
-
priceIncrease
Info
.SCHEDULED
Indicates that you called the Change
Subscription Price endpoint. This
notification only applies to apps that use th
Advanced Commerce API.


## Page 18

Notification
type
Subtype
Property details
Description
PRICE
_INCREASE
ACCEPTED
priceIncrease
Info.ACCEPTED
Indicates that the App Store informed the
subscriber for the subscription price
increase for the item, and it is subject to the
price increase.
EXPIRED
VOLUNTARY
-
Indicates that the subscriber voluntarily
canceled the auto-renewable subscription.
This notification type and subtype isn’t
specific to price increases.
DID_RENEW
-
-
The SKU renewed. Always check
JWSRenewalInfo and the
JWSTransaction information to provide
service to the list items.
The following table describes the notifications and status values for a subscription price change
item that decreases a price:
Notification
type
Subtype
Property
details
Description
PRICE
_CHANGE
-
-
Indicates that you called the Change Subscriptio
Price endpoint. This notification only applies to apps
that use the Advanced Commerce API.
DID_RENEW
-
-
Indicates the SKU renewed. Always to check to ensure
JWSRenewalInfo and the JWSTransaction
information to provide service to the list items.
To create a contingency for a situation in which a person doesn’t agree to a price increase and the
App Store cancels other, bundled services (the “dependent SKUs”), you can provide an array of t
SKUs through the dependentSKUs property. If the price increase requires a person’s consent, a
they don’t consent to the price increase (through a cancellation from the Manage Subscriptions
view, or by failing to consent before the renewal date), the App Store cancels the dependent SKU
Understand conditional cancellations and
dependent SKUs


## Page 19

Important
You can’t have chains of dependent SKUs –– for example, if SKU A has dependent SKU B, B
can’t have its own dependent SKU, C. However, B can have its own price increase.
To test subscription price increases, call the Change Subscription Price API in the sandbo
to test the API responses. The sandbox environment — and TestFlight — support the full price
increase cycle, with the exception of the email and push notifications. The in-app sheet still
appears, and price increase management appears on the Manage Subscriptions page.
You can test granting consent or declining a price increase through the in-app sheet or by
navigating to the Manage Subscription page in the sandbox. For more information, see Testing
disabling auto-renew.
In the sandbox, the first renewal after calling Change Subscription Price uses the existing
price to assist in testing states prior to when the App Store communicated the price increase. Afte
the first renewal, the App Store simulates communicating the price increase for the next
appropriate renewal.
Note
After you call the Change Subscription Price API, the subscription renews on the higher
price after one renewal, giving you time to test in the sandbox environment,
For subscribers in South Korea who convert from a free trial to a paid subscription, or from a
discounted offer to a standard subscription price, use the following notification timelines:
Subscription interval
Email, price increase sheet, and push notification
timelines for South Korea
For 2-month, 3-month, 6-month, and
annual subscriptions
Within 30 days from the day before the payment or
conversion
Monthly subscriptions
Within 30 days from the day before the payment or
conversion
Test price increases in the sandbox
Implement communication and consent
management for South Korea


## Page 20

Subscription interval
Email, price increase sheet, and push notification
timelines for South Korea
Weekly subscriptions
Within 30 days from the day before the payment or
conversion
Note
For free trial or discounted offer conversions in South Korea, the 30-day window for
notifications doesn’t include the conversion or payment date. For example, if a two-month free
trial starts on March 1 and the payment or conversion date is May 1, you’re required to obtain
the consent from the person between April 1 and April 30, the 30-day window before the
payment or conversion date.
Specifying prices for Advanced Commerce SKUs
Provide prices for SKUs with the supported number of decimal places, in milliunits of
currency.
Choosing tax codes for your SKUs
Select a tax code for each SKU that represents a product your app offers as an in-app
purchase.
See Also
Tax codes and pricing


