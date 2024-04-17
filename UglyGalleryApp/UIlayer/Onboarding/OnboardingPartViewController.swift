//
//  OnboardingPartViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 26.03.2024.
//

import UIKit
import SnapKit

class OnboardingPartViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
    var buttonText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        makeConstraints()
    }
}

private extension OnboardingPartViewController {
    
    func setupImageView() {
        view.insertSubview(imageView, at: 0)
    }
    
    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

