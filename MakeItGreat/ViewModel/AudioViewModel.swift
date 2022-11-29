import Foundation
import AVFoundation

@MainActor class AudioViewModel: ObservableObject {
    @Published var audios: [Audio]
    @Published var player: AVAudioPlayer?

    init(audios: [Audio]) {
        self.audios = audios
    }

    func playSound() {
        let audio = audios[0]

        if let player = player, player.isPlaying {
            player.pause()

        } else {
            let audioUrl = Bundle.main.url(forResource: audio.name, withExtension: audio.type)

            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard audioUrl != nil else {
                    return
                }

                player = try AVAudioPlayer(contentsOf: audioUrl!)

                guard player != nil else {
                    return
                }
                player?.numberOfLoops = -1
                player?.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
