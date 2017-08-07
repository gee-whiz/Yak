//
//  AvatarCell.swift
//  Yak
//
//  Created by George Kapoya on 2017/08/01.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit


enum AvatarType {
    case dark
    case light
}


class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    
    func configureCell(index: Int, type: AvatarType){
        
        if type == AvatarType.dark {
            self.imgAvatar.image = UIImage(named: "dark\(index)")
               self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
              self.imgAvatar.image = UIImage(named: "light\(index)")
               self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        
    }
    
    func setupView() {
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds  = true
    }
}
