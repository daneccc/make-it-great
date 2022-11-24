import UIKit
import Foundation

class CalendarView: UIView {
    var dateSelection: UICalendarSelection?
    
    lazy var calendarView : UICalendarView = {
        let calendar = UICalendarView()
        calendar.calendar = Calendar(identifier: .gregorian)
        // calendarView.locale = Locale(identifier: "zh_TW")
        calendar.fontDesign = .rounded
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.backgroundColor = .secondarySystemBackground
        calendar.layer.cornerCurve = .continuous
        calendar.tintColor = UIColor.systemTeal
        calendar.availableDateRange = DateInterval(start: Date.distantPast, end: Date.distantFuture)
        return calendar
    }()
        
// MARK: View lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }
}

extension CalendarView: ViewCoding {
    
    func setupHierarchy() {
        self.addSubview(self.calendarView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calendarView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            calendarView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}


