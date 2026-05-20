# 002_Creating SKUs for the Mini Apps Partner Program.pdf

## Page 1

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


## Page 2

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


## Page 3

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


