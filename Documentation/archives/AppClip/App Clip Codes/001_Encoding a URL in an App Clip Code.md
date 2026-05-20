# 001_Encoding a URL in an App Clip Code.pdf

## Page 1

Creating an App Clip Code involves the following key tasks:
Choosing invocations to support
Choosing invocation URLs to use in your App Clip Code
Setting up advanced App Clip experiences
Although App Clip Codes are a great way to launch your App Clip, an App Clip Code can only
contain a limited amount of information in its visual code or NFC tag. At the same time, it’s
important you choose invocation URLs with additional parameters or attributes that lead to the be
possible launch experience for users. This additional information could make your invocation URL
too long to encode.
When you create an App Clip Code, you need to find the best tradeoff between the limited capac
to store information in the App Clip Code and the need to encode more information. Therefore,
choosing the right URLs to launch your App Clip from an App Clip Code is important.
Users launch your App Clip with an invocation; for example, by tapping a link in the Messages app
by scanning a QR code, or by scanning an App Clip Code. To support invocations from App Clip
Codes:
App Clip demo URL
You don’t have to associate your App Clip with your website or create an advanced App Clip
experience to use the App Clip demo URL in an App Clip Code. However, you can’t use launc
parameters with the demo URL.
default App Clip URL
Overview
Review App Clip experiences and invocation URLs
App Clips / Encoding a URL in an App Clip Code
Article
Encoding a URL in an App Clip Code
Choose an invocation URL for your App Clip Code that you can encode efficiently


## Page 2

You can’t use the default App Clip URL in your App Clip Code.
advanced App Clip experiences
Create at least one advanced App Clip experience and associate your App Clip with your
website to enable the system to verify your App Clip upon launch. For more information, see
Associating your App Clip with your website.
When you create an advanced App Clip experience, use a custom URL for your default App Clip
experience and your advanced App Clip experiences. For example, create a default App Clip
experience that uses https://example.com as its invocation URL, and one advanced App Clip
experience. The advanced experience’s registered invocation URL might be https://appclip
.example.com, and takes advantage of prefix matching.
When you use the advanced App Clip experience, you support invocations from QR codes, NFC
tags, and App Clip Codes. These invocations use https://appclip.example.com as their U
prefix and encode additional information with URL path components or queries. For example, you
can encode https://appclip.example.com/shop?p=123&p1=ab in an App Clip Code.
For more information, refer to Configuring App Clip experiences.
In general, the invocation URL encoded in an App Clip Code follows the same pattern as other
URLs: https://[host][/<path>][?<query>][#<fragment>]. However, the URL encode
in an App Clip Code must meet additional requirements:
The invocation URL must use the https scheme in lowercase.
The host segment is the invocation URL’s authority component and can only contain the
lowercase ASCII characters a to z, ., and -.
The invocation URL may have zero or more path and query components, followed by an option
fragment. They can use the following ASCII characters: a to z, A to Z, 0 to 9, and /#?
=%-._,+;:&.
An App Clip Code can only contain a limited amount of information, and as a result, the tools you
use to create the code compress the encoded invocation URL. The underlying encoding algorithm
can encode some words efficiently, while some characters may reduce the algorithm’s efficiency.
As a result, the exact length of an invocation URL you can encode in an App Clip Code varies base
on the ASCII characters and words you use.
When you create an App Clip Code, both App Store Connect and the App Clip Code Generator
command-line tool inform you if your invocation URL is too long.
To ensure you can encode your invocation URL in an App Clip Code:
Choose a valid invocation URL
Follow practices that allow for efficient encoding


## Page 3

Use the minimum number of characters you need to uniquely identify a resource. Long unique
identifiers (UUIDs) lower the effectiveness of the encoding.
Use a short host name with as few subdomains as possible.
If possible, remove the www subdomain from your host name.
Use decimal numbers as values for query components.
Replace long query string argument names and values with short strings. For example, use
https://example.com/?p=0 instead of https://example.com/?status=view.
Omit a trailing slash (/) character at the end of the URL. For example, use https://example
.com instead of https://example.com/.
Optionally, you can use the special subdomain appclip to define URLs specific to App Clip Code
for example, https://appclip.example.com. The algorithm that generates App Clip Codes
encodes this subdomain more efficiently than others. Choosing appclip as a subdomain also
allows URLs to have short path and query components by eliminating the possibility of conflicts
with an unrelated functionality of your website. If you use this subdomain, it must appear as the
first subdomain of the URL’s host.
If possible, don’t use any path components at all. However, if you must use them, choose from the
list below so the algorithm that creates the App Clip Code can encode the path components more
efficiently. For example, you might use https://example.com/brand.
Always use the fewest possible path components.
about, access, account, add, app, archives, article, attraction, author
bag, biz, book, brand, brands, browse, buy
cancel, cart, cat, catalog, category, categories, channel, charts, checkin, checkout, collection,
collections, company, compare, connect, contact, content, contents, cost, coupons, create
data, demo, destinations, detail, discover, download
entry, event, events, explore
faq, fetch, finance, find, food, fund
game, gift, goods, guide
health, help, home, hotel, hotels
Use a separate subdomain
Choose a single-word path component


## Page 4

id, index, info, item, item_id
join
lifestyle, list, listen, live, local, location, locations, locator, login
manage, menu, more, music
name, news, note, open
order, overview
park, part, pay, payment, payments, play, post, posts, preview, product, product_id, products,
profile, promotion, purchase
rate, recipe, recipes, reservation, reservations, reserve, retail, review, rewards
sale, scan, schedule, search, sell, send, service, share, shop, show, showtime, site, song,
special, stations, status, store, store-locator, stores, stories, story
tag, tags, terms, tickets, tips, title, today, top, topic, tours, track, transaction, travel, try
update, upload, use, user
vehicles, video, view, visit
watch, wiki
Note that the words in the list above don’t lead to more efficient encoding if you use them as a
subdomain or query parameter.
If you use no path component, or a single-word path component from the above list of special
words and query components, use the special ordered argument names p, p1, p2, p3, and so on
Doing so increases the likelihood of the URL fitting in an App Clip Code. For example, instead of
https://appclip.example.com/shop?a=123&b=456&c=789, use https://appclip
.example.com/shop?p=123&p1=456&p2=789.
In some cases, you may need to pass long query strings to the App Clip upon launch that result in
URL that’s too long to encode in an App Clip Code. In this case, you can use a hashing algorithm t
shorten the long query string. Upon launch, your app and App Clip can then expand the hash bac
to the long query string and use it to update their UI.
Use ordered argument names for query components
Hash long URLs
Reuse existing URLs


## Page 5

You may want to reuse URLs you previously created for other purposes in your App Clip Codes; fo
example, if you created your own tool to create short URLs for use in QR codes. If you do so, you
also need to:
Register each domain that can launch your App Clip in the list of associated domains.
Set up the AASA file for each domain you use.
Configure advanced App Clip experiences for both the short and long URLs.
For more information, refer to Configuring App Clip experiences.
Creating App Clip Codes
Help users discover your App Clip by using an NFC-integrated or scan-only App Clip Code.
Preparing multiple App Clip Codes for production
Prepare your App Clip Codes to send to a professional printing service.
Interacting with App Clip Codes in AR
Display content and provide services in an AR experience with App Clip Codes.
See Also
App Clip Codes


