//
//  DetailViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 10.03.2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let userImage = UIImageView()
    private let authorNameLabel = LabelType(type: .authorName)
    private let imageWorkToUser = UIImageView()
    private let descriptionTitleLabel = LabelType(type: .descriptionTitle)
    private let descriptionWorkLabel = UILabel()
    private let hearthButton = UIButton(type: .system)
    private let infoButton = UIButton(type: .system)
    
//    private let detailTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createNavbarItem()
        createViews()
        createButtons()
        //configureUI()
        //createTableView()
        addSubviews()
        makeConstraints()
        //loadGalleryData()
    }
}

//MARK: Detail Layout
private extension DetailViewController {
    
    func createNavbarItem() {
        createCustomNavigationBar()
        
        let sharedButton = createCustomButton(imageName: "arrowshape.turn.up.right",
                                              selector: #selector(sharedButtonTapped)
        )
        
        let customTitle = createCustomTitleView(title: "Название работы", font: .systemFont(ofSize: 24, weight: .bold))
        
        navigationItem.rightBarButtonItem = sharedButton
        navigationItem.titleView = customTitle
    }
    
    func createViews() {
        userImage.image = UIImage(systemName: "person.circle")
        userImage.layer.cornerRadius = 50
        userImage.tintColor = .systemGray2
        
        descriptionWorkLabel.textColor = .black
        descriptionWorkLabel.textAlignment = .left
        descriptionWorkLabel.font = .systemFont(ofSize: 14)
        descriptionWorkLabel.numberOfLines = 0
    }
    
    func createButtons() {
        hearthButton.setImage(UIImage(systemName: "heart"), for: .normal)
        hearthButton.tintColor = .systemGray
        hearthButton.addTarget(self, action: #selector(hearthButtonTapped), for: .touchUpInside)
        
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.tintColor = .systemGray
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        [userImage, authorNameLabel, imageWorkToUser, descriptionTitleLabel, descriptionWorkLabel, hearthButton, infoButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(101)
            make.left.equalToSuperview().inset(40)
            make.size.equalTo(39)
        }
        
        authorNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(109)
            make.left.equalTo(userImage.snp.right).offset(10)
        }
        
        imageWorkToUser.snp.makeConstraints { make in
            make.top.equalTo(authorNameLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(307)
        }
        
        descriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageWorkToUser.snp.bottom).offset(25)
            make.left.equalToSuperview().inset(30)
        }
        
        descriptionWorkLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(25)
        }
        
        hearthButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(650)
            make.left.equalToSuperview().inset(152)
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(650)
            make.right.equalToSuperview().inset(152)
        }
    }

    @objc func sharedButtonTapped() {
        print("All good")
    }
    
    
    @objc func hearthButtonTapped() {
        
    }
    
    @objc func infoButtonTapped() {
        
    }
}


