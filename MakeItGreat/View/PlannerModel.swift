//
//  PlannerModel.swift
//  MakeItGreat
//
//  Created by Daniele Cavalcante on 11/12/22.
//

import Foundation

struct Task: Identifiable, Hashable {
    var taskDescription: String
    var id = UUID()
}

struct PlannerModel {
    private(set) var tasks = [Task]()
    init() {
        tasks = [
            Task(taskDescription: "Escovar os dentes"),
            Task(taskDescription: "Arrumar a cama")
        ]
    }
    mutating func createTask(_ task: String) {
        tasks.append(Task(taskDescription: task))
    }
}

var testTasks = [
    Task(taskDescription: "Escovar os dentes"),
    Task(taskDescription: "Arrumar a cama")
]
