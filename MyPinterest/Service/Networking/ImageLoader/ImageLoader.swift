//
//  ImageLoader.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation
import UIKit

struct ImageLoader {
     
    var session = URLSession(configuration: .default)
    
    func loadImage( from url: URL, _ onLoadWasCompleted: @escaping (_ result: Result<UIImage, Error>) -> Void) {
        
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                onLoadWasCompleted(.failure(error))
            } else if let data = data, let image = UIImage(data: data) {
                onLoadWasCompleted(.success(image))
            }
            
        }.resume()
    }
}

