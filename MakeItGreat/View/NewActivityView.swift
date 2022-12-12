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
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                        .padding(.bottom, 40)
                        .padding(.top, 20)
                    Text("Período")
                        .font(.system(size: 28.0, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.font)
                        .tracking(2)
                }
                VStack {
                    TextField("", text: $title)
                        .frame(width: 662, height: 53)
                        .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(20)

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
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // executar função para salvar nova atividade
                } label: {
                    Text("Salvar")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
                .disabled(title.isEmpty)
            }
            ToolbarItem(placement: .principal) {
                Text("Nova Atividade")
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
