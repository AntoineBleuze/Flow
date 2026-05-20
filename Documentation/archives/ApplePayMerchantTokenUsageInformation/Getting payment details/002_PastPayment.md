# 002_PastPayment.pdf

## Page 1

identifier
string
(Required) An opaque value that uniquely identifies this payment in the usag
information. The value isn’t displayed to the user.
lineItems
[PastPayment.Line
Items]
The goods or services paid for.
paymentDate
string
(Required) The date, in the past, of the payment, in ISO 8601 format; time is
optional.
summaryItems
[PastPayment.Summary
Items]
Items that summarize the total amount, such as taxes or shipping cost.
totalAmount
CurrencyAmount
(Required) The total amount of the payment.
object PastPayment.LineItems
Properties
Topics
Dictionaries
Apple Pay Merchant Tok… / PastPayment
Object
PastPayment
A past payment.


## Page 2

The goods or services paid for.
object PastPayment.SummaryItems
Items that summarize the total amount, such as taxes or shipping cost.
object AutomaticReloadPaymentDetails
Details about an automatic reload payment.
object DeferredPaymentDetails
Details about a deferred payment, such as a hotel booking or a preorder.
object RecurringPaymentDetails
Details about a recurring payment, typically a subscription.
object UpcomingPayment
An upcoming payment.
See Also
Getting payment details


