//
//  ProfileViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 06.03.2024.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let photoAuthor = UIImageView()
    private let redactorButton = UIButton(type: .system)
    private let nameAuthorLabel = UILabel()
    private let infoLabel = UILabel()
    private let settingsButton = UIButton(type: .system)
    private let helperButton = UIButton(type: .system)
    private let makeLabel = UILabel()
    private let addPublicationButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createNavbarItem()
        createSubviews()
        createButtons()
        addSubviews()
        makeConstrants()
    }
}

private extension ProfileViewController {
    
    func createNavbarItem() {
        createCustomNavigationBar()
        
        let sharedButton = createCustomButton(imageName: "arrowshape.turn.up.right",
                                              selector: #selector(sharedButtonTapped)
        )
        
        let bellButton = createCustomButton(imageName: "bell", selector: #selector(bellButtonTapped))
        
        navigationItem.rightBarButtonItems = [bellButton, sharedButton]
    }
    
    func createSubviews() {
        photoAuthor.image = UIImage(named: "user")
        photoAuthor.contentMode = .scaleAspectFill
        photoAuthor.layer.cornerRadius = 50
        
        nameAuthorLabel.text = "Имя автора"
        nameAuthorLabel.textColor = .black
        nameAuthorLabel.textAlignment = .center
        nameAuthorLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        infoLabel.text = "Информация"
        infoLabel.textColor = .gray
        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 16)
        
        makeLabel.text = "Пора создать новую публикацию"
        makeLabel.textColor = .black
        makeLabel.textAlignment = .center
        makeLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    func createButtons() {
        redactorButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        redactorButton.setTitleColor(.gray, for: .normal)
        redactorButton.addTarget(self, action: #selector(redactorButtonTapped), for: .touchUpInside)
        
        settingsButton.backgroundColor = .gray
        settingsButton.layer.cornerRadius = 10
        settingsButton.setTitle("Настройки", for: .normal)
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        
        helperButton.backgroundColor = .gray
        helperButton.layer.cornerRadius = 10
        helperButton.setTitle("Помощь", for: .normal)
        helperButton.setTitleColor(.black, for: .normal)
        helperButton.addTarget(self, action: #selector(helperButtonTapped), for: .touchUpInside)
        
        addPublicationButton.backgroundColor = .black
        addPublicationButton.layer.cornerRadius = 10
        addPublicationButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addPublicationButton.setTitleColor(.white, for: .normal)
        addPublicationButton.addTarget(self, action: #selector(addPublicationButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        [photoAuthor, nameAuthorLabel, infoLabel, makeLabel, redactorButton, settingsButton, helperButton, addPublicationButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstrants() {
        photoAuthor.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(69)
            make.centerX.equalToSuperview()
            make.size.equalTo(92)
        }
        
        redactorButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.left.equalTo(photoAuthor.snp.right).inset(2)
        }
        
        nameAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(photoAuthor.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameAuthorLabel.snp.bottom).inset(3)
            make.centerX.equalToSuperview()
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(260)
            make.left.equalToSuperview().inset(40)
            make.width.equalTo(128)
            make.height.equalTo(22)
        }
        
        helperButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(260)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(128)
            make.height.equalTo(22)
        }
        
        makeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(373)
            make.centerX.equalToSuperview()
            
        }
        
        addPublicationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(679)
            make.centerX.equalToSuperview()
            make.size.equalTo(60)
        }
    }
    
    @objc func sharedButtonTapped() {
        
    }
    
    @objc func bellButtonTapped() {
        
    }
    
    @objc func redactorButtonTapped() {
        
    }
    
    @objc func settingsButtonTapped() {
        
    }
    
    @objc func helperButtonTapped() {
        
    }
    
    @objc func addPublicationButtonTapped() {
        
    }
}
