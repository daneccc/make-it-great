//
//  CreateView.swift
//  MakeItGreat
//
//  Created by Daniele Cavalcante on 07/12/22.
//

import SwiftUI

struct CreateNewTaskView: View {
    @EnvironmentObject var dayPlanner: PlannerViewModel
    @State private var showWhatView: Bool = true
    var body: some View {
        VStack {
            HeaderView()
                .padding()
            Divider()
            if showWhatView {
                WhatView(showWhatView: $showWhatView)
                    .padding()
            } else {
                CreateTaskView()
            }
            
            Spacer()
        }
    }
}

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Text("Nova atividade")
            Spacer()
            Image(systemName: "xmark")
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .font(.title)
        .fontWeight(.bold)
    }
}

struct WhatView: View {
    @EnvironmentObject var dayPlanner: PlannerViewModel
    @Binding var showWhatView: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("O que você planeja fazer?")
                .font(.title)
            TaskField(dayPlanner.taskDescription)
            Spacer()
            Text("\(dayPlanner.currentDate)")
            Button(action: {
                showWhatView.toggle()
            }) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct TaskField: View {
    @EnvironmentObject var dayplanner: PlannerViewModel
    @State private var activity: String = ""
    init(_ activity: String) {
        _activity = State(initialValue: activity)
    }

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: CGFloat(10))
                    .frame(width: 50, height: 50)
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            VStack {
                TextField("Descrição da atividade", text: $activity)
                    .font(.title2)
                Divider()
            }
            .padding(.leading)
        }
        .onChange(of: activity) { desc in
            dayplanner.taskDescription = desc // sempre q muda salva na viewmodel var
        }
    }
}

struct CreateTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dayplanner: PlannerViewModel
    var body: some View {
        VStack {
            TaskField(dayplanner.taskDescription)
            Spacer()
            Button(action: {
                dayplanner.createTask()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Adicionar atividade")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static let dayplanner = PlannerViewModel()
    static var previews: some View {
        CreateNewTaskView()
            .environmentObject(dayplanner)
    }
}
