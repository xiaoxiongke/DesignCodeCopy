//
//  ExercisesCell.swift
//  PatronCN
//
//  Created by eorin on 2018/4/28.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class ExercisesCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "ExercisesCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 550)
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
1    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension ExercisesCell:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExercisesCollectionViewCell.identifier, for: indexPath) as! ExercisesCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
