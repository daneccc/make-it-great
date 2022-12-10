//
//  DayPlanner.swift
//  MakeItGreat
//
//  Created by Daniele Cavalcante on 29/11/22.
//

import Foundation

class DayPlanner: ObservableObject {
    @Published private var calendarModel = CalendarModel()
    var currentDate: Date {
        return calendarModel.currentDate
    }
    func setCurrentDate(to dateStr: String) {
        calendarModel.setCurrentDate(to: dateStr)
    }
    func dates() -> [Date] {
        calendarModel.datesInYear()
    }
    func startDateOfWeeksInAYear() -> [Date] {
        calendarModel.startDateOfWeeksInAYear()
    }
    func datesInAWeek(from date: Date) -> [Date] {
        calendarModel.datesInAWeek(from: date)
    }
    func startDayOfWeek(from date: Date) -> Date {
        calendarModel.startDateOfWeek(from: date)
    }
    func isCurrent(_ date: Date) -> Bool {
        return date == currentDate
    }
}
