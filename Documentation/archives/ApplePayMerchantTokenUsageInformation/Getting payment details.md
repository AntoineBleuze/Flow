# Getting payment details.pdf

## Page 1

amount
CurrencyAmount
The reload amount when the account balance reaches the threshold amount.
Omit this property if the reload amount is variable, for example, to match a
target account balance.
thresholdAmount
CurrencyAmount
The balance an account reaches before the system applies the automatic
reload amount.
object DeferredPaymentDetails
Details about a deferred payment, such as a hotel booking or a preorder.
object PastPayment
A past payment.
object RecurringPaymentDetails
Details about a recurring payment, typically a subscription.
object UpcomingPayment
Properties
See Also
Getting payment details
Apple Pay Merchant Tok… / AutomaticReloadPaymentDetails
Object
AutomaticReloadPaymentDetails
Details about an automatic reload payment.


## Page 2

An upcoming payment.


## Page 3

amount
CurrencyAmount
The amount to be charged. Omit if the amount isn’t yet known, for example, f
mini-bar charges at a hotel.
paymentDate
date
The date, in the future, of the payment, in ISO 8601 format, with the time
ignored. Omit if the payment date isn’t yet known, for example, for goods yet
be produced.
object AutomaticReloadPaymentDetails
Details about an automatic reload payment.
object PastPayment
A past payment.
object RecurringPaymentDetails
Details about a recurring payment, typically a subscription.
object UpcomingPayment
Properties
See Also
Getting payment details
Apple Pay Merchant Tok… / DeferredPaymentDetails
Object
DeferredPaymentDetails
Details about a deferred payment, such as a hotel booking or a preorder.


## Page 4

An upcoming payment.


## Page 5

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


## Page 6

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


## Page 7

endsAfterLastPayment
boolean
A flag that indicates whether the recurring payment ends after the last
scheduled payment. The default value is false. Set value to true for
installments that include all payments of the plan in scheduledPayments.
interval
RecurringPayment
Details.Interval
(Required) The payment interval.
recurringPaymentType
string
(Required) The recurring payment’s type.
Possible Values: subscription, billing, installment, other
scheduledPayments
[RecurringPayment
Details.Scheduled
Payments]
Future occurrences of the recurring payment. For installments, include all
payments of the plan.
object RecurringPaymentDetails.Interval
The payment interval.
Properties
Topics
Dictionaries
Apple Pay Merchant Tok… / RecurringPaymentDetails
Object
RecurringPaymentDetails
Details about a recurring payment, typically a subscription.


## Page 8

object RecurringPaymentDetails.ScheduledPayments
Future occurrences of the recurring payment.
object AutomaticReloadPaymentDetails
Details about an automatic reload payment.
object DeferredPaymentDetails
Details about a deferred payment, such as a hotel booking or a preorder.
object PastPayment
A past payment.
object UpcomingPayment
An upcoming payment.
See Also
Getting payment details


## Page 9

automaticReload
PaymentDetails
AutomaticReload
PaymentDetails
The details about an automatic reload payment. Required if paymentType is
automaticReload.
deferredPayment
Details
DeferredPayment
Details
The details about a deferred payment. Required if paymentType is
deferred.
identifier
string
(Required) An opaque value that uniquely identifies the payment in the usag
information. The value isn’t displayed to the user.
imageName
string
The name of an image that represents the payment.
label
string
(Required) A short, localized description of the payment, such as the service
name.
paymentType
string
(Required) The payment’s type.
Possible Values: recurring, deferred, automaticReload
recurringPayment
Details
RecurringPayment
Details
Details about a recurring payment. Required if paymentType is recurring
Properties
Apple Pay Merchant Tok… / UpcomingPayment
Object
UpcomingPayment
An upcoming payment.


## Page 10

object AutomaticReloadPaymentDetails
Details about an automatic reload payment.
object DeferredPaymentDetails
Details about a deferred payment, such as a hotel booking or a preorder.
object PastPayment
A past payment.
object RecurringPaymentDetails
Details about a recurring payment, typically a subscription.
See Also
Getting payment details


