import Foundation

// MARK: Protocol for Requirement View(app`s main view).
protocol ViewCoding: AnyObject {
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    func buildLayout() {
        setupHierarchy()
        setupConstraints()
    }
}
