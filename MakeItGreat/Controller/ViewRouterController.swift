//
//  ViewRouterHelper.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: String = ""
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "RegisterNameView"
        } else {
            if UserDefaults.standard.getChildName() == nil {
                currentPage = "RegisterNameView"
            } else if UserDefaults.standard.getChildAge() == nil {
                currentPage = "RegisterNameView"
            } else if UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                currentPage = "HomeScreenView"
            }
        }
    }
}
