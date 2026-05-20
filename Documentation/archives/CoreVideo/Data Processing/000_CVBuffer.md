# 000_CVBuffer.pdf

## Page 1

A CVBuffer serves as an abstract base class that defines how to interact with buffers of data. A
buffer object can hold video, audio, or possibly other types of data. All the other buffer types with
the Core Video framework, such as CVImageBuffer and CVPixelBuffer, derive from CVBuffer. Yo
can use the CVBuffer programming interface on any Core Video buffer.
func CVBufferHasAttachment(CVBuffer, CFString) -> Bool
Returns a Boolean value that indicates whether a Core Video buffer contains a specified
attachment.
func CVBufferCopyAttachment(CVBuffer, CFString, UnsafeMutablePointer<
CVAttachmentMode>?) -> CFTypeRef?
Returns a copy of an attachment from a Core Video buffer.
func CVBufferCopyAttachments(CVBuffer, CVAttachmentMode) -> CFDictionar
?
Returns a copy of all attachments from a Core Video buffer.
func CVBufferSetAttachment(CVBuffer, CFString, CFTypeRef, CVAttachment
Mode)
Sets or adds an attachment to a Core Video buffer.
Overview
Topics
Working with attachments
Core Video / CVBuffer
API Collection
CVBuffer
An abstract base class that defines how to interact with data buffers.


## Page 2

func CVBufferSetAttachments(CVBuffer, CFDictionary, CVAttachmentMode)
Sets a dictionary of attachments on a Core Video buffer.
func CVBufferPropagateAttachments(CVBuffer, CVBuffer)
Copies all attachments that Core Video can propagate from one buffer to another.
func CVBufferRemoveAttachment(CVBuffer, CFString)
Removes the attachment you specify from a Core Video buffer.
func CVBufferRemoveAllAttachments(CVBuffer)
Removes all attachments from a Core Video buffer.
func CVBufferGetAttachment(CVBuffer, CFString, UnsafeMutablePointer<
CVAttachmentMode>?) -> Unmanaged<CFTypeRef>?
Retrieves a specific attachment of a Core Video buffer.
Deprecated
func CVBufferGetAttachments(CVBuffer, CVAttachmentMode) -> CFDictionary
Retrieves all attachments of a Core Video buffer.
Deprecated
class CVBuffer
A reference to a Core Video buffer.
enum CVAttachmentMode
The propagation modes of a Core Video buffer attachment.
CVBuffer Attribute Keys
The attributes associated with Core Video buffers.
CVBuffer Attachment Keys
The attachment types for a Core Video buffer.
Data types
Constants
See Also


## Page 3

Core Video Programming Guide
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Related Documentation
Data Processing


