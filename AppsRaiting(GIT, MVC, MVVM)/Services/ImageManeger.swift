//
//  ImageMeneger.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

class ImageManeger {
    
    static let shared = ImageManeger()
    
    func getImageData(from imageURL: String) -> Data? {
        guard let imageURL = URL(string: imageURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
