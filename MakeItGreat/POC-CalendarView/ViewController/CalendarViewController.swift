import UIKit

class CalendarViewController: UIViewController {

    var calendarView : CalendarView
    
    init() {
        self.calendarView = CalendarView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        self.view = CalendarView()
        calendarView.calendarView.delegate = self
        calendarView.dateSelection = UICalendarSelectionMultiDate(delegate: self)
        calendarView.calendarView.selectionBehavior = calendarView.dateSelection
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView,
                      decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let font = UIFont.systemFont(ofSize: 10)
        let configuration = UIImage.SymbolConfiguration(font: font)
        let image = UIImage(systemName: "star.fill",
                            withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
        return .image(image)
    }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate,
                       didSelectDate dateComponents: DateComponents?) {
        print("Selected Date:", dateComponents ?? "No selection")
    }
    func dateSelection(_ selection: UICalendarSelectionSingleDate,
                       canSelectDate dateComponents: DateComponents?) -> Bool {
        
        return dateComponents != nil
    }
}

extension CalendarViewController: UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                            didSelectDate dateComponents: DateComponents) {
        print("Selected Date:", dateComponents)
    }
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        print("De-Selected Date:", dateComponents)
    }
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                            canSelectDate dateComponents: DateComponents) -> Bool {
        print("\(String(describing: dateComponents))")
        print("oi")
        return true
    }
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                            canDeselectDate dateComponents: DateComponents) -> Bool {
        print("\(String(describing: dateComponents))")
        print("oi")
        return true
    }
}
