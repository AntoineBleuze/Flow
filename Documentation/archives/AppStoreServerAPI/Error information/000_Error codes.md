# 000_Error codes.pdf

## Page 1

object AccountNotFoundError
An error that indicates the App Store account wasn’t found.
object AdvancedCommerceTransactionNotSupportedError
An error that indicates Advanced Commerce API transactions are not supported by the
endpoint.
object AppNotFoundError
An error that indicates the app wasn’t found.
object AppTransactionDoesNotExistError
An error response that indicates an app transaction doesn’t exist for the specified customer.
object AppTransactionIdNotSupportedError
An error that indicates the endpoint doesn’t support an app transaction ID.
object FamilySharedSubscriptionExtensionIneligibleError
An error that indicates a subscription isn’t directly eligible for a renewal date extension
because the customer obtained it through Family Sharing.
object FamilyTransactionNotSupportedError
An error that indicates the transaction is for a product the customer obtains through Family
Sharing, which the endpoint doesn’t support.
object GeneralInternalError
Topics
Errors
App Store Server API / Error codes
API Collection
Error codes
Understand the error codes that App Store Server API responses return.


## Page 2

An error that indicates a general internal error.
object GeneralBadRequestError
An error that indicates an invalid request.
object InvalidAppAccountTokenUUIDError
An error that indicates the app account token value is not a valid UUID.
object InvalidAppIdentifierError
An error that indicates an invalid app identifier.
object InvalidEmptyStorefrontCountryCodeListError
An error that indicates a required storefront country code is empty.
object InvalidExtendByDaysError
An error that indicates an invalid extend-by-days value.
object InvalidExtendReasonCodeError
An error that indicates an invalid reason code.
object InvalidOriginalTransactionIdError
An error that indicates an invalid original transaction identifier.
object InvalidRefundPreferenceError
An error that indicates an invalid refund preference value.
object InvalidRequestIdentifierError
An error that indicates an invalid request identifier.
object InvalidRequestRevisionError
An error that indicates an invalid request revision.
object InvalidRevokedError
An error that indicates the revoked parameter contains an invalid value.
object InvalidStatusError
An error that indicates the status parameter is invalid.
object InvalidStorefrontCountryCodeError
An error that indicates a storefront code is invalid.
object InvalidTransactionIdError
An error that indicates an invalid transaction identifier.


## Page 3

object OriginalTransactionIdNotFoundError
An error that indicates an original transaction identifier wasn’t found.
object RateLimitExceededError
An error that indicates the request exceeded the rate limit.
object StatusRequestNotFoundError
An error that indicates the server didn’t find a subscription-renewal-date extension request
for the request identifier and product identifier you provided.
object SubscriptionExtensionIneligibleError
An error that indicates the subscription doesn’t qualify for a renewal-date extension due to it
subscription state.
object SubscriptionMaxExtensionError
An error that indicates the subscription doesn’t qualify for a renewal-date extension because
it has already received the maximum extensions.
object TransactionIdIsNotOriginalTransactionIdError
An error that indicates the endpoint expects an original transaction identifier.
object TransactionIdNotFoundError
An error that indicates a transaction identifier wasn’t found.
object AccountNotFoundRetryableError
An error response that indicates the App Store account wasn’t found, but you can try again.
object AppNotFoundRetryableError
An error response that indicates the app wasn’t found, but you can try again.
object GeneralInternalRetryableError
An error response that indicates an unknown error occurred, but you can try again.
object OriginalTransactionIdNotFoundRetryableError
An error response that indicates the original transaction identifier wasn’t found, but you can
try again.
object ConsumptionPercentageAutoRenewableSubscriptionError
Errors to retry
Consumption request errors


## Page 4

An error that indicates the consumption percentage field is unsupported for auto-renewable
subscription transactions.
object ConsumptionPercentageOutOfRangeError
An error that indicates the consumption percentage is outside the valid range.
object InvalidAccountTenureError
An error that indicates the value of the account tenure field is invalid.
object InvalidAppAccountTokenError
An error that indicates the value of the app account token field is invalid.
object InvalidConsumptionStatusError
An error that indicates the value of the consumption status field is invalid.
object InvalidCustomerConsentedError
An error that indicates the customer consented field is invalid or doesn’t indicate that the
customer consented.
object InvalidDeliveryStatusError
An error that indicates the value in the delivery status field is invalid.
object InvalidLifetimeDollarsPurchasedError
An error that indicates the value in the lifetime dollars purchased field is invalid.
object InvalidLifetimeDollarsRefundedError
An error that indicates the value in the lifetime dollars refunded field is invalid.
object InvalidPlatformError
An error that indicates the value in the platform field is invalid.
object InvalidPlayTimeError
An error that indicates the value in the playtime field is invalid.
object InvalidSampleContentProvidedError
An error that indicates the value in the sample content provided field is invalid.
object InvalidTransactionTypeNotSupportedError
An error that indicates the transaction identifier represents an unsupported In-App Purchase
type.
object InvalidUserStatusError
An error that indicates the value in the user status field is invalid.


## Page 5

object InvalidTransactionNotConsumableError
An error that indicates the transaction identifier doesn’t represent a consumable In-App
Purchase.
Deprecated
object UndeliveredConsumptionPercentageNonZeroError
An error that indicates the consumption percentage must be zero for the provided delivery
status.
object InvalidEndDateError
An error that indicates the end date is invalid.
object InvalidNotificationTypeError
An error that indicates the notification type or subtype is invalid.
object InvalidPaginationTokenError
An error that indicates the pagination token is invalid.
object InvalidStartDateError
An error that indicates the start date is invalid.
object InvalidTestNotificationTokenError
An error that indicates the test notification token is invalid.
object InvalidInAppOwnershipTypeError
An error that indicates an invalid in-app ownership type parameter.
object InvalidProductIdError
An error that indicates the product ID parameter is invalid.
object InvalidProductTypeError
An error that indicates the product type parameter is invalid.
object InvalidSortError
An error that indicates the sort parameter is invalid.
object InvalidSubscriptionGroupIdentifierError
An error that indicates the subscription group identifier is invalid.
object MultipleFiltersSuppliedError
An error that indicates the request is invalid because it has too many applied constraints.
Notification test and history errors


## Page 6

object PaginationTokenExpiredError
An error that indicates the pagination token expired.
object ServerNotificationURLNotFoundError
An error that indicates the App Store server couldn’t find a notifications URL for your app in
the environment.
object StartDateAfterEndDateError
An error that indicates the end date precedes the start date, or the two dates are equal.
object StartDateTooFarInPastError
An error that indicates the start date is earlier than the earliest allowed date.
object TestNotificationNotFoundError
An error that indicates the test notification token is expired or the test notification status isn’
available.
object InvalidExcludeRevokedError
An error that indicates the query parameter exclude-revoked is invalid.
Deprecated


