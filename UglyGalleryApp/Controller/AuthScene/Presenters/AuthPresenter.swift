//
//  AuthViewPresenter.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 01.04.2024.
//

import Foundation
import UIKit

protocol AuthViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registarationStart()
    func goToSignIn()
    func goToSignUp()
    func goToForgot()
    func onBack()
}

class AuthPresenter {
    
    private var coordinator: AuthCoordinator?
    weak var viewInput: AuthViewInput?
    
    init(coordinator: AuthCoordinator? = nil, viewInput: AuthViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

//MARK: AuthPresenter
private extension AuthPresenter {
    
    func goToMainScreen() {
        coordinator?.finish()
    }
}

//MARK: AuthPresenter: AuthViewOutput
extension AuthPresenter: AuthViewOutput {
    
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            DispatchQueue.main.async {
                self.viewInput?.stopLoader()
                self.goToMainScreen()
            }
        }
    }
    
    func registarationStart() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgot() {
        
    }
    
    func onBack() {
        
    }
}
