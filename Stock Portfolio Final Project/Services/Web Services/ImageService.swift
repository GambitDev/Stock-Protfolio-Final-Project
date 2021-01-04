//
//  ImageService.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 03/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class ImageService {
    
    // MARK: - Properties
    public static let shared = ImageService()
    let imageCache = NSCache<NSString, UIImage>()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Functions
    func getImage(from urlString: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: urlString) else { completion(nil); return }
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            completion(imageFromCache)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print(error as Any)
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                completion(imageToCache)
                
                if let imageToCache = imageToCache {
                    self.imageCache.setObject(imageToCache, forKey: urlString as NSString)
                }
            }
        }.resume()
    }
}
