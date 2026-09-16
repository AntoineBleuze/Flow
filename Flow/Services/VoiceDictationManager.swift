import AVFoundation
import Combine
import Foundation
import Speech

@MainActor
public final class VoiceDictationManager: ObservableObject {
    public static let shared = VoiceDictationManager()

    @Published public var isRecording: Bool = false
    @Published public var recognizedText: String = ""
    @Published public var errorMessage: String?

    private var audioEngine = AVAudioEngine()
    private var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "fr-FR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    private init() {}

    public func toggleRecording(onUpdate: @escaping (String) -> Void, onFinished: ((String) -> Void)? = nil) {
        if isRecording {
            stopRecording()
            onFinished?(recognizedText)
        } else {
            startRecording(onUpdate: onUpdate, onFinished: onFinished)
        }
    }

    public func startRecording(onUpdate: @escaping (String) -> Void, onFinished: ((String) -> Void)? = nil) {
        // Reset state
        stopRecording()
        recognizedText = ""
        errorMessage = nil

        SFSpeechRecognizer.requestAuthorization { authStatus in
            Task { @MainActor in
                guard authStatus == .authorized else {
                    self.errorMessage = "Autorisation micro ou reconnaissance vocale refusée."
                    return
                }

                do {
                    let audioSession = AVAudioSession.sharedInstance()
                    try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
                    try audioSession.setActive(true, options: .notifyOthersOnDeactivation)

                    self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
                    guard let recognitionRequest = self.recognitionRequest else { return }
                    recognitionRequest.shouldReportPartialResults = true

                    let inputNode = self.audioEngine.inputNode
                    let recordingFormat = inputNode.outputFormat(forBus: 0)

                    inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                        recognitionRequest.append(buffer)
                    }

                    self.audioEngine.prepare()
                    try self.audioEngine.start()
                    self.isRecording = true

                    self.recognitionTask = self.speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
                        Task { @MainActor in
                            if let result = result {
                                let spoken = result.bestTranscription.formattedString
                                self.recognizedText = spoken
                                onUpdate(spoken)

                                if result.isFinal {
                                    self.stopRecording()
                                    onFinished?(spoken)
                                }
                            }

                            if error != nil {
                                self.stopRecording()
                            }
                        }
                    }
                } catch {
                    self.errorMessage = "Impossible de démarrer l'enregistrement vocal: \(error.localizedDescription)"
                    self.stopRecording()
                }
            }
        }
    }

    public func stopRecording() {
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        recognitionRequest = nil
        recognitionTask = nil
        isRecording = false

        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}
