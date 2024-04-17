//
//  TextFieldComponents.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit

enum TextField {
    case userName
    case email
    case password
    case id
    case intelligence
    case webSite
    case title
    case description
    case link
}

class TextFieldType: UITextField {
    
    private let type: TextField
    
    init(type: TextField) {
        self.type = type
        super.init(frame: .zero)
        createTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TextFieldType {
    
    func createTextField() {
        clearButtonMode = .whileEditing
        font = .boldSystemFont(ofSize: 18)
        borderStyle = .roundedRect
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        returnKeyType = .next
        
        switch type {
        case .userName:
            keyboardType = .default
            tag = 0
        case .email:
            keyboardType = .emailAddress
            returnKeyType = .done
            tag = 1
        case .password:
            keyboardType = .alphabet
            isSecureTextEntry = true
            tag = 0
        case .id:
            keyboardType = .numberPad
            returnKeyType = .done
            tag = 3
        case .intelligence:
            keyboardType = .alphabet
            returnKeyType = .done
            tag = 4
        case .webSite:
            keyboardType = .default
            returnKeyType = .done
            tag = 5
        case .title:
            keyboardType = .default
            returnKeyType = .done
            tag = 6
        case .description:
            keyboardType = .default
            returnKeyType = .done
            tag = 7
        case .link:
            keyboardType = .default
            returnKeyType = .done
            tag = 8
        }
    }
}
