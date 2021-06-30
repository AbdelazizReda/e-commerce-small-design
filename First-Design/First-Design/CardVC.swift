//
//  CardVC.swift
//  First-Design
//
//  Created by عبدالعزيز رضا  on 2/22/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit

class CardVC: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    fileprivate func setupUI() {
        // Do any additional setup after loading the view.
        cardTableView.dataSource = self
        cardTableView.delegate = self
        cardTableView.registerCellNib(cellClass: CardCell.self)
    }
    
    

}
extension CardVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as CardCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = (storyboard?.instantiateViewController(identifier: "DetailsVC"))! as DetailsVC
        self.present(vc, animated: true, completion: nil)
    }
    
}
