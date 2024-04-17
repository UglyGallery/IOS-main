//
//  OnboardingCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    private let facoty = SceneFactory.self
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("Finish OnboardingCoordinator")
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    
    func showOnboarding() {
        let viewController = facoty.makeOnboardingScene(coordnator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

