# 000_ApplePayError.pdf

## Page 1

Apple Pay on the Web Version 3 Release Notes
Choosing an API for Implementing Apple Pay on Your Website
Setting up the payment request API to accept Apple Pay
When you determine that there’s a problem with an address or contact information on the payme
sheet, you can use ApplePayError to create a customized error message. Apple Pay highlights
the area with an error and displays your message, making it easier for users to correct errors.
Users must resolve any errors that you report on the Apple Pay sheet before they can finalize thei
transaction.
The details you provide in an Apple Pay error include:
code — An error code that identifies the area of the error.
contactField — The specific field on the payment sheet with the error.
message — Your custom error message to display on the payment sheet.
For example, if you found an error in the postal code of the shipping address, create an ApplePa
Error with the custom message text "ZIP Code is invalid", as follows:
Mentioned in
Overview
Apple Pay on the Web / ApplePayError
Class
ApplePayError
A customizable error type that you create to indicate problems with the address o
contact information on an Apple Pay sheet.
Safari Desktop 10.0+
Safari Mobile 10.0+


## Page 2

Apple Pay highlights the postal code field and displays the message text on the payment sheet.
Note
ApplePayError requires Apple Pay API version 3 and later, and is only supported in Apple
Pay JS API; it’s not available in the Payment Request API.
ApplePayError
Creates an Apple Pay error object.
code
The error code for this instance.
contactField
The field name that contains the error on the payment sheet.
message
A localized, user-facing string that describes the error.
Topics
Creating an Apple Pay Error
Error Properties


