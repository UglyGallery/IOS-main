//
//  AlertManager.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 09.03.2024.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Попробуйте снова!", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

// MARK: Show Validation Alerts
extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Некорректный адрес почты", message: "Введите пожалйста корректный адрес почты.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Некорректный пароль", message: "Введите пожалйста корректный пароль.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Некорректное имя пользователя", message: "Введите пожалйста корректное имя пользователя.")
    }
}


// MARK: Registration Errors
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Произола ошибка при регистрации", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: String) {
        self.showBasicAlert(on: vc, title: "Произола ошибка при регистрации", message: "\(error)")
    }
}


// MARK: Log In Errors
extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Произола ошибка при входе", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: String) {
        self.showBasicAlert(on: vc, title: "Ошибка входа", message: "\(error)")
    }
}


// MARK: Logout Errors
extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
}


// MARK: Forgot Password
extension AlertManager {

    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Отправлен сброс пароля", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: String) {
        self.showBasicAlert(on: vc, title: "Ошибка при отправке пароля для сброса", message: "\(error)")
    }
}


// MARK: Fetching User Errors
extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Ошибка при вызове пользователя", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Неизвестная ошибка при вызове пользователя", message: nil)
    }
}
