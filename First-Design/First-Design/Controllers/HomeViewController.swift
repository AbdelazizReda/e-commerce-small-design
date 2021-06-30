//
//  ViewController.swift
//  First-Design
//
//  Created by عبدالعزيز رضا  on 1/18/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var timer:Timer?
    var currentIndex = 0
    var itemsArray = ["zoz" , "zoz" , "zoz" , "zoz" , "zoz" , "zoz"]
    
    @IBOutlet weak var SliderCV: UICollectionView!
    @IBOutlet weak var ProudectCV: UICollectionView!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SliderCV.delegate = self
        SliderCV.dataSource = self
        ProudectCV.delegate = self
        ProudectCV.dataSource = self
        categoryCV.delegate = self
        categoryCV.dataSource = self
        setupUI()
        setTimer()
        pageControl.numberOfPages = itemsArray.count

    }
    
    
    
    func setupUI(){
        SliderCV.registerCell(cellClass: SliderCell.self)
        ProudectCV.registerCell(cellClass: ProductCell.self)
        categoryCV.registerCell(cellClass: CategoryCell.self)
    }
    
    //MARK:- Timer of slider and page controller
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(MoveToNextIndex), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func MoveToNextIndex(){
        if currentIndex < itemsArray.count - 1{
            currentIndex += 1
            
        }else{
            currentIndex = 0
            
        }
        SliderCV.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }
    
    
    
 //MARK:- Methods For CollectionView
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == SliderCV.self{
            return itemsArray.count
            
        }else if collectionView == ProudectCV.self{
            
            return itemsArray.count
        }else{
            
            return itemsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == SliderCV.self{
            let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
            return cell
            
        }else if collectionView == ProudectCV.self{
            
            let cell = collectionView.dequeue(indexPath: indexPath) as ProductCell
            return cell
        }else{
            
            let cell = collectionView.dequeue(indexPath: indexPath) as CategoryCell
            return cell
        }
        
    }

    
}
 //MARK:- Methods For CollectionView layout
extension HomeViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == SliderCV.self{
                   return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
                   
               }else if collectionView == ProudectCV.self{
                   
            return CGSize(width: self.view.frame.width / 3, height: collectionView.frame.height)
               }else{
                   
            return CGSize(width: collectionView.frame.width * 0.45, height: collectionView.frame.height)
               }
               
           }
        
       
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == SliderCV.self{
                return 0
                
            }else if collectionView == ProudectCV.self{
                
            return 5
            }else{
                
            return 4
            }
            
        }

    }
    
