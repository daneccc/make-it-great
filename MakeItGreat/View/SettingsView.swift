import SwiftUI

struct SettingsView: View {
    @Binding var flag: Bool
    @Binding var origin: Bool

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
                    MorningGridView(flag: $flag, origin: $origin)
                } label: {
                    ZStack {
                        Text("Editar Atividades")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .contentShape(Rectangle())
                            .frame(width: 613, height: 64)
                            .background(Theme.action)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                NavigationLink {
                    NewActivityView(flag: $flag)
                } label: {
                    ZStack {
                        Text("Cadastrar Nova Atividade")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .contentShape(Rectangle())
                            .frame(width: 613, height: 64)
                            .background(Theme.action)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                NavigationLink {
                    PerfilEditView(flag: $flag)
                } label: {
                    ZStack {
                        Text("Editar Perfil")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .contentShape(Rectangle())
                            .frame(width: 613, height: 64)
                            .background(Theme.action)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                Spacer()
            }
        }
    }
}
