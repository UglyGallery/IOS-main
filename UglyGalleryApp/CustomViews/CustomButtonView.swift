//
//  CustomButtonView.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 07.04.2024.
//

import UIKit
import SnapKit

enum CustomButtonColor {
    case black
    case green
    case white
}

class CustomButtonView: UIView {
    private let customButton = UIButton()
    
    var buttonAction: (() -> Void)?
    
    var buttonColor: CustomButtonColor = .white {
        didSet {
            setColorScheme(scheme: buttonColor)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
    
    func setupButton() {
        addSubview(customButton)
        customButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        customButton.layer.cornerRadius = 20
        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        
        customButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        setColorScheme(scheme: .white)
    }
    
    @objc private func customButtonTapped() {
        guard let buttonAction = self.buttonAction else { return }
        buttonAction()
    }
    
    func setColorScheme(scheme: CustomButtonColor) {
        switch scheme {
        case .black:
            customButton.backgroundColor = .black
            customButton.setTitleColor(.white, for: .normal)
        case .green:
            customButton.backgroundColor = .green
            customButton.setTitleColor(.black, for: .normal)
        case .white:
            customButton.backgroundColor = .clear
            customButton.setTitleColor(.white, for: .normal)
            customButton.layer.borderWidth = 2
            customButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    public func setTitleButton(title: String?) {
        customButton.setTitle(title, for: .normal)
    }
}
