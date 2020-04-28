//
//  UIImageViewExtension.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 26/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

typealias completionBlock = (_ image: UIImage) -> Void

extension UIImageView {
    func image(from url: String, placeholderImage: String? = nil) {
        let temporalImage = UIImage(named: placeholderImage ?? "")
        self.image = temporalImage
        downloadImage(urlString: url) { image in
            self.image = image
        }
    }
    
    private func downloadImage(urlString: String, completion: @escaping completionBlock) {
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async() {
                completion(image)
            }
        }.resume()
    }
}
