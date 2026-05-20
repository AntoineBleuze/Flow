# Apple Pay JavaScript APIs.pdf

## Page 1

Safari supports two APIs for implementing payment requests: Apple Pay JS API, and the W3C
Payment Request API. Both APIs present the same Apple Pay payment sheet on Safari, and offer
nearly the same user experience.
To help you decide which API to implement, or whether to implement both, first determine which
features your solution requires, and choose the API that matches your needs.
Use Apple Pay JS API if you depend on any of its unique features:
Granular error handling. You can provide robust error handling:
Customizable error messages and field indications create a better user experience. See Apple
PayError for more information.
You can report errors the user can correct, even after the user authorizes payment.
You can retry if an error occurs after the user authorizes payment. With Payment Request API,
the user must restart their transaction.
Integration for store cards and cobranded debit/credit cards. When customers with affiliated
cards visit your website, you can provide these additional benefits:
Apple Pay can automatically select the affiliated card instead of the customer’s default card.
You can adjust prices or other terms of a sale for customers using your affiliated card. For
example, you might provide free shipping when customers use your cobranded VISA credit car
Overview
Features of Apple Pay JS API
Apple Pay on the Web / Choosing an API for Implementing Apple Pay on Your Website
Article
Choosing an API for Implementing Apple
Pay on Your Website
Compare Apple Pay JS and Payment Request API to choose the right
implementation for your website.


## Page 2

Phonetic names. You can request a phonetic name in Apple Pay JS API only.
Use Payment Request API for these benefits:
Cross-browser solution. Payment Request API-based code can support a variety platforms an
browsers. Apple Pay is available on Safari; other payment methods are available on other
browsers and platforms.
W3C standard candidate API. The Payment Request API is defined by the World Wide Web
Consortium (W3C).
To better reach your customers, choose an API that works on their devices, as follows:
Apple Pay JS API: Supported in iOS 10 and later, and macOS 10.12 and later.
Payment Request API: Supported in iOS 11.3 and later, and Safari 11.1 on macOS 10.12 and late
When implementing Payment Request API, consider also implementing Apple Pay JS API as a
fallback for customers whose devices run an older operating system version.
The same first steps, configurations, and guidelines for using Apple Pay on the web apply
regardless of which API you choose to implement.
For more information, see Apple Pay setup, Apple Pay buttons, and for design guidance see Hum
Interface Guidelines > Apple Pay on the Web.
Apple Pay on the Web version history
Learn about features in each version of Apple Pay on the Web.
Apple Pay JS API
Implement Apple Pay on the web using Apple’s JavaScript API.
Payment Request API
Features of Payment Request API
Choose an API to Support Your Customers
Requirements for Both APIs
See Also
Apple Pay JavaScript APIs


## Page 3

Accept payments on your website with Apple Pay using the Payment Request API.


## Page 4

Specify the Apple Pay version your website supports when you create a session by calling Apple
PaySession or by creating an ApplePayRequest. Keep in mind that customers using Apple Pa
may be running any version of Apple Pay. The operating system of the customer’s device
determines the version of Apple Pay that it runs. To support all customers, make sure your app
works properly with all Apple Pay versions. See supportsVersion for more information.
Apple Pay version numbers apply to both Apple Pay JS API and Payment Request API.
Apple Pay on the Web Version 14 Release Notes
The version of Apple Pay available in macOS 13 and iOS 16.
Apple Pay on the Web Version 13 Release Notes
The version of Apple Pay available in macOS 12.3 and iOS 15.4.
Apple Pay on the Web Version 12 Release Notes
The version of Apple Pay available in macOS 12 and iOS 15.
Apple Pay on the Web Version 11 Release Notes
The version of Apple Pay available in macOS 11.5 and iOS 14.5.
Apple Pay on the Web Version 10 Release Notes
The version of Apple Pay available in macOS 11 and iOS 14.
Overview
Topics
Apple Pay Version
Apple Pay on the Web / Apple Pay on the Web version history
Apple Pay on the Web version history
Learn about features in each version of Apple Pay on the Web.


## Page 5

Apple Pay on the Web Version 9 Release Notes
The version of Apple Pay available in macOS 10.15.6 and iOS 13.6.
Apple Pay on the Web Version 8 Release Notes
The version of Apple Pay available in macOS 10.15.1 and iOS 13.2.
Apple Pay on the Web Version 7 Release Notes
The version of Apple Pay available in macOS 10.14.6 and iOS 12.4.
Apple Pay on the Web Version 6 Release Notes
The version of Apple Pay available in macOS 10.14.4 and iOS 12.2.
Apple Pay on the Web Version 5 Release Notes
The version of Apple Pay available in macOS 10.14.2 and iOS 12.1.1.
Apple Pay on the Web Version 4 Release Notes
The version of Apple Pay available in macOS 10.14.1 and iOS 12.1.
Apple Pay on the Web Version 3 Release Notes
The version of Apple Pay available in macOS 10.13 and iOS 11.
Apple Pay on the Web Version 2 Release Notes
The version of Apple Pay available in macOS 10.12.1 and iOS 10.1.
Apple Pay on the Web Version 1 Release Notes
The version of Apple Pay available in macOS 10.12 and iOS 10.
Choosing an API for Implementing Apple Pay on Your Website
Compare Apple Pay JS and Payment Request API to choose the right implementation for you
website.
Apple Pay JS API
Implement Apple Pay on the web using Apple’s JavaScript API.
Payment Request API
See Also
Apple Pay JavaScript APIs


## Page 6

Accept payments on your website with Apple Pay using the Payment Request API.


## Page 7

Checking for Apple Pay availability
Use the Apple Pay JS API to check whether Apple Pay is available, to check whether a device
has a payment credential provisioned in Wallet, and to determine when to display an Apple
Pay button.
canMakePayments
Indicates whether the device supports Apple Pay.
applePayCapabilities
Indicates whether the device supports Apple Pay and whether the person has an active card
in Wallet that qualifies for web payments.
canMakePaymentsWithActiveCard
Indicates whether the device supports Apple Pay and whether the user has an active card in
Wallet.
Deprecated
PaymentCredentialStatus
Information about whether the device supports Apple Pay and the possible payment
credentials the person has provisioned in Wallet.
PaymentCredentialStatusResponse
The response for information about the device’s support for Apple Pay and the payment
credential status.
Topics
Apple Pay availability
Apple Pay on the Web / Apple Pay JS API
API Collection
Apple Pay JS API
Implement Apple Pay on the web using Apple’s JavaScript API.


## Page 8

ApplePayPaymentRequest
A request for payment, which includes information about payment-processing capabilities, t
payment amount, and shipping information.
ApplePayDeferredPaymentRequest
A dictionary that represents a request to set up a deferred payment, such as a hotel booking
or a pre-order.
Creating an Apple Pay Session
Provide a payment request and create the session.
Providing Merchant Validation
Validate your merchant identity and receive a session object for each payment request.
Requesting an Apple Pay payment session
Request a valid session from the Apple Pay server.
ApplePaySession
A session object for managing the payment process on the web.
ApplePayError
A customizable error type that you create to indicate problems with the address or contact
information on an Apple Pay sheet.
ApplePayErrorCode
The error code that indicates whether an error on the payment sheet is for shipping or billing
information, or for another kind of error.
ApplePayErrorContactField
Names of the fields in the shipping or billing contact information, used to locate errors in the
payment sheet.
Apple Pay Status Codes
Apple Pay payment request
Apple Pay session
Status and errors


## Page 9

Codes used to report the status of an Apple Pay session after a callback.
Choosing an API for Implementing Apple Pay on Your Website
Compare Apple Pay JS and Payment Request API to choose the right implementation for you
website.
Apple Pay on the Web version history
Learn about features in each version of Apple Pay on the Web.
Payment Request API
Accept payments on your website with Apple Pay using the Payment Request API.
See Also
Apple Pay JavaScript APIs


## Page 10

The Payment Request API is a cross-browser payment API under development by the W3C. You
can use the Payment Request API to accept various payment methods in exchange for physical o
digital goods on your website. Payment methods include payment solutions the platform provides
such as Apple Pay. For more information on the Payment Request API, see the W3C Payment
Request API specification.
Setting up the payment request API to accept Apple Pay
Support payments using Apple Pay on your website.
ApplePayRequestBase
A dictionary that defines basic payment and contact information that the Apple Pay payment
request object uses for the W3C Payment Request API.
ApplePayRequest
A dictionary that defines the Apple Pay payment request object to use for the W3C Payment
Request API.
ApplePayModifier
A dictionary that defines the Apple Pay modifiers for a payment type in the W3C Payment
Request API.
Overview
Topics
Payment request
Apple Pay on the Web / Payment Request API
API Collection
Payment Request API
Accept payments on your website with Apple Pay using the Payment Request AP


## Page 11

ApplePayPaymentCompleteDetails
Choosing an API for Implementing Apple Pay on Your Website
Compare Apple Pay JS and Payment Request API to choose the right implementation for you
website.
Apple Pay on the Web version history
Learn about features in each version of Apple Pay on the Web.
Apple Pay JS API
Implement Apple Pay on the web using Apple’s JavaScript API.
See Also
Apple Pay JavaScript APIs


