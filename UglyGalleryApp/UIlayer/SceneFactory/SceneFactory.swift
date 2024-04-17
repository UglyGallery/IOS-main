//
//  SceneFactory.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 01.04.2024.
//

import UIKit

struct SceneFactory {
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> OnboardingCoordinator {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        
        return onboardingCoordinator
    }
    
    static func makeAuthFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> AuthCoordinator {
        let authCoordinator = AuthCoordinator(type: .auth, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(authCoordinator)
        
        return authCoordinator
    }
    
    static func makeOnboardingScene(coordnator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(named: "background")
        firstVC.buttonText = "Далее"
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(named: "background")
        secondVC.buttonText = "Далее"
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(named: "background")
        thirdVC.buttonText = "Далее"
        
        [firstVC, secondVC, thirdVC].forEach {
            pages.append($0)
        }
        
        let presenter = OnboardingViewPresenter(coordinator: coordnator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabbarViewController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let categoryNavigationController = UINavigationController()
        let categoryCoordinator = CategoryCoordinator(type: .category, navigationController: categoryNavigationController)
        categoryNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "menuSearch"), tag: 1)
        categoryCoordinator.finishDelegate = finishDelegate
        categoryCoordinator.start()
        
        let favouriteNavigationController = UINavigationController()
        let favouriteCoordinator = FavouritsCoordinator(type: .favourites, navigationController: favouriteNavigationController)
        favouriteNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart"), tag: 2)
        favouriteCoordinator.finishDelegate = finishDelegate
        favouriteCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "userTB"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        [homeCoordinator, categoryCoordinator, favouriteCoordinator, profileCoordinator].forEach {
            coordinator.addChildCoordinator($0)
        }
        
        let tabBarControllers = [homeNavigationController, categoryNavigationController, favouriteNavigationController, profileNavigationController]
        let tabBarController = TabbarViewController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
    
    static func makeAuthScene(coordinator: AuthCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let conntroller = AuthViewController(viewOutput: presenter, state: .initil)
        presenter.viewInput = conntroller
        return conntroller
    }
    
    static func makeSignInScene(coordinator: AuthCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let conntroller = AuthViewController(viewOutput: presenter, state: .signIn)
        presenter.viewInput = conntroller
        
        return conntroller
    }
    
    static func makeSignUpScene(coordinator: AuthCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let conntroller = AuthViewController(viewOutput: presenter, state: .signUp)
        presenter.viewInput = conntroller
        
        return conntroller
    }
}
