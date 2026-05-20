# 003_RecurringPaymentDetails.pdf

## Page 1

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


## Page 2

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


