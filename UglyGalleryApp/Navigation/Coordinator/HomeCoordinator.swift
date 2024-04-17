//
//  HomeCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}
