import SwiftUI

struct AfternoonGridView: View {
    @Environment(\.dismiss) private var dismiss
    let columns = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 3)
    @ObservedObject var activityGridVM1 = ActivityGridViewModel()
    @ObservedObject var activityGridVM2 = ActivityGridViewModel()
    @Binding var flag: Bool
    @Binding var origin: Bool

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Editar as Atividades da")
                        .font(.system(size: 38.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom, 15)
                    Text("Tarde")
                        .font(.system(size: 38.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.tertiary)
                        .tracking(2)
                        .padding(.bottom, 15)
                }
                .padding(15)
                ScrollView {
                    Section {
                        Text("Higiene e Cuidados Pessoais")
                            .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                            .foregroundColor(Theme.font)
                            .tracking(2)
                            .padding(.bottom, 50)
                        LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                            ForEach($activityGridVM1.activities, id: \.id) { $activity in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(
                                            activity.completed ? Theme.secondary : Theme.action
                                        )
                                        .frame(width: 191, height: 174)
                                        .cornerRadius(39)
                                        .onTapGesture {
                                            activity.completed.toggle()
                                        }
                                    if activity.completed {
                                        Text("✓")
                                            .foregroundColor(.black)
                                            .font(.system(size: 48))
                                            .bold()
                                    }
                                }
                            }
                        }
                    }
                    Section {
                        Text("Aprendizado")
                            .font(.system(size: 32.0, weight: .heavy, design: .rounded))
                            .foregroundColor(Theme.font)
                            .tracking(2)
                            .padding(.bottom, 50)
                        LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                            ForEach($activityGridVM2.activities, id: \.id) { $activity in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(
                                            activity.completed ? Theme.secondary : Theme.action
                                        )
                                        .frame(width: 191, height: 174)
                                        .cornerRadius(39)
                                        .onTapGesture {
                                            activity.completed.toggle()
                                        }
                                    if activity.completed {
                                        Text("✓")
                                            .foregroundColor(.black)
                                            .font(.system(size: 48))
                                            .bold()
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
                    NightGridView(flag: $flag, origin: $origin)
                } label: {
                    Text("Próximo")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
}
