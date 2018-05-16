//
//  PurchaseViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/5/14.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

protocol PurchaseViewControllerDelegate:class{
    func purchaseViewControllerBenefitButtonTapped(tag:Int)
}

class PurchaseViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backgroundView: UIVisualEffectView!
    @IBOutlet weak var dialog: DesignableView!
    @IBOutlet weak var titleLabelWidthCons: NSLayoutConstraint!
    @IBOutlet weak var benefitsBackground: UIVisualEffectView!
    
    @IBOutlet weak var buy1View: DesignableView!
    @IBOutlet weak var buy2View: DesignableView!
    @IBOutlet weak var buy3View: DesignableView!
    
    @IBOutlet weak var price1Label: UILabel!
    @IBOutlet weak var price1FullLabel: UILabel!
    @IBOutlet weak var price2Label: UILabel!
    @IBOutlet weak var price2FullLabel: UILabel!
    @IBOutlet weak var price3Label: UILabel!
    @IBOutlet weak var price3FullLabel: UILabel!
    var priceLabels:[UILabel]!
    var fullPriceLabels:[UILabel]!
    weak var delegate:PurchaseViewControllerDelegate?
    let panToClose = InteractionPanToClose()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        dialog.alpha = 0
//        resetLabels()
        resetViews()
        setPanToClose()
        setTapToClose()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SpringDialog.animateAppear(dialogView: dialog)
        animatedViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    func resetLabels(){
        priceLabels = [price1Label,price2Label,price3Label]
        fullPriceLabels = [price1FullLabel,price2FullLabel,price3FullLabel]
        for priceLabel in priceLabels{
            priceLabel.text = ""
            priceLabel.alpha = 0
            priceLabel.transform = CGAffineTransform(translationX: 0, y: 5)
        }
        
        for fullPriceLabel in fullPriceLabels{
            fullPriceLabel.text = ""
            fullPriceLabel.alpha = 0
            fullPriceLabel.transform = CGAffineTransform(translationX: 0, y: 5)
        }
    }
    
    func resetViews(){
        buy1View.alpha = 0
        buy1View.transform = CGAffineTransform(translationX: 0, y: 10)
        buy2View.alpha = 0
        buy2View.transform = CGAffineTransform(translationX: 0, y: 15)
        buy3View.alpha = 0
        buy3View.transform = CGAffineTransform(translationX: 0, y: 20)
    }
    

    
    func animatedViews(){
        
        delay(delay: 0.2) {
            let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.5) {
                self.buy1View.alpha = 1
                self.buy1View.transform = CGAffineTransform.identity
            }
            animator.startAnimation()
        }
        
        delay(delay: 0.3) {
            let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.5) {
                self.buy2View.alpha = 1
                self.buy2View.transform = CGAffineTransform.identity
            }
            animator.startAnimation()
        }
        
        delay(delay: 0.4) {
            let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.5) {
                self.buy3View.alpha = 1
                self.buy3View.transform = CGAffineTransform.identity
            }
            animator.startAnimation()
        }
    }
    
    func animatedLabels(){
        UIView.animate(withDuration: 0.5) {
            for priceLabel in self.priceLabels{
                priceLabel.alpha = 1
                priceLabel.transform = CGAffineTransform.identity
            }
            
            for fullPriceLabel in self.fullPriceLabels{
                fullPriceLabel.alpha = 1
                fullPriceLabel.transform = CGAffineTransform.identity
            }
        }
    }
    
    @IBAction func clickDiscountBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "purchaseToDiscount", sender: nil)
    }
    
    @IBAction func clickBenefitsBtns(button:UIButton){
        let tag = button.tag
        dismiss(animated: true) {
            self.delegate?.purchaseViewControllerBenefitButtonTapped(tag: tag)
        }
    }
    
    
    @IBAction func clickBuy1Btn(_ sender: UIButton) {
        purchase()
    }
    
    @IBAction func clickBuy2Btn(_ sender: UIButton) {
        purchase()
    }
    
    @IBAction func clickBuy3Btn(_ sender: UIButton) {
        purchase()
    }
    
    func purchase(){
        showAlert(title: "Purchase not enabled for sample code",
                  message: "Subscription feature will be enabled on the live app.")
    }
    
    @IBAction func clickRestorePurchase(_ sender: UIButton) {
        showAlert(title: "Purchase not enabled for sample code",
                  message: "Subscription feature will be enabled on the live app.")
    }
    
}

// MARK: - TapToClose
extension PurchaseViewController:UIGestureRecognizerDelegate{
    func setTapToClose(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        tap.delegate = self
        scrollView.addGestureRecognizer(tap)
    }
    
    @objc func closeButtonTapped(){
        SpringDialog.animateClose(dialogView: dialog, backgroundView: backgroundView) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: dialog))!{
            return false
        }
        return true
    }
}

// MARK: - PanToClose
extension PurchaseViewController{
    func setPanToClose(){
        panToClose.viewController = self
        panToClose.backgroundView = backgroundView
        panToClose.dialogView = dialog
        panToClose.scrollView = scrollView
        panToClose.isDialogDropResetting = true
        panToClose.setPangesture()
    }
}
