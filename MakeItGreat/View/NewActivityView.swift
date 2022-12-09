import SwiftUI

struct NewActivityView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var time: Int = 0
    @Binding var flag: Bool

    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("Título")
                        .bold()
                        .font(.system(size: 28))
                        .padding(40)

                    Text("Período")
                        .bold()
                        .font(.system(size: 28))
                }
                VStack {
                    TextField("", text: $title)
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(30)

                    TextField("", value: $time, formatter: NumberFormatter())
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
                        .foregroundColor(Color("secondColor"))
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("salvar")
                    // executar função para salvar nova atividade
                } label: {
                    Text("Salvar")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color("secondColor"))
                }
                .disabled(title.isEmpty || time <= 0)
            }
            ToolbarItem(placement: .principal) {
                Text("Nova Atividade")
                    .bold()
                    .font(.system(size: 36))
                    .foregroundColor(Color("fourthColor"))
            }
        }
        .onChange(of: flag) { _ in
            dismiss()
        }
    }
}
