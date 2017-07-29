//
//  Extension.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit


extension UIColor {
    
    
    @nonobjc static let whiteSmoke = UIColor(red:247/255.0, green:247/255.0, blue:247/255.0, alpha:1)
    @nonobjc static let shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.5)
    @nonobjc static let primaryColor = UIColor(red:3/255.0, green:169/255.0, blue:244/255.0, alpha:1)
}


extension UIImage {
    var circle: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}

extension UIImage {
    static func favoriteImageForFavoritedState(_ favorited: Bool) -> UIImage {
        let imageName: String
        if favorited {
            imageName = "ic_favorite_border_white"
        } else {
            imageName = "ic_favorite_white"
        }
        return UIImage(named: imageName)!
    }
}

extension UIImage {
    
    func tintWithColor(color:UIColor)->UIImage {
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        context!.scaleBy(x: 1.0, y: -1.0)
        context!.translateBy(x: 0.0, y: -self.size.height)
        context!.setBlendMode(CGBlendMode.multiply)
        let rect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        context!.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context!.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
}
