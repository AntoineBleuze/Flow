# 004_UpcomingPayment.pdf

## Page 1

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


## Page 2

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


