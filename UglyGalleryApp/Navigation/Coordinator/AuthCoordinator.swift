//
//  AuthCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 17.04.2024.
//

import UIKit

class AuthCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
       showAuthScene()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("Finish AuthCoordinator")
    }
}

//MARK: AuthCoordinator
extension AuthCoordinator {
    
    func showAuthScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSignInScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSignUpScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
