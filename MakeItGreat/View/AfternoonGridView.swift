import SwiftUI

struct AfternoonGridView: View {
    @Environment(\.dismiss) private var dismiss

    let columns = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 3)

    @ObservedObject var activityGridVM1 = ActivityGridViewModel()
    @ObservedObject var activityGridVM2 = ActivityGridViewModel()

    @Binding var flag: Bool

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Editar as Atividades da ")
                        .bold()
                        .font(.system(size: 42))
                    Text("Tarde")
                        .bold()
                        .font(.system(size: 42))
                        .foregroundColor(.red)
                }
                .padding(15)

                ScrollView {
                    Section {
                        Text("Higiene e Cuidados Pessoais")
                            .bold()
                            .font(.system(size: 42))
                            .padding(15)
                        LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                            ForEach($activityGridVM1.activities, id: \.id) { $activity in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(activity.completed ? .yellow : .blue))
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
                            .bold()
                            .font(.system(size: 42))
                            .padding(15)
                        LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                            ForEach($activityGridVM2.activities, id: \.id) { $activity in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(activity.completed ? .yellow : .blue))
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
                        .bold()
                        .font(.system(size: 30))
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    NightGridView(flag: $flag)
                } label: {
                    Text("Próximo")
                        .bold()
                        .font(.system(size: 30))
                }
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
}
