import UIKit

class AudioView: UIView {

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

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemBackground

        self.addSubview(self.tableView)
        self.addSubview(self.titleLabel)

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}
