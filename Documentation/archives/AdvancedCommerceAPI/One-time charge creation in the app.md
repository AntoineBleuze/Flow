# One-time charge creation in the app.pdf

## Page 1

currency
currency
(Required) The currency of the price of the product.
item
OneTimeChargeItem
(Required) The details of the product for purchase.
operation
string
(Required) The constant that represents the operation of this request.
Value: CREATE_ONE_TIME_CHARGE
requestInfo
RequestInfo
(Required) The metadata of the request.
storefront
storefront
The storefront for the transaction.
taxCode
taxCode
(Required) The tax code for this product.
version
version
(Required) The version number of the API.
Properties
Mentioned in
Advanced Commerce API / OneTimeChargeCreateRequest
Object
OneTimeChargeCreateRequest
The request data your app provides when a customer purchases a one-time-
charge product.
Advanced Commerce API 1.0+


## Page 2

Creating SKUs for the Mini Apps Partner Program
Creating SKUs for your In-App Purchases
object OneTimeChargeItem
The details of a one-time charge product, including its display name, price, SKU, and
metadata.
Example
See Also
One-time charge creation in the app
Request


## Page 3

description
description
(Required) A description of the product that doesn’t display to customers.
Maximum length: 45
displayName
displayName
(Required) The product name, suitable for display to customers.
Maximum length: 30
price
price
(Required) The price, in milliunits of the currency, of the one-time charge
product.
SKU
SKU
(Required) The product identifier.
Maximum length: 128
Creating SKUs for your In-App Purchases
Properties
Mentioned in
See Also
One-time charge creation in the app
Advanced Commerce API / OneTimeChargeItem
Object
OneTimeChargeItem
The details of a one-time charge product, including its display name, price, SKU,
and metadata.
Advanced Commerce API 1.0+


## Page 4

object OneTimeChargeCreateRequest
The request data your app provides when a customer purchases a one-time-charge product


