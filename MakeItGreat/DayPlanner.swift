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
}
