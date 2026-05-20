# 003_notificationType.pdf

## Page 1

CONSUMPTION_REQUEST
A notification type that indicates that the customer initiated a refund request for a consumab
In-App Purchase or auto-renewable subscription, and the App Store is requesting that you
provide consumption data. For more information, see Send Consumption Information.
DID_CHANGE_RENEWAL_PREF
A notification type that, along with its subtype, indicates that the customer made a change 
their subscription plan. If the subtype is UPGRADE, the customer upgraded their subscriptio
The upgrade goes into effect immediately, starting a new billing period, and the customer
receives a prorated refund for the unused portion of the previous period. If the subtype is
DOWNGRADE, the customer downgraded their subscription. Downgrades take effect at the ne
renewal date and don’t affect the currently active plan.
If the subtype is empty, the customer changed their renewal preference back to the current
subscription, effectively canceling a downgrade.
For more information on subscription levels, see Ranking subscriptions within the group.
DID_CHANGE_RENEWAL_STATUS
A notification type that, along with its subtype, indicates that the customer made a change 
the subscription renewal status. If the subtype is AUTO_RENEW_ENABLED, the customer
reenabled subscription auto-renewal. If the subtype is AUTO_RENEW_DISABLED, the
Possible Values
App Store Server Notific… / notificationType
Type
notificationType
The type that describes the In-App Purchase or external purchase event for which
the App Store sends the version 2 notification.
App Store Server Notifications 2.0+


## Page 2

customer turned off subscription auto-renewal, or the App Store turned off subscription auto
renewal after the customer requested a refund.
DID_FAIL_TO_RENEW
A notification type that, along with its subtype, indicates that the subscription failed to rene
due to a billing issue. The subscription enters the billing retry period. If the subtype is GRAC
_PERIOD, continue to provide service through the grace period. If the subtype is empty, the
subscription isn’t in a grace period and you can stop providing the subscription service.
Inform the customer that there may be an issue with their billing information. The App Store
continues to retry billing for 60 days, or until the customer resolves their billing issue or
cancels their subscription, whichever comes first. For more information, see Reducing
Involuntary Subscriber Churn.
DID_RENEW
A notification type that, along with its subtype, indicates that the subscription successfully
renewed. If the subtype is BILLING_RECOVERY, the expired subscription that previously
failed to renew has successfully renewed. If the subtype is empty, the active subscription h
successfully auto-renewed for a new transaction period. Provide the customer with access to
the subscription’s content or service.
EXPIRED
A notification type that, along with its subtype, indicates that a subscription expired. If the
subtype is VOLUNTARY, the subscription expired after the customer turned off subscription
renewal. If the subtype is BILLING_RETRY, the subscription expired because the billing ret
period ended without a successful billing transaction. If the subtype is PRICE_INCREASE,
the subscription expired because the customer didn’t consent to a price increase that require
customer consent. If the subtype is PRODUCT_NOT_FOR_SALE, the subscription expired
because the product wasn’t available for purchase at the time the subscription attempted to
renew.
A notification without a subtype indicates that the subscription expired for some other reason
EXTERNAL_PURCHASE_TOKEN
A notification type that applies only to apps that use the External Purchase API to provide
alternative payment options. This notification can have a subtype of CREATED, ACTIVE
_TOKEN_REMINDER, or UNREPORTED, and includes the external purchase token information
externalPurchaseToken.
GRACE_PERIOD_EXPIRED
A notification type that indicates that the billing grace period has ended without renewing the
subscription, so you can turn off access to the service or content. Inform the customer that
there may be an issue with their billing information. The App Store continues to retry billing fo


## Page 3

60 days, or until the customer resolves their billing issue or cancels their subscription,
whichever comes first. For more information, see Reducing Involuntary Subscriber Churn.
METADATA_UPDATE
A notification type that indicates you used the Change Subscription Metadata endpoi
to change the metadata for a subscription. This notification only applies to apps that use the
Advanced Commerce API.
MIGRATION
A notification type that indicates you used the Migrate a Subscription to Advanced
Commerce API endpoint. This notification only applies to apps that use the Advanced
Commerce API.
OFFER_REDEEMED
A notification type that, along with its subtype, indicates that a customer with an active
subscription redeemed a subscription offer.
If the subtype is UPGRADE, the customer redeemed an offer to upgrade their active
subscription, which goes into effect immediately. If the subtype is DOWNGRADE, the customer
redeemed an offer to downgrade their active subscription, which goes into effect at the next
renewal date. If the customer redeemed an offer for their active subscription, you receive an
OFFER_REDEEMED notification type without a subtype.
When customers redeem an offer code for a consumable, non-consumable, or non-renewing
subscription, the notification type is ONE_TIME_CHARGE.
For more information about offer codes, see Supporting offer codes in your app. For more
information about promotional offers, see Implementing promotional offers in your app.
ONE_TIME_CHARGE
A notification type that indicates the customer purchased a consumable, non-consumable, o
non-renewing subscription. The App Store also sends this notification when the customer
receives access to a non-consumable product through Family Sharing. To determine whethe
the customer redeemed an offer, check the offerType in the decoded payload,
JWSTransactionDecodedPayload.
For notifications about auto-renewable subscription purchases, see the SUBSCRIBED
notification type.
PRICE_CHANGE
A notification type that indicates that you called the Change Subscription Price
endpoint. This notification only applies to apps that use the Advanced Commerce API.
PRICE_INCREASE


## Page 4

A notification type that, along with its subtype, indicates that the system has informed the
customer of an auto-renewable subscription price increase.
If the price increase requires customer consent, the subtype is PENDING if the customer
hasn’t responded to the price increase, or ACCEPTED if the customer has consented to the
price increase.
If the price increase doesn’t require customer consent, the subtype is ACCEPTED.
For information about how the system calls your app before it displays the price consent shee
for subscription price increases that require customer consent, see paymentQueueShould
ShowPriceConsent(_:). For information about managing subscription prices, see
Managing Price Increases for Auto-Renewable Subscriptions and Managing Prices.
REFUND
A notification type that indicates that the App Store successfully refunded a transaction for a
consumable In-App Purchase, a non-consumable In-App Purchase, an auto-renewable
subscription, or a non-renewing subscription.
The revocationDate contains the timestamp of the refunded transaction. The original
TransactionId and productId identify the original transaction and product. The
revocationReason contains the reason.
To request a list of all refunded transactions for a customer, see Get Refund History in
the App Store Server API.
REFUND_DECLINED
A notification type that indicates the App Store declined a refund request.
REFUND_REVERSED
A notification type that indicates the App Store reversed a previously granted refund due to a
dispute that the customer raised. If your app revoked content or services as a result of the
related refund, it needs to reinstate them.
This notification type can apply to any In-App Purchase type: consumable, non-consumable,
non-renewing subscription, and auto-renewable subscription. For auto-renewable
subscriptions, the renewal date remains unchanged when the App Store reverses a refund.
RENEWAL_EXTENDED
A notification type that indicates the App Store extended the subscription renewal date for a
specific subscription. You request subscription-renewal-date extensions by calling Extend a
Subscription Renewal Date or Extend Subscription Renewal Dates for All Active Subscribers i
the App Store Server API.
RENEWAL_EXTENSION


## Page 5

A notification type that, along with its subtype, indicates that the App Store is attempting to
extend the subscription renewal date that you request by calling Extend Subscription Renewa
Dates for All Active Subscribers.
If the subtype is SUMMARY, the App Store completed extending the renewal date for all eligib
subscribers. See the summary in the responseBodyV2DecodedPayload for details. If the
subtype is FAILURE, the renewal date extension didn’t succeed for a specific subscription.
See the data in the responseBodyV2DecodedPayload for details.
RESCIND_CONSENT
A notification type that indicates the parent or guardian has withdrawn consent for a child’s
app usage.
REVOKE
A notification type that indicates that an In-App Purchase the customer was entitled to throug
Family Sharing is no longer available through sharing. The App Store sends this notification
when a purchaser disables Family Sharing for their purchase, the purchaser (or family membe
leaves the family group, or the purchaser receives a refund. Your app also receives a paymen
Queue(_:didRevokeEntitlementsForProductIdentifiers:) call. Family Sharing
applies to non-consumable In-App Purchases and auto-renewable subscriptions. For more
information about Family Sharing, see Supporting Family Sharing in your app.
SUBSCRIBED
A notification type that, along with its subtype, indicates that the customer subscribed to an
auto-renewable subscription. If the subtype is RESUBSCRIBE, the customer resubscribed or
received access through Family Sharing to the same subscription or to another subscription
within the same subscription group. If the subtype is INITIAL_BUY, the customer either
purchased or received access through Family Sharing to the subscription for the first time. To
determine whether the customer redeemed an offer, check the offerType in the decoded
payload, JWSTransactionDecodedPayload.
For notifications about other product type purchases, see the ONE_TIME_CHARGE notificatio
type.
TEST
A notification type that the App Store server sends when you request it by calling the Reque
a Test Notification endpoint. Call that endpoint to test whether your server is receivin
notifications. You receive this notification only at your request. For troubleshooting informatio
see the Get Test Notification Status endpoint.
App Store Server Notifications changelog
Mentioned in


## Page 6

Enabling App Store Server Notifications
The notificationType appears in the notification payload, responseBodyV2Decoded
Payload. It describes the event that leads to the notification. Some notifications also have a
subtype that further describes the event. See the responseBodyV2DecodedPayload for mo
information about the notification in the data, summary, or externalPurchaseToken object.
When events occur that affect the customer’s In-App Purchase and subscription life cycle, the Ap
Store server sends you notifications. The following tables list the notifications by life-cycle events
Event
Notification
type
Notification
subtype
Customer purchases a consumable, non-consumable, or
non-renewing subscription.
ONE_TIME
_CHARGE
Customer redeems an offer code for a consumable, non-
consumable, or non-renewing subscription.
ONE_TIME
_CHARGE
Customer receives access to a non-consumable In-App
Purchase through Family Sharing.
ONE_TIME
_CHARGE
Events that enable service for subscriptions, including initial subscriptions, resubscribing, and
successful auto-renewals, result in the following notifications:
Event
Notification
type
Notification
subtype
Customer subscribes for the first time to any subscription
within a subscription group.
SUBSCRIBED
INITIAL_BUY
Customer resubscribes to any subscription from the same
subscription group as their expired subscription.
SUBSCRIBED
RESUBSCRIBE
The subscription successfully auto-renews.
DID_RENEW
A family member gains access to the subscription through
Family Sharing after the purchaser subscribes for the first
SUBSCRIBED
INITIAL_BUY
Discussion
Handle use cases for In-App Purchase life-cycle events


## Page 7

Event
Notification
type
Notification
subtype
time.
A family member gains access to the subscription through
Family Sharing after the purchaser resubscribes.
SUBSCRIBED
RESUBSCRIBE
Customers changing their subscription options, including upgrading, downgrading, or canceling,
result in the following notifications:
Event
Notification type
Notification
subtype
Customer downgrades a subscription within the
same subscription group.
DID_CHANGE
_RENEWAL_PREF
DOWNGRADE
Customer reverts to the previous subscription,
effectively canceling their downgrade.
DID_CHANGE
_RENEWAL_PREF
Customer upgrades a subscription within the same
subscription group.
DID_CHANGE
_RENEWAL_PREF
UPGRADE
Customer cancels the subscription from the App
Store Subscriptions settings page.
DID_CHANGE
_RENEWAL
_STATUS
AUTO_RENEW
_DISABLED
Customer subscribes again after canceling a
subscription, which reenables auto-renew.
DID_CHANGE
_RENEWAL
_STATUS
AUTO_RENEW
_ENABLED
The system turned off auto-renew because the
customer initiated a refund through your app using
the refund request API.
DID_CHANGE
_RENEWAL
_STATUS
AUTO_RENEW
_DISABLED
Customers redeeming offers, such as promotional offers, win-back offers, or offer codes result in
the following notifications:
Event
Notification
type
Notification
subtype
Customer redeems a promotional offer or offer code for
an active subscription.
OFFER
_REDEEMED


## Page 8

Event
Notification
type
Notification
subtype
Customer redeems an offer code to subscribe for the
first time.
SUBSCRIBED
INITIAL_BUY
Customer redeems a promotional offer, offer code, or
win-back offer after their subscription expired.
SUBSCRIBED
RESUBSCRIBE
Customer redeems a promotional offer or offer code to
upgrade their subscription.
OFFER
_REDEEMED
UPGRADE
Customer redeems a promotional offer and
downgrades their subscription.
OFFER
_REDEEMED
DOWNGRADE
Customer redeems an offer code for a consumable,
non-consumable, or non-recurring subscription.
ONE_TIME
_CHARGE
Billing events, including billing retries, entering and exiting the billing grace period, and expiring
subscriptions, result in the following notifications:
Event
Notification type
Notification
subtype
The subscription expires because the customer chose
to cancel it.
EXPIRED
VOLUNTARY
The subscription expires because the developer
removed the subscription from sale and the renewal
fails.
EXPIRED
PRODUCT_NOT
_FOR_SALE
The subscription expires because the billing retry
period ends without recovering the subscription.
EXPIRED
BILLING_RETRY
The subscription fails to renew and enters the billing
retry period.
DID_FAIL_TO
_RENEW
The subscription fails to renew and enters the billing
retry period with Billing Grace Period enabled.
DID_FAIL_TO
_RENEW
GRACE_PERIOD
The billing retry successfully recovers the
subscription.
DID_RENEW
BILLING
_RECOVERY


## Page 9

Event
Notification type
Notification
subtype
The subscription exits the billing grace period (and
continues in billing retry).
GRACE_PERIOD
_EXPIRED
Events or notifications that occur when you increase the price of an auto-renewable
subscription include:
Event
Notification type
Notification
subtype
The system informs the customer of the auto-renewable
subscription price increase that requires customer
consent, and the customer doesn’t respond.
PRICE_INCREASE
PENDING
The auto-renewable subscription expires because the
customer didn’t consent to the price increase that
requires consent.
EXPIRED
PRICE
_INCREASE
Customer consents to an auto-renewable subscription
price increase that requires consent.
PRICE_INCREASE
ACCEPTED
The system notifies the customer of the auto-renewable
subscription price increase that doesn’t require
customer consent.
PRICE_INCREASE
ACCEPTED
Customer canceled the subscription after receiving a
price increase notice or a request to consent to a price
increase.
DID_CHANGE
_RENEWAL
_STATUS
Customers requesting refunds or canceling Family Sharing result in the following notifications:
Event
Notification type
Notification
subtype
Apple refunds the transaction for a consumable or non-
consumable In-App Purchase, a non-renewing
subscription, or an auto-renewable subscription.
REFUND
Apple reverses a previously granted refund due to a
dispute that the customer raised.
REFUND
_REVERSED


## Page 10

Event
Notification type
Notification
subtype
Apple declines a refund that the customer initiated in the
app, using the request refund API.
REFUND
_DECLINED
Apple requests consumption information for a refund
request that a customer initiates.
CONSUMPTION
_REQUEST
A family member loses access to the subscription
through Family Sharing.
REVOKE
Developers requesting subscription-renewal-date extensions result in the following notifications:
Event
Notification type
Notification
subtype
The App Store successfully extends a subscription
renewal date for a specific subscription.
RENEWAL
_EXTENDED
The App Store successfully completes extending the
subscription renewal date for all eligible subscribers.
RENEWAL
_EXTENSION
SUMMARY
The App Store failed to extend the subscription renewal
date for a specific subscriber.
RENEWAL
_EXTENSION
FAILURE
App Store Server Notifications V2
Specify your secure server’s URL in App Store Connect to receive version 2 notifications.
object responseBodyV2
The response body the App Store sends in a version 2 server notification.
object responseBodyV2DecodedPayload
A decoded payload that contains the version 2 notification data.
type subtype
See Also
Server notifications version 2


## Page 11

A string that provides details about select notification types in version 2.


