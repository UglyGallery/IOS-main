//
//  CategoryViewModel.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 12.03.2024.
//

import UIKit

class CategoryViewModel {
    
    var onGalleryWorkUpdated: (() -> Void)?
    
    private(set) var allGalleryWork: [GalleryModel] = [] {
        didSet {
            self.onGalleryWorkUpdated?()
        }
    }
    private(set) var filteredGalleryWork: [GalleryModel] = []
    
    var categories = [CategoryModel]()
    
    init() {
        setup()
    }
    
    func setup() {
        let food = CategoryModel(id: 0, titleCategory: "Еда")
        let clothes = CategoryModel(id: 1, titleCategory: "Одежда")
        let art = CategoryModel(id: 2, titleCategory: "Исскуство")
        let object = CategoryModel(id: 3, titleCategory: "Предметы")
        let plant = CategoryModel(id: 4, titleCategory: "Растения")
        let abstraction = CategoryModel(id: 5, titleCategory: "Абстракция")
        let streetPhoto = CategoryModel(id: 6, titleCategory: "Уличные фото")
        let other = CategoryModel(id: 7, titleCategory: "Другое")
        
        [food, clothes, art, object, plant, abstraction, streetPhoto, other].forEach {
            categories.append($0)
        }
    }
}

// MARK:  Search
extension CategoryViewModel {
    
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?) {
        self.filteredGalleryWork = allGalleryWork
        
        if let searchText = searchBarText?.lowercased() {
            guard !searchText.isEmpty else { self.onGalleryWorkUpdated?(); return }
            
            self.filteredGalleryWork = self.filteredGalleryWork.filter {
                $0.title.lowercased().contains(searchText)
            }
        }
        self.onGalleryWorkUpdated?()
    }
}

