import UIKit
import AVFoundation

class AudioViewModel {
    var audios: [Audio]
    var player: AVAudioPlayer?

    init(audios: [Audio]) {
        self.audios = audios
    }

    func addAudio(
        _ name: String,
        _ type: String
    ) {
        let newAudio = Audio(id: UUID(), name: name, type: type)
        self.audios.append(newAudio)
    }

    func makeCell(
        _ tableView: UITableView,
        _ indexPath: IndexPath
    ) -> UITableViewCell {
        let audio = audios[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = audio.name
        cell.contentConfiguration = content
        return cell
    }

    func playSound() {
        let audio = audios[1]
        if let player = player, player.isPlaying {
            player.stop()

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
