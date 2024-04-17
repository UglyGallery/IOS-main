//
//  UIImage+Exstension.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 09.03.2024.
//

import UIKit

extension UIImageView {
    
    func loadImage(from urlImage: String) {
        guard let url = URL(string: urlImage) else {
            print("Error fetching image! 🥲")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Could load image from url: \(url)")
                return
            }
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
    
    func loadImageId(imageId: Int, from urlImage: String) {
        guard let url = URL(string: "\(urlImage)\(imageId)") else {
            print("Error fetching image! 🥲")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Could load image from url: \(url)")
                return
            }
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
