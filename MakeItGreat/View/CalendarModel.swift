//
//  CalendarModel.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import Foundation

struct CalendarModel {
    private(set) var today = Date()
    private(set) var currentDate: Date
    private(set) var startOfYear: Date
    private var calendar = Calendar(identifier: .iso8601)
    private let dateFormatter = DateFormatter()

    init() {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = "yyyyMMdd"
        let todayStr = dateFormatter.string(from: today)
        currentDate = dateFormatter.date(from: todayStr)!
        let currentYear = calendar.component(.year, from: currentDate)
        startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1))!
    }
    mutating func setCurrentDate(to date: Date) {
        let dateStr = dateFormatter.string(from: date)
        currentDate = dateFormatter.date(from: dateStr)!

    }
    func datesInYear() -> [Date] {
        let currentYear = calendar.component(.year, from: currentDate)
        let startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1))
        let range = calendar.range(of: .day, in: .year, for: startOfYear!)!
        let datesArrInYear = range.compactMap {
            calendar.date(byAdding: .day, value: $0-1, to: startOfYear!)}
        return datesArrInYear
    }
    func datesInAWeek(from date: Date) -> [Date] {
        let range = calendar.range(of: .weekday, in: .weekOfYear, for: date)!
        let datesArrInWeek = range.compactMap {
            calendar.date(byAdding: .day, value: $0-1, to: date)
        }
        return datesArrInWeek
    }
    func startDateOfWeeksInAYear() -> [Date] {
        let currentWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfYear)
        let startOfWeek = calendar.date(from: currentWeek)
        let range = calendar.range(of: .weekOfYear, in: .year, for: startOfYear)!
        let startOfWeekArr = range.compactMap {
            calendar.date(byAdding: .weekOfYear, value: $0, to: startOfWeek!)
        }
        return startOfWeekArr
    }
    func startDateOfWeek(from date: Date) -> Date {
        let currentWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return calendar.date(from: currentWeek)!
    }
}

extension Date {
    func monthYYYY() -> String {
        return self.formatted(.dateTime .month(.wide) .year())
    }
    func weekDayAbbrev() -> String {
        return self.formatted(.dateTime .weekday(.abbreviated))
    }
    func dayNum() -> String {
        return self.formatted(.dateTime .day())
    }
}
