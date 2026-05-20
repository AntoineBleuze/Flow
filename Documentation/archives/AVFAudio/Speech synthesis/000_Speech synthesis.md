# 000_Speech synthesis.pdf

## Page 1

The Speech Synthesis framework manages voice and speech synthesis, and requires two primary
tasks:
Create an AVSpeechUtterance instance that contains the text to speak. Optionally, configure
speech parameters, such as voice and rate, for each utterance.
Pass the utterance to an AVSpeechSynthesizer instance to produce spoken audio.
Overview
AVFAudio / Speech synthesis
API Collection
Speech synthesis
Configure voices to speak strings of text.


## Page 2

Optionally, use the speech synthesizer instance to control or respond to ongoing speech; for
example, assign its delegate to receive speech event notifications.
class AVSpeechUtterance
An object that encapsulates the text for speech synthesis and parameters that affect the
speech.
class AVSpeechSynthesisVoice
A distinct voice for use in speech synthesis.
class AVSpeechSynthesizer
An object that produces synthesized speech from text utterances and enables monitoring or
controlling of ongoing speech.
class AVSpeechSynthesisProviderAudioUnit
An object that generates speech from text.
Topics
Spoken text attributes
Speech synthesis controls
Speech synthesis audio unit


