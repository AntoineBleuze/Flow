# 006_MassExtendRenewalDateRequest.pdf

## Page 1

requestIdentifier
requestIdentifier
Required. A string that contains a one-time UUID value you provide to identif
this subscription-renewal-date extension request.
Maximum length: 128
extendByDays
extendByDays
Required. The number of days to extend the subscription renewal date.
Maximum: 90
extendReasonCode
extendReasonCode
Required. The reason code for the subscription-renewal-date extension.
productId
productId
Required. The product identifier of the auto-renewable subscription that you
requesting the renewal-date extension for.
storefrontCountry
Codes
storefrontCountry
Codes
A list of storefront country codes you provide to limit the storefronts that are
eligible to receive the subscription-renewal-date extension. Omit this list to
request the subscription-renewal-date extension in all storefronts.
Extending the renewal date for auto-renewable subscriptions
Properties
Mentioned in
App Store Server API / MassExtendRenewalDateRequest
Object
MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for
all eligible active subscribers.
App Store Server API 1.7+


## Page 2

This request body applies to the Extend Subscription Renewal Dates for All Activ
Subscribers endpoint.
The requestIdentifier uniquely identifies this request. Use the same requestIdentifier
in the following APIs :
The Get Status of Subscription Renewal Date Extensions endpoint
The summary object in App Store Server Notifications.
For more information, see Extending the renewal date for auto-renewable subscriptions.
type extendByDays
The number of days to extend the subscription renewal date.
type extendReasonCode
The code that represents the reason for the subscription-renewal-date extension.
type productId
The product identifier of the In-App Purchase.
type requestIdentifier
A string that contains a unique identifier you provide to track each subscription-renewal-dat
extension request.
type storefrontCountryCode
The three-letter code that represents the country or region associated with the App Store
storefront.
type storefrontCountryCodes
A list of storefront country codes you provide to limit the storefronts for a subscription-
renewal-date extension.
Discussion
Topics
Data types
See Also


## Page 3

Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.
Subscription-renewal-date extension


