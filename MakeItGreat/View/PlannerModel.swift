//
//  PlannerModel.swift
//  MakeItGreat
//
//  Created by Daniele Cavalcante on 11/12/22.
//

import Foundation

struct Task: Identifiable, Hashable {
    var taskDescription: String
    var time: String
    var id = UUID()
}

struct PlannerModel {
    private(set) var tasks = [Task]()
    init() {
        tasks = [
            Task(taskDescription: "Tomar banho", time: "6:00"),
            Task(taskDescription: "Escovar os dentes", time: "6:20"),
            Task(taskDescription: "Arrumar a cama", time: "6:40"),
            Task(taskDescription: "Tomar café da manhã", time: "7:00"),
            Task(taskDescription: "Ir para o colégio", time: "8:00"),
            Task(taskDescription: "Almoçar", time: "13:00"),
            Task(taskDescription: "Ir para a natação", time: "14:00"),

            
        ]
    }
    mutating func createTask(_ task: String, _ time: String) {
        tasks.append(Task(taskDescription: task, time: time))
    }
}

//var testTasks = [
//    Task(taskDescription: "Escovar os dentes"),
//    Task(taskDescription: "Arrumar a cama")
//]
