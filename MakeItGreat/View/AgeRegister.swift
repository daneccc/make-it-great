//
//  AgeRegister.swift
//  MakeItGreat
//
//  Created by Natalia Locatelli Barbosa on 10/12/22.
//

import SwiftUI

struct AgeRegister: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var score = 0
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("Bemvindo")
                    .padding(.top, 50)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(Text("Voltar"), action: {self.presentationMode.wrappedValue.dismiss()})
//                    NavigationLink(destination: ContentView()) {
//                        Text("Voltar")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
//                    }
//                    .padding(.leading, 20)
//                    .padding(.top, 20)
                }
            }
            .padding(.top, 50)
            VStack {
                Text("Minha idade é")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color("textcolor"))
                    .padding(.top, 250)
                TextField("", value: $score, format: .number)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 20, design: .rounded))
                    .padding(.top, 40)
                Divider()
                    .frame(maxWidth: 458, minHeight: 3)
                    .overlay(Color.blue)
                Spacer()
            }
        }
        
    }
    
}


struct AgeRegister_Previews: PreviewProvider {
    static var previews: some View {
        AgeRegister()
    }
}
