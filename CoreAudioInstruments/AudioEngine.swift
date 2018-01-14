import Foundation
import AVFoundation

class AudioEngine {
    private let engine = AVAudioEngine()
    private let sampler = AVAudioUnitSampler()

    init() {
        AVAudioSession.configureAudioSession()
        AVAudioSession.setActive(true)
        
        engine.attach(sampler)
        engine.connect(sampler, to: engine.mainMixerNode, format: nil)

        try! engine.start()
    }
    
    func play(_ midiNote: UInt8) {
        sampler.startNote(midiNote, withVelocity: UInt8.max, onChannel: 1)
    }
    
    func stop(_ midiNote: UInt8) {
        sampler.stopNote(midiNote, onChannel: 0)
    }
}
