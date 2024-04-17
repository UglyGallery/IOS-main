//
//  LabelComponents.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit

enum Label: String {
    case enter = "Вход"
    case accountAdd = "Создайте аккаунт"
    case settings = "Настройки "
    case userName = "Имя пользовотеля"
    case email = "Email"
    case password = "Пароль"
    case authorName = "Имя автора"
    case descriptionTitle = "Описание"
    case id = "id"
    case intelligence = "Сведения о себе"
    case webSite = "Веб-сайт"
    case title = "Название"
    case description = "Описание "
    case link = "Ссылка"
}


class LabelType: UILabel {
    
    private let type: Label
    
    init(type: Label) {
        self.type = type
        super.init(frame: .zero)
        createLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LabelType {
    
    func createLabels() {
        text = type.rawValue
        font = .systemFont(ofSize: 16)
        textColor = .gray
        
        
        if type == .accountAdd || type == .enter || type == .settings {
            textAlignment = .left
            font = .boldSystemFont(ofSize: 24)
            textColor = .black
        } else if type == .authorName || type == .descriptionTitle {
            textAlignment = .left
            font = .systemFont(ofSize: 20)
            textColor = .black
        }
    }
}
