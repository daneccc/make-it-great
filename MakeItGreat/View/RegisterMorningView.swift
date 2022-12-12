//
//  RegisterMorningActivities.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import SwiftUI

struct RegisterMorningView: View {
    @Environment(\.dismiss) private var dismiss
    let columns = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 3)
    @ObservedObject var activityGridVM1 = ActivityGridViewModel()
    @ObservedObject var activityGridVM2 = ActivityGridViewModel()
    @StateObject private var activityListVM = ActivityListViewModel()
    @State var categories: [String] = ["Higiene", "Organização", "Alimentação", "Diversão", "Aprendizado"]
    @Binding var flag: Bool
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Adicionar as Atividades da")
                        .font(.system(size: 38.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom, 15)
                    Text("Manhã")
                        .font(.system(size: 38.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.tertiary)
                        .tracking(2)
                        .padding(.bottom, 15)
                }
                .padding(15)
                ScrollView {
                    Section {
                        ForEach(categories, id: \.self) { category in
                            Text("\(category)")
                                .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                                .foregroundColor(Theme.font)
                                .tracking(2)
                                .padding(.bottom, 50)
                            LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                                ForEach($activityGridVM2.activities, id: \.id) { $activity in
                                    if activity.category == category && activity.doingAt == "manhã"{
                                        ZStack(alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(
                                                    activity.completed ? Theme.secondaryTransparent : Theme.action
                                                )
                                                .frame(width: 191, height: 174)
                                                .cornerRadius(39)
                                                .onTapGesture {
                                                    activity.completed.toggle()
                                                }
                                                .overlay(                                    Text("\(activity.name)")
                                                    .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                                                    .foregroundColor(
                                                        activity.completed ? Theme.action : Theme.secondary
                                                    )                                                    .tracking(2)
                                                    .multilineTextAlignment(.center)
                                                )
                                            if activity.completed {
                                                Text("✓")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 48))
                                                    .bold()
                                                    .padding(.leading, 125)
                                                    .padding(.bottom, 105)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Voltar")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    RegisterAfternoonView(flag: $flag)
                }
            label: {
                Text("Próximo")
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.action)
                    .tracking(2)
            }.simultaneousGesture(TapGesture().onEnded{
                saveToCoreData()
            })
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
    func saveToCoreData() {
        for activity in activityGridVM2.activities {
            if activity.completed {
                print(activity)
                let activityLocal = Activity(context: CoreDataHelper.shared.viewContext)
                activityLocal.name = activity.name
                activityLocal.doingAt = activity.doingAt
                activityLocal.category = activity.category
                activityLocal.finishHour = activity.finishHour
                activityLocal.startHour = activity.startHour
                CoreDataHelper.shared.save()
            }
        }
    }
}
