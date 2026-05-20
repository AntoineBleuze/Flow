# Apple Pay buttons.pdf

## Page 1

The JavaScript Apple Pay button provides a variety of Apple Pay button types that you can use on
your website to initiate a transaction. You can specify the Apple Pay button style, type, and
localization using attributes. Use CSS to set other properties, such as the size and corner radius.
Use the following code to load the button script into your webpage from the content delivery
network:
Add an apple-pay-button element to your webpage to display the button. Set the style, type,
and locale when you add the button. The following code adds a black Buy with Apple Pay button
localized to Greek, using the default size and corner radius:
Use CSS to customize the size and other attributes. The following example adds the same Greek
button with a height of 40 pixels, a width of 140 pixels, and a corner radius of 5 pixels. The heigh
includes the top and bottom padding.
Overview
Display the Button
Apple Pay on the Web / Displaying Apple Pay Buttons Using JavaScript
Article
Displaying Apple Pay Buttons Using
JavaScript
Load and configure the JavaScript Apple Pay button.


## Page 2

The CSS properties for the button are:
--apple-pay-button-width
The width of the button.
The minimum value for the width of a plain Apple Pay button is 100 pixels.
The minimum value for the width of all other Apple Pay buttons is 140 pixels.
The button renders at the minimum width when the specified value is less than the minimum.
--apple-pay-button-height
The height of the button.
The default and minimum value for the height is 30 pixels.
The button renders at the minimum height when the specified value is less than the minimum.
--apple-pay-button-border-radius
The corner radius of the button.
The default value is 4 pixels.
--apple-pay-button-padding
The amount of padding on each side of the button.
The default value is 0 pixels.
--apple-pay-button-box-sizing
The box size for the Apple Pay button. The possible values are the same as the box-sizing
CSS property.
For design guidance, see Human Interface Guidelines > Apple Pay > Buttons and Marks.
ApplePayButton
An object that displays a button either to trigger payments through Apple Pay or to prompt t
user to set up a card.
See Also
Apple Pay buttons


## Page 3

Displaying Apple Pay Buttons Using CSS
Use CSS templates to display Apple Pay buttons in Safari.


## Page 4

Choose the type and style of the button and the browser shows the button with the correct conte
and appearance. For design guidance, see Human Interface Guidelines > Apple Pay > Buttons and
Marks.
type
The kind of Apple Pay button, such as a button for purchasing a subscription.
buttonstyle
The appearance of the Apple Pay button, such as a black button with white lettering.
locale
The language and region used for the displayed Apple Pay button.
ApplePayButtonType
A type that indicates the button types that you can display to initiate Apple Pay transactions
Overview
Topics
Configuring appearance
Apple Pay on the Web / ApplePayButton
Class
ApplePayButton
An object that displays a button either to trigger payments through Apple Pay or t
prompt the user to set up a card.
Safari Desktop 10.0+
Safari Mobile 10.0+


## Page 5

ApplePayButtonStyle
A type that indicates the available appearances for an Apple Pay Button.
ApplePayButtonLocale
A type that indicates the languages and regions that you can specify for the Apple Pay butto
Displaying Apple Pay Buttons Using JavaScript
Load and configure the JavaScript Apple Pay button.
Displaying Apple Pay Buttons Using CSS
Use CSS templates to display Apple Pay buttons in Safari.
See Also
Apple Pay buttons


## Page 6

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


## Page 7

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


## Page 8

When your app runs on older versions of macOS and iOS where Safari doesn’t support the -
webkit-appearance: -apple-pay-button property, you must draw the Apple Pay button.
The sample code listings below use @supports to determine whether the browser supports -
apple-pay-button property, and draw the buttons if it’s not supported. The two buttons you
can choose to draw are the plain Apple Pay button, and the Buy with Apple Pay button.
The following code example displays a plain Apple Pay button.
Draw Apple Pay Buttons


## Page 9

The following code example displays a Buy with Apple Pay button.


## Page 10



## Page 11

Styling the Apple Pay Button Using CSS
Choose a button color and size to suit your webpage.
Localizing Apple Pay Buttons Using CSS
Topics
Styling the Apple Pay Button


## Page 12

Set the language of an Apple Pay button.
Displaying Apple Pay Buttons Using JavaScript
Load and configure the JavaScript Apple Pay button.
ApplePayButton
An object that displays a button either to trigger payments through Apple Pay or to prompt t
user to set up a card.
See Also
Apple Pay buttons


