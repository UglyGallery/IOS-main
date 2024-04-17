//
//  UglyGalleryCollectionViewCell.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class UglyGalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    private  let galleryImage = UIImageView()
    private let titleLabel = UILabel()
    
    var galleryImages: GalleryModel? {
        didSet {
            galleryConfigureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
        addSubViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UglyGalleryCollectionViewCell
private extension UglyGalleryCollectionViewCell {
    
    func createSubviews() {
        galleryImage.layer.cornerRadius = 20
        galleryImage.layer.masksToBounds = true
        galleryImage.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 14)
    }
    
    func addSubViews() {
        [galleryImage, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func makeConstraints() {
        galleryImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(5)
            make.width.equalTo(160)
            make.height.equalTo(180)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(galleryImage.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(5)
        }
    }
    
    func galleryConfigureUI() {
        guard let galleryImages else { return }
        galleryImage.loadImage(from: galleryImages.url)
        titleLabel.text = galleryImages.title
    }
}
