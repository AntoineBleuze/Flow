# Generic product IDs and SKUs.pdf

## Page 1

A generic product ID is an identifier you set up in App Store Connect and use when you call
Advanced Commerce APIs. The generic product IDs tell the API whether your SKU is a one-time
purchase or a subscription, and whether it’s a SKU for the Mini Apps Partner Program.
You may need to create up to four generic product IDs, based on the product types your app
offers:
One-time purchases
Subscriptions
One-time purchases for the Mini Apps Partner Program
Subscriptions for the Mini Apps Partner Program
Generic product IDs aren’t the same as the SKUs for products you offer in your app. Generic
product IDs only contain placeholder information for prices, localizations, and subscription period
and don’t contain tax information. You provide price, localization, and tax information for each SK
when you call the Advanced Commerce APIs. For more information about SKUs, see Creating SKU
for your In-App Purchases.
Important
Send the generic product IDs you create to Apple, using the Advanced Commerce API Access
form on the Advanced Commerce API page.
You need one of these roles: Account Holder, Admin, App Manager, Developer, or Marketing in Ap
Store Connect to add and edit product IDs. For more information, see Role permissions.
Overview
Advanced Commerce API / Setting up generic product identifiers
Article
Setting up generic product identifiers
Configure the generic product IDs in App Store Connect that the Advanced
Commerce API requires.


## Page 2

To offer one-time purchases using Advanced Commerce API, create a generic product ID in App
Store Connect, as follows:
1. Sign in to App Store Connect and select your app.
2. In the sidebar under Monetization, select In-App Purchases and click the add button (+). The
Create an In-App Purchase dialog appears.
3. Create the in-app purchase by entering the following:
Type: Consumable
Reference Name: Enabled for Advanced Commerce
Product ID: {your app bundle identifier}.aca.generic.consumable. Replace {your app bundle
identifier} with your app’s bundle ID.
4. Click Create to open the details page.
On the details page, configure the following settings:
1. Availability: Select the App Store countries or regions that your app supports. For more
information, see Set availability for In-App Purchases.
2. Pricing: Choose your base country or region and select the lowest available price.
3. Add Localization:
Localization: English (U.S.)
Display Name: Generic Consumable Product
Description: Use the same text as the display name.
To offer one-time purchases within the Mini Apps Partner Program, create a generic product ID
following the instructions for one-time purchases as described above, and enter the following
values in the respective topics within the Create an In-App Purchase dialog:
Reference Name: Enabled for Mini Apps Partner Program
Product ID: {your app bundle identifier}.aca.mini.consumable
On the details page, enter these values:
Display Name: Mini App Consumable Product
Description: Mini App Consumable Product
Create a generic product ID for one-time purchases
Create a generic product ID for one-time purchases for the
Mini Apps Partner Program


## Page 3

To offer subscriptions using Advanced Commerce API, you first need to create a dedicated
subscription group, and then create the generic product ID for a subscription.
To create a dedicated subscription group:
1. Sign in to App Store Connect and select your app.
2. In the sidebar under Monetization, click Subscriptions and click the add button (+).
3. For Reference Name, enter Group for Advanced Commerce and click create.
Next, create the generic product ID for subscriptions:
1. Select the subscription group you created.
2. Under Subscriptions, click Create.
3. Configure the subscription as follows:
Reference Name: Enabled for Advanced Commerce
Product ID: {your app bundle identifier}.aca.generic.subscription
4. Click Create to open the details page.
On the details page, configure the following settings:
Subscription Duration: 1 month
Family Sharing: Don’t enable.
Set Availability: Select the App Store countries or regions your app supports. For more
information, see Set availability for an auto-renewable subscription.
Add Subscription Price: Choose your base country or region and select the lowest available
price.
Add Localization:
Localization: English (U.S.)
Display Name: For Advanced Commerce
Description: For Advanced Commerce
To offer subscriptions within the Mini Apps Partner Program, follow the same process to create a
dedicated subscription group and subscription as above, but use the following values:
Create a generic product ID for subscriptions
Create a generic product ID for subscriptions for the Mini
Apps Partner Program


## Page 4

For the Reference Name of the dedicated subscription group, enter Group for Mini Apps Partn
Program.
For the Reference Name of the subscription, enter Enabled for Mini Apps Partner Program
subscription.
For the Product ID of the subscription, enter {your app bundle
identifier}.aca.mini.generic.subscription.
For the Display Name and Description of the localization, enter For Mini Apps Partner Program
Creating SKUs for your In-App Purchases
Define and manage one-time charges, subscriptions, and bundled subscriptions within your
app.
Creating SKUs for the Mini Apps Partner Program
Define display names and SKUs for one-time charges and subscriptions in the Mini Apps
Partner Program.
See Also
Generic product IDs and SKUs


## Page 5

For each purchase you plan to offer, create a product identifier, or SKU, in your system along with
corresponding text such as display name and price. The App Store displays this information on th
payment sheet when a customer initiates a purchase, which helps them understand the transactio
before they confirm their purchase. The App Store also uses this information in additional
communication to the customer, including in email receipts and in the Apple Account Settings
under Subscriptions.
To ensure your purchases display properly and provide a quality experience, follow these
guidelines:
Be clear, concise, and descriptive.
Use proper capitalization and punctuation, and avoid using all capitals.
Create localized information for any regions where your app is available.
Consider how you use special characters (for example, hyphens, periods, and underscores) an
diacritics. You can use special characters, but avoid using them excessively or beginning string
with them.
Don’t use markup language, emoticons, diacritics, or control characters (for example, null, new
lines, carriage returns, escape, or other invisible characters) that cause strings to exceed a
single line.
Review the Human Interface Guidelines for additional best practices for writing and designing you
in-app purchases. If you offer subscriptions, get additional best practices for clearly describing
subscriptions in your paywalls and payment sheets.
Overview
Advanced Commerce API / Creating SKUs for your In-App Purchases
Article
Creating SKUs for your In-App Purchases
Define and manage one-time charges, subscriptions, and bundled subscriptions
within your app.


## Page 6

Manage one-time purchases — such as one-time rentals, books, or courses — by using the One
TimeChargeCreateRequest API to provide information to the App Store when the customer
initiates a purchase. After a one-time charge is complete, customers receive an email receipt from
Apple.
The following details appear in the App Store payment sheet as well as your email receipt; you set
both of these values in the OneTimeChargeItem of the OneTimeChargeCreateRequest:
item.displayName: The name of the item the customer is purchasing.
item.price: The price of the item the customer is purchasing.
Create one-time charges


## Page 7

Note
You can set up an image that displays in the payment sheet instead of the app icon. For more
information, see the “Set up an image for the payment sheet to display” section in Setting up
your project for Advanced Commerce API.
Use the SubscriptionCreateRequest API to provide information to the App Store when the
customer initiates a purchase for each subscription SKU you offer. After a successful purchase,
Apple sends customers a subscription confirmation email and a receipt. Customers can go to the
Apple Account Subscription Settings to manage their subscription at any time.
Create subscriptions


## Page 8

The following details appear in the App Store payment sheet, email communications from Apple,
and the customer’s Apple Account Subscription Settings; you set the values of these details in
SubscriptionCreateRequest:
descriptors.displayName: The name of the subscription the customer is purchasing.
items.displayName: The tier of the subscription service the customer is purchasing, which
needs to be different from your descriptors.displayName. For example, if your app
includes creator subscriptions and a creator offers multiple subscription tiers, the display
Name represents the tier the customer is purchasing.
items.price: The price of the item the customer is purchasing.
period: The duration of the subscription’s billing cycle.
currency: The currency that your app uses to charge the customer.
App link: A dedicated link for customers to manage their subscription within your app. This link
appears in the customer’s Apple Account Subscription Settings as a “Manage in [Your App


## Page 9

Name]” button. For setup information, see Setting up a link to manage subscriptions. You must
also provide a way for customers to resubscribe to a subscription that has expired or has
automatic renewals turned off.
For subscription-specific services that are bundled with additional add-on content or services (al
of which auto-renews as a single subscription), create a SKU for each service or content offering
Use the SubscriptionCreateRequest API to provide information to the App Store when the
customer initiates a purchase. After a successful purchase, Apple sends customers a subscriptio
confirmation email and a receipt. Customers can go to their Apple Account Subscription Settings 
manage their subscription at any time.
Create bundled subscriptions


## Page 10

The following details appear in the App Store payment sheet, email communications from Apple,
and customer’s Subscription Settings; you set the values of these details in Subscription
CreateRequest:
descriptors.displayName: The name of the subscription SKU a customer is purchasing. This
needs to represent your overall subscription as well as be relevant for any combination of SKUs
someone might choose to bundle.
items.displayName: The name of the add-on a customer is purchasing. For example, for a
streaming app with multiple channel add-ons, this string might be “Live Sports”.
items.price: The price for each add-on within the bundled subscription purchase. When your
app or email displays multiple bundle items, it sorts them from highest to lowest price.
period: The duration of the subscription’s billing cycle.
currency: The currency that your app uses to charge the customer.
App link: A dedicated link for customers to manage their subscription within your app. This link
appears in the customer’s Apple Account Subscription Settings as a “Manage in [Your App
Name]” button. For setup information, see Setting up a link to manage subscriptions. You must
also provide a way for customers to resubscribe to a subscription that has expired or has
automatic renewals turned off.


## Page 11

Setting up generic product identifiers
Configure the generic product IDs in App Store Connect that the Advanced Commerce API
requires.
Creating SKUs for the Mini Apps Partner Program
Define display names and SKUs for one-time charges and subscriptions in the Mini Apps
Partner Program.
See Also
Generic product IDs and SKUs


## Page 12

If your app supports the Mini Apps Partner Program, use the Advanced Commerce APIs when a
customer initiates a one-time purchase (OneTimeChargeCreateRequest), or purchases a
subscription (SubscriptionCreateRequest).
The Mini Apps Partner Program has specific requirements for defining the SKUs and the product
display names, so they fully identify each mini app product. Follow these guidelines to create
display names and SKUs for products you offer through the Mini Apps Partner Program and
describe the format for one-time purchases and subscriptions. See Creating SKUs for your In-Ap
Purchases for additional guidance.
The following table lists the identifiers that make up mini app display names and SKUs.
Identifier
Description
Example
[Mini App Name]
The name of the mini app
Anne’s Game
[Mini App Product
Name]
The name of the product associated
with the mini app
Boost Pack or Pro
Monthly
[Mini App Partner
Name]
The name of the mini app partner
Apple_Seed
Overview
Describe the mini app and mini apps partner with
metadata
Advanced Commerce API / Creating SKUs for the Mini Apps Partner Program
Article
Creating SKUs for the Mini Apps Partner
Program
Define display names and SKUs for one-time charges and subscriptions in the Mi
Apps Partner Program.


## Page 13

Identifier
Description
Example
[Mini App Partner
ID]
The unique identifier you set for the
mini app partner
WC123
[Mini App SKU
Identifier]
The unique identifier you set for the
Mini App Product
boost_pack_id, pro
_monthly_id
You determine the names and concatenate them to create the display names and SKUs, as
specified in the one-time or subscription purchase instructions below, when you use the Advance
Commerce APIs to initiate purchases.
To initiate a one-time charge for a mini app product, use the OneTimeChargeCreateRequest.
Create the mini app display name using the format [Mini App Name] - [Mini App Produc
Name]. Using the sample values from the table above, item.displayName would look like the
following example:
The display name can use a maximum of 30 characters.
The two elements are separated by the ‘-’ character, with a single space on either side of the ‘-
character.
Create the item.SKU using the format [Mini App SKU Identifier]|[Mini App Partne
Name]|[Mini App Partner ID]
Using the sample values from the table above, the items.SKU would look like the following
example:
The SKU value needs to be unique within your app and can use a maximum of 128 characters.
All three elements are separated by the ‘|’ character and all three elements must be present.
To initiate a subscription purchase, use the SubscriptionCreateRequest API.
Initiate a one-time charge purchase
Initiate a subscription purchase


## Page 14

Create the display name and SKU in SubscriptionCreateItem to include the specified details
and ensure it conforms to the indicated formatting and length limitations.
The mini app’s display name can use a maximum of 30 characters, and follows this format:
descriptors.displayName = [Mini App Name], for example
The product display name can use a maximum of 30 characters and follow this format: items
.displayName = [Mini App Product Name], for example
The SKU value needs to be unique within your app and can use a maximum of 128 characters and
follows this format: items.SKU = [Mini App SKU Identifier]|[Mini App Partner
Name]|[Mini App Partner ID], for example
All three elements are separated by the ‘|’ character and all three elements must be present.
Setting up generic product identifiers
Configure the generic product IDs in App Store Connect that the Advanced Commerce API
requires.
Creating SKUs for your In-App Purchases
Define and manage one-time charges, subscriptions, and bundled subscriptions within your
app.
See Also
Generic product IDs and SKUs


