import SwiftUI

struct SettingsView: View {

    @Binding var flag: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Image("testImage")
                    .resizable()
                    .frame(width: 169, height: 169)
                    .clipShape(Circle())
                    .padding(27)

                NavigationLink {
                    MorningGridView(flag: $flag)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 613, height: 64)
                            .background()
                            .cornerRadius(12)
                        Text("Editar Atividades")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 613, height: 64)
                            .contentShape(Rectangle())
                    }
                }
                .padding(10)

                NavigationLink {
                    NewActivityView(flag: $flag)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 613, height: 64)
                            .background()
                            .cornerRadius(12)
                        Text("Cadastrar Nova Atividade")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 613, height: 64)
                            .contentShape(Rectangle())
                    }
                }
                .padding(10)

                NavigationLink {
                    PerfilEditView(flag: $flag)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 613, height: 64)
                            .background()
                            .cornerRadius(12)
                        Text("Editar Perfil")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 613, height: 64)
                            .contentShape(Rectangle())
                    }
                }
                .padding(10)

                Spacer()
            }
        }
    }
}
