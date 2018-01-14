import UIKit
import GLNPianoView

class ViewController: UIViewController, GLNPianoViewDelegate {
    override func loadView() {
        let keyboardView = GLNPianoView()
        keyboardView.delegate = self
        view = keyboardView
    }
    
    func pianoKeyDown(_ keyNumber: UInt8) {
        print("Key down for MIDI note \(keyNumber)")
    }
    
    func pianoKeyUp(_ keyNumber: UInt8) {
        print("Key up for MIDI note \(keyNumber)")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeLeft, .landscapeRight]
    }
}

