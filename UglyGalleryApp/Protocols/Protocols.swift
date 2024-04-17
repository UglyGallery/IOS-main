//
//  Protocols.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 06.03.2024.
//

import UIKit

protocol Services: AnyObject {
    func reloadData()
}

protocol ApiRequest {
    func apiRequest<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, ApiError>) -> Void)
}
