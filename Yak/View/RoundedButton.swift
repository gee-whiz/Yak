//
//  RoundedButton.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/30.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable  var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView(){
       self.layer.cornerRadius = cornerRadius
    }
}
