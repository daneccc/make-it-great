import SwiftUI

struct PerfilEditView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var nameUser: String = ""
    @State private var ageUser: Int = 0
    @Binding var flag: Bool

    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("Nome")
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom, 40)
                    Text("Idade")
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom, 40)
                }
                VStack {
                    TextField("", text: $nameUser)
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40)
                        .onChange(of: nameUser) { newValue in
                            UserDefaults.standard.setChildName(value: nameUser)
                        }
                    TextField("", value: $ageUser, formatter: NumberFormatter())
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .padding(.bottom, 40)
                        .onChange(of: ageUser) { newValue in
                            UserDefaults.standard.setChildAge(value: ageUser)
                        }
                }
            }
            .padding(.top, 40)
            Spacer()
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
                Button {
                    // executar função para salvar novos dados usando Name e Age
                } label: {
                    Text("Salvar")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
                .disabled(nameUser.isEmpty || ageUser <= 0)
            }
            ToolbarItem(placement: .principal) {
                Text("Editar Perfil")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.font)
                    .tracking(2)
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
}
