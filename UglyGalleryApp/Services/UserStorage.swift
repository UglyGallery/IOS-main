//
//  UserStorage.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 27.03.2024.
//

import Foundation

class UserStorage {
    
    static let shared = UserStorage()
    
    var passedonboarding:  Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: "passedOnboarding") }
    }
}
