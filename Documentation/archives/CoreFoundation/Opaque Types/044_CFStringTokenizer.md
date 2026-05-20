# 044_CFStringTokenizer.pdf

## Page 1

CFStringTokenizer allows you to tokenize strings into words, sentences or paragraphs in a
language-neutral way. It supports languages such as Japanese and Chinese that do not delimit
words by spaces, as well as de-compounding German compounds. You can obtain Latin
transcription for tokens. It also provides language identification API.
You can use a CFStringTokenizer to break a string into tokens (sub-strings) on the basis of words
sentences, or paragraphs. When you create a tokenizer, you can supply options to further modify
the tokenization—see Tokenization Modifiers.
In addition, with CFStringTokenizer:
You can de-compound German compounds
You can identify the language used in a string (using CFStringTokenizerCopyBestStrin
Language(_:_:))
You can obtain Latin transcription for tokens
To find a token that includes the character specified by character index and set it as the current
token, you call CFStringTokenizerGoToTokenAtIndex(_:_:). To advance to the next toke
and set it as the current token, you call CFStringTokenizerAdvanceToNextToken(_:). To
get the range of current token, you call CFStringTokenizerGetCurrentTokenRange(_:).
You can use CFStringTokenizerCopyCurrentTokenAttribute(_:_:) to get the attribut
of the current token. If the current token is a compound, you can call CFStringTokenizerGet
CurrentSubTokens(_:_:_:_:) to retrieve the subtokens or derived subtokens contained in
the compound token. To guess the language of a string, you call CFStringTokenizerCopyBes
StringLanguage(_:_:).
Overview
Core Foundation / CFStringTokenizer
Class
CFStringTokenizer
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFStringTokenizerCreate(CFAllocator!, CFString!, CFRange, CFOption
Flags, CFLocale!) -> CFStringTokenizer!
Returns a tokenizer for a given string.
func CFStringTokenizerSetString(CFStringTokenizer!, CFString!, CFRange)
Sets the string for a tokenizer.
func CFStringTokenizerAdvanceToNextToken(CFStringTokenizer!) -> CFStrin
TokenizerTokenType
Advances the tokenizer to the next token and sets that as the current token.
func CFStringTokenizerGoToTokenAtIndex(CFStringTokenizer!, CFIndex) ->
CFStringTokenizerTokenType
Finds a token that includes the character at a given index, and set it as the current token.
func CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizer!,
CFOptionFlags) -> CFTypeRef!
Returns a given attribute of the current token.
func CFStringTokenizerGetCurrentTokenRange(CFStringTokenizer!) ->
CFRange
Returns the range of the current token.
func CFStringTokenizerGetCurrentSubTokens(CFStringTokenizer!, Unsafe
MutablePointer<CFRange>!, CFIndex, CFMutableArray!) -> CFIndex
Retrieves the subtokens or derived subtokens contained in the compound token.
Topics
Creating a Tokenizer
Setting the String
Changing the Location
Getting Information About the Current Token
Identifying a Language


## Page 3

func CFStringTokenizerCopyBestStringLanguage(CFString!, CFRange) ->
CFString!
Guesses a language of a given string and returns the guess as a BCP 47 string.
func CFStringTokenizerGetTypeID() -> CFTypeID
Returns the type ID for CFStringTokenizer.
Tokenization Modifiers
Tokenization options are used with CFStringTokenizerCreate(_:_:_:_:_:) to speci
how the string should be tokenized
struct CFStringTokenizerTokenType
Token types returned by CFStringTokenizerGoToTokenAtIndex(_:_:) and
CFStringTokenizerAdvanceToNextToken(_:).
Equatable, Hashable
String Programming Guide for Core Foundation
class CFAllocator
class CFArray
Getting the CFStringTokenizer Type ID
Constants
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 4

class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


