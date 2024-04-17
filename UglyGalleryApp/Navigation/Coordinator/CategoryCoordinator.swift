//
//  CategoryCoordinator.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 22.03.2024.
//

import UIKit

class CategoryCoordinator: Coordinator {
    
    override func start() {
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}

