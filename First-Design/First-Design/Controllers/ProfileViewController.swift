//
//  ProfileViewController.swift
//  First-Design
//
//  Created by عبدالعزيز رضا  on 1/24/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    

    @IBOutlet weak var storyVC: UICollectionView!
    @IBOutlet weak var photosCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        storyVC.delegate = self
        storyVC.dataSource = self
        photosCV.delegate = self
        photosCV.dataSource = self
        photosCV.registerCell(cellClass: PhotosCollectionViewCell.self)
        storyVC.registerCell(cellClass: StoryCell.self)  
    }
    
    
    



}

extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource{
 
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == storyVC.self{
            
            return 10
        }else{
        
        return 30
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if collectionView == storyVC.self {
            
            let cell = collectionView.dequeue(indexPath: indexPath) as StoryCell
                  return cell
        } else{
            
            let cell = collectionView.dequeue(indexPath: indexPath) as PhotosCollectionViewCell
                           return cell
        }
        
        
    }
    
}

extension ProfileViewController:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == storyVC.self{
            return CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 4)
        }else{
            
            return CGSize(width: view.frame.width / 2.3 , height: 200)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == storyVC.self{
            return 0.1
        }else{
            return 0.1
        }
    }
}


