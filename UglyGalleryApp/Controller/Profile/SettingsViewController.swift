//
//  SettingsViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 12.03.2024.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    private let settingslabel = LabelType(type: .settings)
    private let authorNameLabel = LabelType(type: .userName)
    private let idLabel = LabelType(type: .id)
    private let intelligenceLabel = LabelType(type: .intelligence)
    private let webSitelabel = LabelType(type: .webSite)
    
    private let authorNameTextField = TextFieldType(type: .userName)
    private let idTextField = TextFieldType(type: .id)
    private let intelligenceTextField = TextFieldType(type: .intelligence)
    private let webSiteTextField = TextFieldType(type: .webSite)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        makeConstraints()
    }
}

private extension SettingsViewController {
    
    func addSubviews() {
        [settingslabel, authorNameLabel, idLabel, intelligenceLabel, webSitelabel, authorNameTextField, idTextField, intelligenceTextField, webSiteTextField].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        settingslabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(115)
            make.left.equalToSuperview().inset(42)
            make.width.equalTo(239)
        }
        
        authorNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(165)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        authorNameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(190)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(265)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(290)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        intelligenceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(360)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        intelligenceTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(385)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        webSitelabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(455)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        webSiteTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(480)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
}
