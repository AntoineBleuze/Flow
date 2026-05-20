# 000_AudioStreamPacketDependencyDescription.pdf

## Page 1

A structure to provide a description of the dependencies of one audio packet on other audio
packets.
For independently decodable packets, the mPreRollCount indicates how many additional
packets need to be decoded after this packet in order for the decoder to start returning optimal
output, if this is the first packet decoded since the decoder was initialized.
Overview
Core Audio Types / AudioStreamPacketDependencyDescription
Structure
AudioStreamPacketDependency
Description
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

init()
init(mIsIndependentlyDecodable: UInt32, mPreRollCount: UInt32, mFlags:
UInt32, mReserved: UInt32)
var mFlags: UInt32
var mIsIndependentlyDecodable: UInt32
var mPreRollCount: UInt32
var mReserved: UInt32
BitwiseCopyable, Sendable
Topics
Initializers
Instance Properties
Relationships
Conforms To


