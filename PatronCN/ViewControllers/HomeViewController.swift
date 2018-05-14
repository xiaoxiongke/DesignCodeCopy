//
//  HomeViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/4/27.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var chapter1CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chapter1CollectionView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 4000)
        chapter1CollectionView.contentSize = CGSize(width: 1200, height: view.frame.height)
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController:UICollectionViewDataSource{
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
