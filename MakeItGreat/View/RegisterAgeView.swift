//
//  RegisterNameView.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 10/12/22.
//

import SwiftUI

struct RegisterAgeView: View {
    @State var textFieldText: String = ""
    @State private var age: String = ""
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    HStack {
                        (
                            Text("Bem-vindo ao ").foregroundColor(Theme.font) +           Text("M").foregroundColor(Theme.action)
                            +           Text("o").foregroundColor(Theme.secondary)
                            +           Text("n").foregroundColor(Theme.tertiary)
                            +
                            Text("D").foregroundColor(Theme.action)
                            +           Text("a").foregroundColor(Theme.secondary)
                            +           Text("y").foregroundColor(Theme.tertiary)
                            
                        )
                        .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                        .tracking(2)
                        .padding(.bottom)
                        Text(":)")
                            .font(.system(size: 45.0, weight: .heavy, design: .rounded))
                            .foregroundColor(Theme.font)
                            .tracking(2)
                            .padding(.bottom)
                            .rotationEffect(Angle(degrees: 110))
                        
                    }
                    Spacer()
                    VStack {
                        Text("Minha idade é")
                            .font(.system(size: 40.0, weight: .heavy, design: .rounded))
                            .foregroundColor(Theme.font)
                            .tracking(2)
                            .padding(.bottom, 30)
                        TextField("", text: $age)
                            .frame(width: 662, height: 80)
                            .background(Color(cgColor: UIColor(red: 0.817, green: 0.817, blue: 0.817, alpha: 0.24).cgColor))
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 40)
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("próximo")
                    // executar função para salvar novos dados usando Name e Age
                } label: {
                    Text("Próximo")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundColor(Theme.action)
                        .tracking(2)
                }
                .disabled(age.isEmpty)
            }
            ToolbarItem(placement: .principal) {
                Text("Editar Perfil")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(Theme.font)
                    .tracking(2)
            }
        }
    }
}

struct RegisterAgeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAgeView()
    }
}
