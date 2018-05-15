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
    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var getTheBookBtn: DesignableButton!
    @IBOutlet weak var chapter1TitleLabel: DesignableLabel!
    @IBOutlet weak var chapter1CollectionView: UICollectionView!
    @IBOutlet weak var chapter2TitleLabel: DesignableLabel!
    @IBOutlet weak var chapter2CollectionView: UICollectionView!
    @IBOutlet weak var chapter3TitleLabel: DesignableLabel!
    @IBOutlet weak var chapter3CollectionView: UICollectionView!
    
    @IBOutlet weak var benefitContentView: UIView!
    @IBOutlet weak var benefitContentViewHeight: NSLayoutConstraint!

    /// Scroll parallax
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configureCollectionViews()
        configureTitleLabels()
        if appHasWideScreenForView(self.view){
            backgroundImage.contentMode = .scaleToFill
        }
        checkLogin()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        checkLogin()
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func configureCollectionViews(){
        configure(collectionView: chapter1CollectionView)
        configure(collectionView: chapter2CollectionView)
        configure(collectionView: chapter3CollectionView)
    }
    
    private func configureTitleLabels(){
        chapter1TitleLabel.text = ""
        chapter2TitleLabel.text = ""
        chapter3TitleLabel.text = ""
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("screen change")
    }
    

    /// MARK: - Actions
    @IBAction func clickPlayVideoBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToBuyBook(_ sender: DesignableButton) {
        performSegue(withIdentifier: "homeToPurchase", sender: nil)
    }
    
    
    @IBAction func clickLoginBtn(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "homeToLogin", sender: nil)
    }
    
    
    @IBAction func clickLogoBtn(_ sender: UIBarButtonItem) {
//        let tabVc = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController
//        tabVc?.selectedIndex = 4
        self.tabBarController?.selectedIndex = 4
    }
    
    
    func checkLogin(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
}


// MARK: - <#UICollectionViewDataSource#>
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate{

    private func configure(collectionView:UICollectionView){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
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


// MARK: - <#UIScrollViewDelegate#>
extension HomeViewController:UIScrollViewDelegate{
    
}
