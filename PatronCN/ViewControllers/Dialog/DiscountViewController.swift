//
//  DiscountViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/5/14.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class DiscountViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIVisualEffectView!
    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var scrollView: UIScrollView!
    let panToClose = InteractionPanToClose()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialogView.alpha = 0
        setPanToClose()
        setTapToClose()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        SpringDialog.animateAppear(dialogView: dialogView)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        SpringDialog.animateClose(dialogView: dialogView, backgroundView: backgroundView) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

// MARK: Pan to close
extension DiscountViewController {
    func setPanToClose() {
        panToClose.viewController = self
        panToClose.scrollView = scrollView
        panToClose.backgroundView = backgroundView
        panToClose.dialogView = dialogView
        panToClose.backgroundColorWhite = 1
        panToClose.setPangesture()
    }
}

// MARK: Tap background to close
extension DiscountViewController: UIGestureRecognizerDelegate {
    func setTapToClose() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        tap.delegate = self
        scrollView.addGestureRecognizer(tap)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: dialogView))! {
            return false
        }
        return true
    }
}
