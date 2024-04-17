//
//  HomeViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var galleryViewModel = HomeGalleryViewModel()
    
    private var galleryCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createNavbarItem()
        createSubview()
        makeConstrants()
        loadGalleryData()
    }
}

//MARK: HomeViewController Layout
extension HomeViewController {
    
    func createNavbarItem() {
        self.navigationItem.title = "UG"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "American Typewriter Bold", size: 32), size: 32)]
    }
    
    func createSubview() {
        galleryCollectionView.register(UglyGalleryCollectionViewCell.self, forCellWithReuseIdentifier: UglyGalleryCollectionViewCell.identifier)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        view.addSubview(galleryCollectionView)
    }
    
    func makeConstrants() {
        galleryCollectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func loadGalleryData() {
        DispatchQueue.main.async {
            self.galleryViewModel.fetchGallery()
            self.galleryViewModel.galleryDelegate = self
        }
    }
}

//MARK: ReloadData
extension HomeViewController: Services {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.galleryCollectionView.reloadData()
        }
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.homeGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UglyGalleryCollectionViewCell.identifier, for: indexPath) as? UglyGalleryCollectionViewCell else { return UICollectionViewCell() }
        
        let galleryContent = galleryViewModel.homeGallery.safeObject(at: indexPath.row)
        cell.galleryImages = galleryContent
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 15) / 2
        
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

