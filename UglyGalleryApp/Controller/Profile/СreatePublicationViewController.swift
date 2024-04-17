//
//  СreatePublicationViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 13.03.2024.
//

import UIKit
import SnapKit

class СreatePublicationViewController: UIViewController {
    
    private let plugImage = UIImageView()
    private let titleLabel = LabelType(type: .title)
    private let descriptionLabel = LabelType(type: .description)
    private let linkLabel = LabelType(type: .link)
    
    private let titleTextField = TextFieldType(type: .title)
    private let descriptionTextField = TextFieldType(type: .description)
    private let linkTextField = TextFieldType(type: .link)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createNavbarItem()
        createSubviews()
        addSubviews()
        makeConstraints()
    }
}

extension СreatePublicationViewController {
    
    func createNavbarItem() {
        createCustomNavigationBar()
        navigationItem.title = "Создать публикацию"
    }
    
    func createSubviews() {
        plugImage.image = UIImage()
        plugImage.backgroundColor = .gray
        plugImage.layer.cornerRadius = 10
    }
    
    func addSubviews() {
        [plugImage, titleLabel, descriptionLabel, linkLabel, titleTextField, descriptionTextField, linkTextField].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        plugImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(236)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(359)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(384)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(454)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(479)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        linkLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(549)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        linkTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(574)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
}
