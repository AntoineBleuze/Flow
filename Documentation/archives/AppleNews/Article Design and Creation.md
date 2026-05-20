# Article Design and Creation.pdf

## Page 1

In these tutorials, you’ll download article.json files and follow steps to add code. Preview you
changes in News Preview as you go. If you are not familiar with JSON or Apple News Format, see
JSON Concepts and Article Structure before you get started.
Before beginning the tutorial, make sure you have the following installed:
Java 8
News Preview
The required version of Xcode for your News Preview version, as specified on the News Preview
page. After you install Xcode, launch the application and agree to all license agreements. When
you see the Welcome to Xcode window, you have finished installing Xcode.
iOS 11 or later SDK. This is part of the Xcode installation.
Text editing software of your choice. This is necessary only if you are editing the tutorial files
yourself. See Choose a Text Editor.
Setting Up the Introductory Tutorial
Download the tutorial files, and learn about what you’ll create in the introductory tutorial.
Overview
Requirements
Topics
Introductory Design Tutorial
Apple News / Apple News Format Tutorials
Apple News Format Tutorials
Create a basic article and then add advanced design features.


## Page 2

Creating Your First Article
Create an article with text components and component text styles.
Positioning Text Components
Adjust the positions of the text components in your article—for example, place the article bo
off-center.
Adding a Divider
Create a horizontal, styled divider that extends to the right edge of the display.
Adding an Image and Captions
Create a photo that extends to both edges of the display, with captions that appear in the
article layout and in full-screen view.
Adding a Pull Quote
Break an existing body component into two components, and then insert a pull quote betwee
them.
Adding a Gallery of Images
Display three images as a sequential gallery.
Adding a Mosaic of Images
Display five images as mosaic tiles.
Adding a Tweet
Include a tweet in an article.
Adding a Podcast
Add a link to a podcast that displays the podcast artwork and the podcast show or episode
information.
Viewing the Finished Article for the Introductory Design Tutorial
See the full JSON code from this tutorial.
Setting Up the Advanced Tutorials
Download the tutorial files, and learn about what you’ll create in the three advanced tutorials
About Containers
Learn the basic Apple News Format container concepts required for the three advanced
tutorials.
Advanced Design Tutorial 1: Headers and Parallax Behavior


## Page 3

Creating a Layered Header
Create a header with a caption that’s layered in front of an image.
Adding Parallax Behavior
Create an illusion of multiple flat layers by causing the article body to overlap the header as
the user scrolls.
Viewing the Finished Article for Advanced Design Tutorial 1
See the full JSON code from this tutorial.
Creating a Complex, Layered Header
Layer a title and heading in front of an image, with their colors optimized for legibility.
Creating a Floating Caption
Position a caption in the wide right margin of your article.
Creating an Inset Pull Quote
Wrap article body text around an inset pull quote.
Creating an Inset Photo
Wrap article body text around an inset photo.
Adding Color to Text Ranges
Create text in color by using HTML to refer to TextStyle objects.
Adding Animations
Use animations to affect how parts of your article come into view the first time they appear.
Adding a Scene
Control how the article’s opening section comes into view.
Viewing the Finished Article for Advanced Design Tutorial 2
See the full JSON code from this tutorial.
Giving the Article a Dark Color Scheme
Apply a new color scheme to your article.
Adding a Video
Advanced Design Tutorial 2: Layout and Positioning
Advanced Design Tutorial 3: More Ideas


## Page 4

Add a video component inside the header component.
Creating a Sidebar
Create a box with an HTML bulleted list in the margin.
Adding a Fixed Image Fill
Add an image that remains stationary when the user scrolls.
Creating a Newsletter Sign-Up Element
Add a newsletter sign-up element in your article.
Viewing the Finished Article for Advanced Design Tutorial 3
See the full JSON code from this tutorial.
Examples
Download more example article bundles for Apple News Format articles.
Apple News Format
Get Apple News Format reference information, and create signature content for Apple News
More Examples
See Also
Article Design and Creation


## Page 5

Apple News Format is the JavaScript Object Notation (JSON) format you use to create articles for
Apple News.
An article created in Apple News Format can include text, images, audio, video, embedded social
media, photo galleries, data tables, and interactive maps. You can enhance your article with
animations, behaviors, and customized styles that let you create a unique look for your content.
Your finished article is processed and rendered in Apple News.
Overview
Web Service
Apple News Format
Get Apple News Format reference information, and create signature content for
Apple News.


## Page 6

With Apple News Format, you only have to author your content once. News automatically optimiz
your articles for iPhone, iPad, Mac, and Apple Vision Pro to give your readers the best experience
for their device.
Release notes announce new features, updates, and deprecations for major and beta releases, so
you can plan for changes and make adjustments as needed.
Apple News Format Release Notes
Learn about new features that require iOS 26, iPadOS 26, and macOS 26.
Apple News Format Version History
Learn how Apple News Format versions map to iOS, iPadOS, macOS, and visionOS releases.
JSON Concepts and Article Structure
Understand basic JSON concepts and become familiar with the structure of an Apple News
Format article.
Creating an Article: Main Steps
Plan the design for your article and create it in Apple News Format.
object ArticleDocument
The root object of an Apple News article, that contains required properties, metadata,
content, layout, and styles.
Changing the Appearance of Your Article Tile in Feeds
Change the information that News displays about your published article.
object Metadata
Information about your article, including author name, creation date, publication date,
keywords, and excerpt.
Topics
Release Notes
Essentials
Article Display
Article Metadata


## Page 7

object LinkedArticle
A relationship between your article and another Apple News article.
object Issue
The object for defining information about an issue.
Planning the Layout for Your Article
Define a layout that supports the look you want for your article.
Positioning the Content in Your Article
Align article components with columns in your layout.
Wrapping Text Around a Component
Define the layout of a text component to wrap around another component.
object Layout
The object for defining columns, gutters, and margins for your article’s designed width.
object ComponentLayout
The object for defining the positioning for a specific component within the article’s column
system.
object Anchor
The object for anchoring one component to another component in your article’s layout.
object Margin
The object for defining the space above and below a component.
object AutoPlacementLayout
The object for defining the margin above and below advertising components.
object AdvertisingLayout
The object for defining the margin above and below advertising components.
Deprecated
Components
Understand the types of components that can make up an article.
Article Layout
Article Content


## Page 8

Enhancing Your Articles with Styles
Improve the appearance of the text and components in your article by using Apple News
Format styles.
Supporting Dark Mode for Your Article
Update your article template so that your article adapts when Dark Mode is active.
object DocumentStyle
The object for setting the background color for your article.
Text Styles
Learn about text styles and how to apply them to your text and text components.
Component Styles
Learn to use component styles to add borders, set background colors, and apply backgroun
images to components and to set the styling for tables.
Supported Color Names
Learn the color names supported in Apple News Format.
type Color
The strings for defining colors in Apple News Format.
Managing Advertisements in Your Channel
Set the layout and frequency of ads automatically inserted in an article.
object AutoPlacement
The object for automatically placing components within Apple News Format articles.
object AdvertisementAutoPlacement
The object for defining the automatic placement of advertisements.
object AdvertisingSettings
The object for defining properties that affect the frequency and placement with which banne
advertisements and medium rectangle advertisements are automatically placed in your artic
Deprecated
Styles
Dynamic Advertising


## Page 9

Define conditions for various objects to get the right look for your content.
object Condition
The object for defining a condition that, when met, causes conditional properties to go into
effect.
object ConditionalComponent
The object for defining conditional properties for a component, and when the conditional
properties are in effect.
object ConditionalComponentLayout
The object for defining conditional properties for a component layout, and when the
conditional properties are in effect.
object ConditionalAutoPlacement
The object for defining conditional properties for an automatically placed component, and
when the conditional properties are in effect.
object ConditionalSection
The object for defining conditional properties for a section component, and when the
conditional properties are in effect.
object ConditionalDocumentStyle
The object for defining conditional properties for a document style, and when the conditiona
properties are in effect.
object ConditionalText
The object for defining conditional properties for a text component, and when the conditiona
properties are in effect.
object ConditionalTextStyle
The object for defining conditional properties for a text style, and when the conditional
properties are in effect.
object ConditionalComponentTextStyle
The object for defining conditional properties for a component text style, and when the
conditional properties are in effect.
object ConditionalComponentStyle
The object for defining conditional properties for a component style, and when the condition
properties are in effect.
Conditional Design Elements


## Page 10

object ConditionalContainer
The object for defining conditional properties for a container component, and when the
conditional properties are in effect.
object ConditionalDivider
The object for defining conditional properties for a divider component, and when the
conditional properties are in effect.
object ConditionalButton
The object for defining a button component’s conditional properties, and when the condition
properties are in effect.
Specifying Measurements for Components
Specify the units of measure to use for margins, minimum heights, and other dimensions.
type SupportedUnits
The units of measurement Apple News Format supports.
Preparing Image, Video, Audio, Music, and ARKit Assets
Add media assets to your article.
Apple News Format Tutorials
Create a basic article and then add advanced design features.
Component Measurements and Media Guidelines
See Also
Article Design and Creation


