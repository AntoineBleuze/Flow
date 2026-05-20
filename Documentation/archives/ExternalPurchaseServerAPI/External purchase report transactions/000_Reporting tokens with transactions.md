# 000_Reporting tokens with transactions.pdf

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


