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
            Spacer()
        }
    }
}

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
    var body: some View {
        Text("What?")
            .font(.title)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
