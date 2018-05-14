//
//  BookmarksViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/4/28.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {

    @IBOutlet weak var chapter1CV: UICollectionView!
    
    
    @IBOutlet weak var chapter2CV: UICollectionView!
    
    @IBOutlet weak var chapter3CV: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}


extension ChaptersViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chapter1", for: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

