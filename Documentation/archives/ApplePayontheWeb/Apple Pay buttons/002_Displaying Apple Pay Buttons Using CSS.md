# 002_Displaying Apple Pay Buttons Using CSS.pdf

## Page 1

Apple Pay provides a variety of Apple Pay buttons that you can use on your website to initiate a
transaction. You can specify which button type to display and edit its appearance and size to fit
your webpage. Before using a button, check if it’s available in the version of Safari the device is
running. To draw Apple Pay buttons on devices with earlier iOS or macOS versions where Safari
doesn’t support all button types, see Draw Apple Pay Buttons.
Choose an Apple Pay button that best fits with the terminology and flow of your application.
Specify the type of Apple Pay button to display by setting the -apple-pay-button-type
property to one of the Apple Pay button values.
The following Apple Pay button values are available starting with Apple Pay on the Web version 2:
buy
A button with the text “Buy with” and the Apple Pay logo.
donate
A button with the text “Donate with” and the Apple Pay logo. Available in iOS 10.2 and later.
plain
A button with the Apple Pay logo only.
set-up
A button prompting the user to set up a card. See openPaymentSetup for an example of
code to display the Set up Apple Pay button.
The following Apple Pay button values are available starting with Apple Pay on the Web version 4:
book
A button with the text “Book with” and the Apple Pay logo.
check-out
Overview
Choose a Button Type
Apple Pay on the Web / Displaying Apple Pay Buttons Using CSS
Displaying Apple Pay Buttons Using CSS
Use CSS templates to display Apple Pay buttons in Safari.


## Page 2

A button with the text “Check out with” and the Apple Pay logo.
subscribe
A button with the text “Subscribe with” and the Apple Pay logo.
The following Apple Pay button values are available starting with Apple Pay on the Web version 10
add-money
A button with the text “Add money with” and the Apple Pay logo.
contribute
A button with the text “Contribute with” and the Apple Pay logo.
order
A button with the text “Order with” and the Apple Pay logo.
reload
A button with the text “Reload with” and the Apple Pay logo.
rent
A button with the text “Rent with” and the Apple Pay logo.
support
A button with the text “Support with” and the Apple Pay logo.
tip
A button with the text “Tip with” and the Apple Pay logo.
top-up
A button with the text “Top Up with” and the Apple Pay logo.
The following Apple Pay button values are available starting with Apple Pay on the Web version 12
continue
A button with the text “Continue with Apple Pay” and the Apple Pay logo.
For more version information, see Apple Pay on the Web version history. For more information
about button types and their usage, see Human Interface Guidelines.
The code example below uses CSS properties to display Apple Pay buttons. The code supports
devices running macOS 10.12 and later, and iOS 10 and later, by using the CSS @supports featu
to determine if the -webkit-appearance: -apple-pay-button property is available. For
devices with earlier iOS or macOS versions where Safari doesn’t support these button types, use
the plain Apple Pay button instead (see Draw Apple Pay Buttons).
Display an Apple Pay Button Using CSS


## Page 3

When your app runs on older versions of macOS and iOS where Safari doesn’t support the -
webkit-appearance: -apple-pay-button property, you must draw the Apple Pay button.
The sample code listings below use @supports to determine whether the browser supports -
apple-pay-button property, and draw the buttons if it’s not supported. The two buttons you
can choose to draw are the plain Apple Pay button, and the Buy with Apple Pay button.
The following code example displays a plain Apple Pay button.
Draw Apple Pay Buttons


## Page 4

The following code example displays a Buy with Apple Pay button.


## Page 5



## Page 6

Styling the Apple Pay Button Using CSS
Choose a button color and size to suit your webpage.
Localizing Apple Pay Buttons Using CSS
Topics
Styling the Apple Pay Button


## Page 7

Set the language of an Apple Pay button.
Displaying Apple Pay Buttons Using JavaScript
Load and configure the JavaScript Apple Pay button.
ApplePayButton
An object that displays a button either to trigger payments through Apple Pay or to prompt t
user to set up a card.
See Also
Apple Pay buttons


