//
//  HomeGalleryViewModel.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 09.03.2024.
//

import UIKit

class HomeGalleryViewModel {
    
    var homeGallery: [GalleryModel] = [] {
        didSet {
            self.galleryDelegate?.reloadData()
        }
    }
    weak var galleryDelegate: Services?
    private let manager = ApiManager()
    
    func fetchGallery() {
        manager.apiRequest(url: Constant.galleryURL, expecting: [GalleryModel].self) { [weak self] result in
            switch result {
            case .success(let newImage):
                DispatchQueue.main.async {
                    self?.homeGallery = newImage
                }
            case .failure(let error):
                print("Error viewModel: \(error)")
            }
        }
    }
}

