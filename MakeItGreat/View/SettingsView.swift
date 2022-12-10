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
                            .frame(width: 613, height: 84)
                            .background()
                            .cornerRadius(12)
                        Text("Editar Atividades")
                            .font(.system(size: 24.0, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .tracking(2)
                            .frame(width: 613, height: 84)
                            .contentShape(Rectangle())
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                NavigationLink {
                    NewActivityView(flag: $flag)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 613, height: 84)
                            .background()
                            .cornerRadius(12)
                        Text("Cadastrar Nova Atividade")
                            .font(.system(size: 24.0, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .tracking(2)
                            .frame(width: 613, height: 84)
                            .contentShape(Rectangle())
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                NavigationLink {
                    PerfilEditView(flag: $flag)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 613, height: 84)
                            .background()
                            .cornerRadius(12)
                        Text("Editar Perfil")
                            .font(.system(size: 24.0, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .tracking(2)
                            .frame(width: 613, height: 84)
                            .contentShape(Rectangle())
                    }
                }
                .padding(20)
                .accentColor(Theme.action)
                Spacer()
            }
        }
    }
}
