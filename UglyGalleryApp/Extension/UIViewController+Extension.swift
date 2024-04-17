//
//  UIViewController+Exstension.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 10.03.2024.
//

import UIKit

extension UIViewController {
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func createCustomTitleView(title: String, font: UIFont) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.frame = CGRect(x: -20, y: 12, width: 280, height: 20)
        titleLabel.font = font
        view.addSubview(titleLabel)
        
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
                        for: .normal
        )
        button.tintColor = .systemGray
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        
        return menuBarItem
    }
}
