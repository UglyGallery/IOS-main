//
//  TabbarViewController\.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        setTabbarAppearance()
    }
}

//MARK: TabbarViewController Position
private extension TabbarViewController {
     
    func setTabbarAppearance() {
        let positionOnX: CGFloat = 60
        let positionOnY: CGFloat = 6
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY         
        let roundLayer = CAShapeLayer()
        
        let bezierPatch = UIBezierPath(
            roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPatch.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 8
        tabBar.itemPositioning = .centered
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.shadowImage = UIImage()
        
        roundLayer.fillColor = UIColor.mainBlack.cgColor
        tabBar.tintColor = .tabbarItemAccent
        tabBar.unselectedItemTintColor = .tabbarItemLight
    }
}
