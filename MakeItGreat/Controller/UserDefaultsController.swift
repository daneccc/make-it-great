//
//  UserDefaultsHelper.swift
//  MakeItGreat
//
//  Created by Ayslana Riene on 11/12/22.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case nameUser = "nameUser"
        case ageUser = "ageUser"
    }

    func setChildName(value: String) {
        set(value, forKey: UserDefaultsKeys.nameUser.rawValue)
    }

    func getChildName() -> String? {
        return string(forKey: UserDefaultsKeys.nameUser.rawValue)
    }
    
    func setChildAge(value: String) {
        set(value, forKey: UserDefaultsKeys.ageUser.rawValue)
    }

    func getChildAge() -> String? {
        return string(forKey: UserDefaultsKeys.ageUser.rawValue)
    }
}
