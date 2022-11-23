import UIKit
import AVFAudio

class AudioViewController: UIViewController {

    var audioView: AudioView
    var audioViewModel: AudioViewModel

    init() {
        self.audioView = AudioView()
        self.audioViewModel = AudioViewModel(
            audios: [Audio(id: UUID(), name: "BEEHIVE", type: "WAV"),
                     Audio(id: UUID(), name: "CHIRPS_2", type: "WAV")]
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = audioView
        self.audioView.tableView.dataSource = self
        self.audioView.tableView.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAudio()
        audioViewModel.playSound()
        view.backgroundColor = .systemGreen
    }

    private func setAudio() {
        audioView.audioSet = { [weak self] in
            self?.playAudio()
        }
    }

    private func playAudio() {
        audioViewModel.playSound()
    }

}

extension AudioViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        audioViewModel.audios.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        audioViewModel.makeCell(tableView, indexPath)
    }
}
