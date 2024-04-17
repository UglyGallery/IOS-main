//
//  ApiError.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 06.03.2024.
//

import UIKit

enum ApiError: String, Error {
    case urlError = "Ошибка вызова URL-адресса"
    case serverError = "Сервер не отвечает"
    case invalidResponse = "Ошибка запроса сети"
    case decodingError = "При декодировании произошла ошибка"
}
