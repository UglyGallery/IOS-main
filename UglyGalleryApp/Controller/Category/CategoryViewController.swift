//
//  CategoryViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 06.03.2024.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    
    var categoryViewModel = CategoryViewModel()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let categoryCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSearchController()
        createSubviews()
    }
}

//MARK:  Extension CategoryViewController
private extension CategoryViewController {
    
    func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Поиск картин"
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func createSubviews() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifaer)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        view.addSubview(categoryCollectionView)
        
        categoryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK:  UICollectionViewDataSource, UICollectionViewDelegate
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifaer, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let categoryContent = categoryViewModel.categories.safeObject(at: indexPath.row)
        cell.configureUI(category: categoryContent)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 1 * 10)
        
        return CGSize(width: width, height: 50)
    }
}

//MARK:  Search Controller Functions
extension CategoryViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        self.categoryViewModel.updateSearchController(searchBarText: searchController.searchBar.text)
    }
}
