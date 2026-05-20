# External purchase report transactions.pdf

## Page 1

If your app uses External Purchase, you’re required to report all tokens and associated transaction
according to the Commission, transaction reports, and payments section of the article Using
alternative payment options on the App Store in the European Union.
To send a report, call the Send External Purchase Report endpoint for each token you
receive. A report has a request body, ExternalPurchaseReport, which consists of a unique
report identifier, the token identifier, a status, and depending on the status, an array of line items
that describe the transactions.
When a token has associated transactions, send a report with line items. To correct a previous
submission, see Reporting corrections. If the token didn’t result in any transactions, see Reporting
unrecognized and transactionless tokens instead.
For each transaction, add one line item to the line items array in your report. Choose the line item
type based on the transaction type:
OneTimeBuyLineItem — for one-time charges
SubscriptionBuyLineItem - for transactions and events that involve subscriptions
RefundLineItem — for refunds
Use a OneTimeBuyLineItem object to specify a one-time charge in the lineItems array of th
ExternalPurchaseReport.
The following example is an external purchase report with a single one-time charge transaction:
Overview
Create line items for one-time charges
External Purchase Serve… / Reporting tokens with transactions
Article
Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions
including one-time charges, subscriptions and renewals, and refunds.


## Page 2

Use a SubscriptionBuyLineItem object to specify a subscription-related transaction or even
in the lineItems array of the ExternalPurchaseReport. The subscription events to report
include subscription starts, renewals, changes to the subscription, and payments. Report
subscription events even if they don’t include a payment. For more information, see
subscriptionEvent.
The following example is an external purchase report for an initial subscription purchase:
Create line items for subscription events and transactions


## Page 3

The following example is an external purchase report for a subscription renewal:
Create line items for refunds


## Page 4

Use a RefundLineItem object to specify a refund transaction in the lineItems array of the
ExternalPurchaseReport. Refunds include a referenceLineItemId that contains the
lineItemId of a previously submitted transaction, to which the refund applies.
The following example is an external purchase report for a partial refund of the one-time charge
shown in an earlier example:
Use the REFUND value for eventType to report chargebacks as well.
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a successfully
submitted transaction.
object OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
object RefundLineItem
The line item that indicates a refund transaction.
See Also
External purchase report transactions


## Page 5

object SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
Line item fields
Properties that describe a single transaction or correction in an external purchase report.


## Page 6

If you successfully submit a report to the Send External Purchase Report endpoint that y
later find to be incorrect, you must correct your submission. To send a correction, fill out the
ExternalPurchaseReport request body with a new requestIdentifier and the
corrections, and call the Send External Purchase Report endpoint. Send corrected report
promptly.
There are two types of corrections:
A correction to transaction data in a line item. In this type of correction, you restate the entire
line item with corrected data. Apple uses only the most recent submission for the line item.
A retraction of a line item you previously sent. In this type of correction, you indicate that you
erroneously sent the line item, and aren’t including the erroneously-submitted amounts in
transaction calculations. Be sure to update the netAmountTaxExclusive field so it
represents the correct net amount, tax exclusive, of the transaction.
Important
The netAmountTaxExclusive must represent the correct net amount (excluding taxes) for
the transaction, including in line items that are corrections.
To submit a line item with corrections, use the line item’s original lineItemId and include the
restatement flag set to true. Make corrections to any type of line item: OneTimeBuyLine
Item, SubscriptionBuyLineItem, and RefundLineItem.
Overview
Correct data in a line item
External Purchase Serve… / Reporting corrections
Article
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a
successfully submitted transaction.


## Page 7

Important
Restated line items overwrite the originally reported line item. Include all the data in the line
item — even fields that are the same as the previous version.
Apple uses only the most recent version of the line item.
If you submitted a line item in error and want Apple to ignore it, use the same lineItemId as in
the original submission. Set both the restatement and erroneouslySubmitted fields to
true. (You may undo this action by submitting the line item again, with restatement set to
true, and erroneouslySubmitted set to false.) Be sure to include all of the original line item
data fields, and recalculate the netAmountTaxExclusive field to correctly represent the net
amount with the erroneously submitted line item accounted for.
Successfully submitting a line item with the erroneouslySubmitted flag is an effective “undo
of the original line item.
Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions, including
one-time charges, subscriptions and renewals, and refunds.
object OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
object RefundLineItem
The line item that indicates a refund transaction.
object SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
Line item fields
Properties that describe a single transaction or correction in an external purchase report.
Retract an erroneously submitted line item
See Also
External purchase report transactions


## Page 8



## Page 9

lineItemId
lineItemId
(Required) A unique identifier for the transaction, that you determine. The
value must be unique per app. Using UUIDs is recommended. Reuse a line
ItemId only to submit a restatement for a previously submitted line item.
creationDate
creationDate
(Required) The UNIX date, in milliseconds, that the customer authorized the
purchase.
restatement
restatement
Set to true to indicate that this line item is correcting (restating) a line item
that you previously submitted. For more information, see Reporting correctio
Default: false
erroneouslySubmitted
erroneouslySubmitted
Set to true to indicate that you previously submitted the line item erroneous
Set the restatement field to true also. For more information, see Reportin
corrections.
Default: false
pricingCurrency
pricingCurrency
(Required) The currency the transaction used to charge the customer. For
more information, see pricingCurrency.
reportingCurrency
reportingCurrency
(Required) The currency you use to report all the amount fields, including
amountTaxExclusive, amountTaxInclusive, netAmountTax
Exclusive, and taxAmount. For more information, see reporting
Currency.
Properties
External Purchase Serve… / OneTimeBuyLineItem
Object
OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
External Purchase Server API 1.0.0+


## Page 10

exchangeRate
exchangeRate
The exchange rate you use to calculate the amounts, from the pricing currenc
to the reporting currency, if the customer is billed in an unsupported currency
For more information, see exchangeRate.
amountTaxExclusive
amountTaxExclusive
(Required) The amount that the customer paid, excluding taxes, that you sta
in milli-units of the reporting currency. For more information, see amountTax
Exclusive.
amountTaxInclusive
amountTaxInclusive
(Required) The amount that the customer paid, including taxes, that you stat
in milli-units of the reporting currency. For more information, see amountTax
Inclusive.
netAmountTax
Exclusive
netAmountTax
Exclusive
(Required) The net amount the customer was charged, accurate to the curre
report, that you state in milli-units of the reporting currency. This amount
excludes tax, and accounts for all refunds and restatements. For more
information, see netAmountTaxExclusive.
taxAmount
taxAmount
(Required) The amount the customer paid in taxes, that you state in milli-uni
of the reporting currency. For more information, see taxAmount.
taxCountry
taxCountry
(Required) The country code of the country for which taxes were paid on the
purchase. For more information, see taxCountry.
productIdentifier
productIdentifier
(Required) A string that uniquely identifies the product.
quantity
quantity
(Required) The quantity of the product the customer purchased.
eventType
eventType
(Required) Use BUY. (To report refunds or subscription-related transactions
use RefundLineItem or SubscriptionBuyLineItem line items instead
productType
productType
(Required) Use ONE_TIME_BUY. (To report a subscription-related transactio
use a SubscriptionBuyLineItem instead.)
Reporting tokens with transactions
Reporting corrections
Use a OneTimeBuyLineItem to report a one-time charge transaction, or a correction to a one-
time charge transaction that you previously submitted.
Mentioned in
Discussion


## Page 11

Each line-item object represents one transaction. Other types of line-item objects include:
SubscriptionBuyLineItem, for reporting subscription-related transactions
RefundLineItem, for reporting refunds
Include the line-item objects in the lineItems array of an ExternalPurchaseReport object.
To send the report, include the ExternalPurchaseReport object in a request to the Send
External Purchase Report endpoint.
For more information, see Reporting tokens with transactions and Reporting corrections.
Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions, including
one-time charges, subscriptions and renewals, and refunds.
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a successfully
submitted transaction.
object RefundLineItem
The line item that indicates a refund transaction.
object SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
Line item fields
Properties that describe a single transaction or correction in an external purchase report.
See Also
External purchase report transactions


## Page 12

lineItemId
lineItemId
(Required) A unique identifier for the transaction, that you determine. The
value must be unique per app. Using UUIDs is recommended. Reuse a line
ItemId only to submit a correction for a previously submitted line item.
referenceLineItemId
referenceLineItemId
(Required) The lineItemId of the initial purchase transaction that receive
refund.
creationDate
creationDate
(Required) The UNIX date, in milliseconds, you completed the transaction.
restatement
restatement
Set to true to indicate that this line item is correcting (restating) a refund lin
item that you previously submitted. For more information, see Reporting
corrections.
Default: false
erroneouslySubmitted
erroneouslySubmitted
Set to true to indicate that you previously submitted the line item in error. Se
the restatement field to true also. For more information, see Reporting
corrections.
Default: false
pricingCurrency
pricingCurrency
(Required) The currency the transaction used to charge or refund the
customer. For more information, see pricingCurrency.
reportingCurrency
reportingCurrency
(Required) The currency you use to report all the amount fields, including
amountTaxExclusive, amountTaxInclusive, netAmountTax
Properties
External Purchase Serve… / RefundLineItem
Object
RefundLineItem
The line item that indicates a refund transaction.
External Purchase Server API 1.0.0+


## Page 13

Exclusive, and taxAmount. For more information, see reporting
Currency.
exchangeRate
exchangeRate
The exchange rate you use to calculate the amounts, from the pricing currenc
to the reporting currency, if the customer is billed in an unsupported currency
For more information, see exchangeRate.
amountTaxExclusive
amountTaxExclusive
(Required) The amount that the customer paid, excluding taxes, that you sta
in milli-units of the reporting currency. For more information, see amountTax
Exclusive.
amountTaxInclusive
amountTaxInclusive
(Required) The amount that the customer paid, including taxes, that you stat
in milli-units of the reporting currency. For more information, see amountTax
Inclusive.
netAmountTax
Exclusive
netAmountTax
Exclusive
(Required) The net amount the customer was charged, accurate to the curre
line item, that you state in milli-units of the reporting currency. This amount
excludes tax, and accounts for all refunds and restatements. For more
information, see netAmountTaxExclusive.
taxAmount
taxAmount
(Required) The amount the customer paid in taxes, that you state in milli-uni
of the reporting currency. For more information, see taxAmount.
taxCountry
taxCountry
(Required) The country code of the country for which taxes were paid on the
purchase. For more information, see taxCountry.
eventType
eventType
(Required) Use REFUND.
Reporting tokens with transactions
Reporting corrections
Use a RefundLineItem to report either:
A refund for a purchase transaction you previously submitted, or
A correction to a refund you previously submitted
For more information about sending a report that includes refund line items, see Reporting tokens
with transactions.
Report chargebacks as a refund.
Mentioned in
Discussion


## Page 14

Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions, including
one-time charges, subscriptions and renewals, and refunds.
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a successfully
submitted transaction.
object OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
object SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
Line item fields
Properties that describe a single transaction or correction in an external purchase report.
See Also
External purchase report transactions


## Page 15

lineItemId
lineItemId
(Required) A unique identifier for the transaction, that you determine. The
value must be unique per app. Using UUIDs is recommended. Reuse a line
ItemId only to submit a correction for a previously submitted line item.
referenceLineItemId
referenceLineItemId
The lineItemId of initial purchase transaction for the subscription.
creationDate
creationDate
(Required) The UNIX date, in milliseconds, that the customer authorized the
purchase.
restatement
restatement
Set to true to indicate that this line item is correcting (restating) a line item
that you previously submitted. For more information, see Reporting correctio
Default: false
erroneouslySubmitted
erroneouslySubmitted
Set to true to indicate that you previously submitted the line item erroneous
Set the restatement field to true also. For more information, see Reportin
corrections.
Default: false
subscriptionEvent
subscriptionEvent
(Required) The subscription event the transaction represents, including a
subscription start, a renewal, a change, or a payment. For more information,
see subscriptionEvent.
subscriptionStart
Date
(Required) The UNIX date, in milliseconds, of the start of the subscription
renewal period.
Properties
External Purchase Serve… / SubscriptionBuyLineItem
Object
SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
External Purchase Server API 1.0.0+


## Page 16

subscriptionStart
Date
subscriptionEndDate
subscriptionEndDate
(Required) The UNIX date, in milliseconds, of the end of the subscription
renewal period.
subscriptionDaysOf
PaidService
subscriptionDaysOf
PaidService
(Required) The total number of days of paid service for the subscription. For
more information, see subscriptionDaysOfPaidService.
pricingCurrency
pricingCurrency
(Required) The currency the transaction used to charge the customer. For
more information, see pricingCurrency.
reportingCurrency
reportingCurrency
(Required) The currency you use to report all the amount fields, including
amountTaxExclusive, amountTaxInclusive, netAmountTax
Exclusive, and taxAmount. For more information, see reporting
Currency.
exchangeRate
exchangeRate
The exchange rate you use to calculate the amounts, from the pricing currenc
to the reporting currency, if the customer is billed in an unsupported currency
For more information, see exchangeRate.
amountTaxExclusive
amountTaxExclusive
(Required) The amount that the customer paid, excluding taxes, that you sta
in milli-units of the reporting currency. For more information, see amountTax
Exclusive.
amountTaxInclusive
amountTaxInclusive
(Required) The amount that the customer paid, including taxes, that you stat
in milli-units of the reporting currency. For more information, see amountTax
Inclusive.
netAmountTax
Exclusive
netAmountTax
Exclusive
(Required) The net amount the customer was charged, accurate to the curre
line item, that you state in milli-units of the reporting currency. This amount
excludes tax, and accounts for all refunds and restatements. For more
information, see netAmountTaxExclusive.
taxAmount
taxAmount
(Required) The amount the customer paid in taxes, that you state in milli-uni
of the reporting currency. For more information, see taxAmount.
taxCountry
taxCountry
(Required) The country code of the country for which taxes were paid on the
purchase. For more information, see taxCountry.
productIdentifier
productIdentifier
(Required) A string that uniquely identifies the subscription product.
quantity
quantity
(Required) The quantity of the product the customer purchased. For more
information, see quantity.


## Page 17

eventType
eventType
(Required) Use BUY. (To report a refund, use a RefundLineItem line item
instead.)
productType
productType
(Required) Use SUBSCRIPTION. (To report a one-time charge transaction,
use a OneTimeBuyLineItem instead.)
Reporting tokens with transactions
Reporting corrections
Use a SubscriptionBuyLineItem to report a subscription-related transaction or event, or a
correction to the same.
Each line-item object represents one transaction. Other types of line-item objects include:
OneTimeBuyLineItem, for reporting a one-time charge
RefundLineItem, for reporting refunds
Include the line-item objects in the lineItems array of an ExternalPurchaseReport object.
To send the report, include the ExternalPurchaseReport object in a request to the Send
External Purchase Report endpoint.
Note
Identify a subscription using the lineItemId of the original subscription-start transaction. A
line item for a subscription start has an eventType of BUY and a subscriptionEvent of
SUBSCRIPTION_START.
For example, to report a renewal for a subscription, set the renewal transaction’s referenceLin
ItemId to the lineItemId of the subscription-start line item, and set the subscriptionEven
to RENEWAL.
For more information, see Reporting tokens with transactions and Reporting corrections.
Mentioned in
Discussion
See Also
External purchase report transactions


## Page 18

Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions, including
one-time charges, subscriptions and renewals, and refunds.
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a successfully
submitted transaction.
object OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
object RefundLineItem
The line item that indicates a refund transaction.
Line item fields
Properties that describe a single transaction or correction in an external purchase report.


## Page 19

type lineItemId
A unique identifier for the line item, that you determine.
type creationDate
The UNIX date, in milliseconds, that the customer authorized the transaction.
type eventType
The type of transaction the line item reports, whether it’s a buy or refund.
type referenceLineItemId
The line item identifier of another transaction, that the report references.
type productIdentifier
A string that identifies the product.
type productType
The type of product in the transaction, whether it’s a one-time buy, or a subscription.
Topics
Identifying the line item
Providing transaction info
Providing product info
External Purchase Serve… / Line item fields
API Collection
Line item fields
Properties that describe a single transaction or correction in an external purchase
report.


## Page 20

type quantity
The quantity of the product the customer purchased in a single transaction.
type amountTaxExclusive
The amount, in milli-units, that the customer paid or was refunded, excluding taxes.
type amountTaxInclusive
The amount, in milli-units, that the customer paid, including taxes.
type netAmountTaxExclusive
The net amount, in milli-units, that you charged the customer, pre-tax, and after deducting a
refunds.
type taxAmount
The amount, in milli-units, that the customer paid in taxes.
type taxCountry
The three-letter country code of the country that collects the taxes for the transaction.
type pricingCurrency
The currency used in the transaction to bill or refund the customer.
type reportingCurrency
The currency the line item uses to report all amount values.
type exchangeRate
A decimal value that is the exchange rate you use to convert the pricing currency to the
reporting currency, when the two currencies differ.
type subscriptionDaysOfPaidService
The total number of days of paid service for the subscription.
type subscriptionEndDate
The UNIX date, in milli-seconds, the subscription renewal cycle ends.
type subscriptionEvent
The event in the subscription’s life cycle that the transaction represents.
Specifying amounts and currency
Supplying subscription info


## Page 21

type subscriptionStartDate
The UNIX date, in milli-seconds, of the start of the subscription renewal period.
type referenceLineItemId
The line item identifier of another transaction, that the report references.
type erroneouslySubmitted
A Boolean value that indicates whether a line item was submitted in error.
type restatement
A Boolean value that indicates a line item contains a correction.
Reporting tokens with transactions
Create reports for external purchase tokens that result in completed transactions, including
one-time charges, subscriptions and renewals, and refunds.
Reporting corrections
Submit a report with corrections if you find errors in, or have adjustments to, a successfully
submitted transaction.
object OneTimeBuyLineItem
The line item that indicates a one-time charge transaction.
object RefundLineItem
The line item that indicates a refund transaction.
object SubscriptionBuyLineItem
The line item that indicates a subscription-related event or transaction.
Submitting corrections
See Also
External purchase report transactions


