//
//  FavouritsCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

class FavouritsCoordinator: Coordinator {
    
    override func start() {
        let vc = FavouritesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}


