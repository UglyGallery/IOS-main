//
//  OnboardingViewPresenter.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    weak var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passedonboarding = true
        coordinator?.finish()
    }
}

