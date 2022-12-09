import SwiftUI

struct NewActivityView: View {
    @Environment(\.dismiss) private var dismiss

    let times = ["Manhã", "Tarde", "Noite"]
    @State private var title: String = ""
    @State private var selectedTime: String = "Manhã"

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

                    Picker("Selecione o período do dia", selection: $selectedTime) {
                        ForEach(times, id: \.self) { time in
                                Text(time)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color("fourthColor"))
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 662, height: 53)
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1, height: 1.2))
                    .cornerRadius(10)
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
                    // executar função para salvar nova atividade
                } label: {
                    Text("Salvar")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color("secondColor"))
                }
                .disabled(title.isEmpty)
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
