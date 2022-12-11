//
//  PlannerViewModel.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import Foundation

class PlannerViewModel: ObservableObject {
    @Published private var taskModel = PlannerModel()
    @Published var taskDescription: String = ""
    
    var tasks: [Task] {
        return taskModel.tasks
    }
    
    func createTask() {
        taskModel.createTask(taskDescription)
    }
    
    // calendar model
    @Published private var calendarModel = CalendarModel()
    var currentDate: Date {
        return calendarModel.currentDate
    }
    func setCurrentDate(to date: Date) {
        calendarModel.setCurrentDate(to: date)
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
    func startDateOfWeek(from date: Date) -> Date {
        calendarModel.startDateOfWeek(from: date)
    }
    func isCurrent(_ date: Date) -> Bool {
        return date == currentDate
    }
    func currentPositionInWeek() -> Int {
        let startOfWeek = startDateOfWeek(from: currentDate)
        let datesInAWeek = datesInAWeek(from: startOfWeek)
        let position = datesInAWeek.firstIndex(of: currentDate)!
        return position
    }
}
