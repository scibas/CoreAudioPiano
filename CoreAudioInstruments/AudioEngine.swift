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
        
        let instrumentUrl = Bundle.main.url(forResource: "piano", withExtension: "aupreset")
        loadInstrument(from: instrumentUrl)
    }
    
    func play(_ midiNote: UInt8) {
        sampler.startNote(midiNote, withVelocity: UInt8.max, onChannel: 1)
    }
    
    func stop(_ midiNote: UInt8) {
        sampler.stopNote(midiNote, onChannel: 0)
    }
    
    //More info about instrument loading: https://developer.apple.com/library/content/technotes/tn2283/_index.html
    private func loadInstrument(from url: URL?) {
        
        guard let url = url
            else { fatalError("Instrument file does not exits") }
        
        do {
            try sampler.loadInstrument(at: url)
        } catch {
            print("Error loading instrument: \(error)")
        }
    }
}
