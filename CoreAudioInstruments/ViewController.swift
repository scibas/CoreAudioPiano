import UIKit
import GLNPianoView

class ViewController: UIViewController, GLNPianoViewDelegate {
    private let audioEngine = AudioEngine()
    
    private struct Constants {
        static let octaveShift: UInt8 = 48 // 48 is MIDI note number for C4. http://www.electronics.dit.ie/staff/tscarff/Music_technology/midi/midi_note_numbers_for_octaves.htm
    }
    
    override func loadView() {
        let keyboardView = GLNPianoView()
        keyboardView.delegate = self
        view = keyboardView
    }
    
    func pianoKeyDown(_ keyNumber: UInt8) {
        let midiNote = Constants.octaveShift + keyNumber
        audioEngine.play(midiNote)
        print("Key down for MIDI note \(midiNote)")
    }
    
    func pianoKeyUp(_ keyNumber: UInt8) {
        let midiNote = Constants.octaveShift + keyNumber
        audioEngine.stop(midiNote)
        
        print("Key up for MIDI note \(midiNote)")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeLeft, .landscapeRight]
    }
}

