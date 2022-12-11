//
//  CreateView.swift
//  MakeItGreat
//
//  Created by Daniele Cavalcante on 07/12/22.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        VStack {
            HeaderView()
                .padding()
            Divider()
            WhatView()
                .padding()
            Spacer()
        }
    }
}

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Text("Nova atividade")
            Spacer()
            Image(systemName: "xmark")
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .font(.title)
        .fontWeight(.bold)
    }
}

struct WhatView: View {
    @State private var activity: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("O que você planeja fazer?")
                .font(.title)
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: CGFloat(10))
                        .frame(width: 50, height: 50)
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
                VStack {
                    TextField("Descrição da atividade", text: $activity)
                        .font(.title2)
                    Divider()
                }
                .padding(.leading)
            }
            Spacer()
            Button(action: {}) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(.bordered)
        }
        
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
