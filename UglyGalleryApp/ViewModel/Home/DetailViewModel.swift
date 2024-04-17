//
//  DetailViewModel.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 10.03.2024.
//

import UIKit

class DetailViewModel {
    
    var details: GalleryModel?
    
    init(detail: GalleryModel?) {
        self.details = detail
    }
    
    var imageWork: String? {
        return details?.url
    }
    
    var description: String? {
        return details?.title
    }
}

