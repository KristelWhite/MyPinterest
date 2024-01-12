//
//  UIImageView+ImageLoader .swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation
import UIKit


extension UIImageView {
    
    func loadImage(from url: URL){
        ImageLoader().loadImage(from: url) { [weak self] result in
            if case let .success(image) = result {
                self?.image = image
            }
        }
    }
}
