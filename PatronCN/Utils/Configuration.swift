//
//  Configuration.swift
//  PatronCN
//
//  Created by eorin on 2018/5/15.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

public func appHasWideScreenForView(_ view: UIView) -> Bool {
    let width = view.bounds.width
    if width > 700 {
        return true
    } else {
        return false
    }
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showSectionUnavailableAlert() {
        showAlert(title: "Section not available",
                  message: "This section is not available yet.")
    }
    
    func showFeatureUnavailableAlert() {
        showAlert(title: "Feature not available",
                  message: "This feature is not available yet.")
    }
    
    func showLoginAlert() {
        // TODO: - Take user to login screen.
        showAlert(title: "Content not available",
                  message: "Please log in to access this content.")
    }
    
    func showNoInternetConnectionAlert() {
        showAlert(title: "No internet conenction",
                  message: "Network connection is needed in order to perform this action.")
    }
    
    func showPurchaseUnavailable() {
        showAlert(title: "Purchases are not yet enabled",
                  message: "Purchases will be enabled once the app is launched on the App Store.")
    }
}

struct SpringDialog {
    static func animateClose(dialogView: UIView, backgroundView: UIVisualEffectView, completion: @escaping() -> Void) {
        UIView.animate(withDuration: 0.5, animations: {
            backgroundView.alpha = 0
            dialogView.alpha = 0
            let degrees = CGFloat(Int(arc4random_uniform(60)) - 30)
            let rotation = CGAffineTransform(rotationAngle: degreesToRadians(degrees: degrees))
            let translation = CGAffineTransform(translationX: 0, y: 500)
            dialogView.transform = rotation.concatenating(translation)
        }) { (finished) in
            completion()
            delay(delay: 0.5, closure: {
                backgroundView.alpha = 1
                dialogView.transform = CGAffineTransform.identity
            })
        }
    }
    
    static func animateAppear(dialogView: UIView) {
        let translation = CGAffineTransform(translationX: 0, y: 300)
        let degrees = CGFloat(Int(arc4random_uniform(60)) - 30)
        let rotation = CGAffineTransform(rotationAngle: degreesToRadians(degrees: degrees))
        dialogView.transform = translation.concatenating(rotation)
        
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.9) {
            dialogView.alpha = 1
            dialogView.transform = CGAffineTransform.identity
        }
        animator.startAnimation()
    }
}
