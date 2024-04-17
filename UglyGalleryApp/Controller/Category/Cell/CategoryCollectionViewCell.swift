//
//  CategoryCollectionViewCell.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 12.03.2024.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifaer = "cell"
    
    private let titleLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLable.frame = contentView.bounds
        
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(category: CategoryModel?) {
        self.titleLable.text = category?.titleCategory
    }
}

//MARK: CategoryCollectionViewCell
extension CategoryCollectionViewCell {
    
    func createSubviews() {
        titleLable.textColor = .black
        titleLable.textAlignment = .center
        titleLable.font = .systemFont(ofSize: 14)
        titleLable.layer.borderWidth = 2
        titleLable.layer.masksToBounds = true
        titleLable.layer.borderColor = UIColor.systemGray3.cgColor
        titleLable.layer.cornerRadius = 20
        contentView.addSubview(titleLable)
        
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(120)
            make.height.equalTo(42)
        }
    }
}
