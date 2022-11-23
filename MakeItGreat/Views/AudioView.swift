import UIKit

class AudioView: UIView {

    var audioSet: ( () -> Void )?
    var buttonFlag = true

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sounds"
        title.textColor = .label
        title.font = .boldSystemFont(ofSize: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let audioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause" ), for: UIControl.State.normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemBackground

        self.addSubview(self.tableView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.audioButton)

        audioButton.addTarget(self, action: #selector(setAudio), for: .touchUpInside)

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            audioButton.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 50),
            audioButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -50),
            audioButton.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -50)

        ])
    }

    @objc private func setAudio() {
        if buttonFlag {
            self.audioButton.setImage(UIImage(systemName: "play"), for: UIControl.State.normal)
            buttonFlag.toggle()
        } else {
            self.audioButton.setImage(UIImage(systemName: "pause"), for: UIControl.State.normal)
            buttonFlag.toggle()
        }
        audioSet?()
    }
}
