//
//  MotherView.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            if viewRouter.currentPage == "RegisterNameView" {
                RegisterNameView()
            } else if viewRouter.currentPage == "HomeScreenView" {
                HomeScreenView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
