//
//  AvatarPickerVC.swift
//  Yak
//
//  Created by George Kapoya on 2017/08/01.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit




class AvatarPickerVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var avaatarType = AvatarType.dark
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  28
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            
            cell.configureCell(index: indexPath.item, type: self.avaatarType)
             return cell
        }
        
        return AvatarCell()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avaatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
           UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfClumns: CGFloat = 3
        if UIScreen.main.bounds.width  > 320 {
            numberOfClumns = 4
        }
        let spaceBetweenCells:CGFloat = 10
        let padding:CGFloat = 40
        let cellDimension = ((self.collectionView.bounds.width - padding) - (numberOfClumns - 1) * spaceBetweenCells) / numberOfClumns
        return CGSize(width: cellDimension, height: cellDimension)
        
    }
    
    
    @IBAction func segmentControlTapped(_ sender: Any) {
        
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            self.avaatarType = .dark
           break
        case 1:
            self.avaatarType = .light
        default:
            avaatarType  = .dark
        }
        
        self.collectionView.reloadData()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
