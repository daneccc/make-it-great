import SwiftUI

struct PerfilEditView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var age: Int = 0
    @Binding var flag: Bool

    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("Nome")
                        .bold()
                        .font(.system(size: 28))
                        .padding(40)

                    Text("Idade")
                        .bold()
                        .font(.system(size: 28))
                }
                VStack {
                    TextField("", text: $name)
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(30)

                    TextField("", value: $age, formatter: NumberFormatter())
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
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
                        .bold()
                        .font(.system(size: 30))
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("salvar")
                    // executar função para salvar novos dados usando Name e Age
                } label: {
                    Text("Salvar")
                        .bold()
                        .font(.system(size: 30))
                }
                .disabled(name.isEmpty || age <= 0)
            }
            ToolbarItem(placement: .principal) {
                Text("Editar Perfil")
                    .bold()
                    .font(.system(size: 36))
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
}
