# 000_Setting up your project for Advanced Commerce API.pdf

## Page 1

This framework enables you to offer a large catalog of one-time purchases, subscriptions, and
bundled content while using the App Store commerce system. To request access to the API, see
the Advanced Commerce API Access form on the Advanced Commerce API page. After your app
receives access, complete the setup to start using the API in your app and on your server.
The Advanced Commerce API relies on up to four generic product identifiers that you create in Ap
Store Connect. See Setting up generic product identifiers to determine which generic product IDs
you need, and how to create them. Send the generic product identifiers to Apple using the
Advanced Commerce API Access form on the Advanced Commerce API page.
Set up your server to do the following:
Support Transport Layer Security (TLS) protocol 1.2 or later.
Receive App Store Server Notifications V2 to get up-to-date transaction data. For
setup information, see Enabling App Store Server Notifications.
Overview
Create generic product identifiers
Set up your server
Create a deep link to manage subscriptions in your app
Advanced Commerce API / Setting up your project for Advanced Commerce API
Article
Setting up your project for Advanced
Commerce API
Configure your app in App Store Connect, set up your server, and prepare your
SKUs.


## Page 2

Create a deep link into your app that opens a page for customers to manage their subscriptions.
For more information, see Setting up a link to manage subscriptions. Send the deep link to Apple
using the Advanced Commerce API Access form on the Advanced Commerce API page.
Review the tax codes you use for your SKUs from the list in Choosing tax codes for your SKUs. If
you need to request additional tax codes, send your request using the Advanced Commerce API
Access form on the Advanced Commerce API page.
Define your SKUs using the best practices for naming and design. For more information, and to
learn where the system displays the SKU data you provide, see Creating SKUs for your In-App
Purchases. For more design guidance, see Human Interface Guidelines > In-app purchase. To
define SKUs for the Mini Apps Partner Program, see Creating SKUs for the Mini Apps Partner
Program.
When you implement the Advanced Commerce API in your app and on your server, you can test in
the sandbox environment before sending it to App Review. For more information, see Testing In-
App Purchases with sandbox.
When customers make a purchase, the payment sheet displays your app icon by default. You can
optionally provide an image to use instead, in App Store Connect. To set it up, see the Add or
remove an Image topic. Set up one image for the generic product ID that represents your
subscriptions, and one for the generic product ID that represents your one-time purchases. For
more information on the payment sheet and SKU information that the system displays to
customers, see Creating SKUs for your In-App Purchases.
Setting up a link to manage subscriptions
Create a deep link to a subscription-management page for your app.
Review tax codes for your SKUs
Define and manage your SKUs
Test your app
Set up an image for the payment sheet to display
See Also
Essentials


## Page 3

Advanced Commerce API changelog
Learn about new features and updates in the Advanced Commerce API.


