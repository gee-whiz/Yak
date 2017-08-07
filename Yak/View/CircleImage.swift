//
//  File.swift
//  Yak
//
//  Created by George Kapoya on 2017/08/06.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import Foundation


@IBDesignable
class CircleImage: UIImageView {
    
    
    override func awakeFromNib() {
        setupView()
    }
    
    
    
    func setupView() {
        
        self.layer.cornerRadius  = self.frame.width / 2
        self.clipsToBounds  = true
        
    }
    
    
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
