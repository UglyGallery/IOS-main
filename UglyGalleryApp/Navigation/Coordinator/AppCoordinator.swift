//
//  AppCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

//MARK: - AppCoordinator
class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
//        UserDefaults.standard.removeObject(forKey: "passedOnboarding")
//        if userStorage.passedonboarding {
//            showAuth()
//        } else {
//            showOnboarding()
//        }
        showMain()
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    
    func showOnboarding() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    
    func showMain() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showAuth() {
        guard let navigationController = navigationController else { return }
        let authCoordinator = factory.makeAuthFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        authCoordinator.start()
    }
}

//MARK: FinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            showAuth()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .auth:
            showMain()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
 case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
