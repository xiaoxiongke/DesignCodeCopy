//
//  InteractionPanToClose.swift
//  PatronCN
//
//  Created by eorin on 2018/5/15.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class InteractionPanToClose: UIPercentDrivenInteractiveTransition {

    weak var viewController:UIViewController?
    var scrollView:UIScrollView!
    var dialogView:UIView!
    var backgroundView:UIVisualEffectView!
    var backgroundColorWhite:CGFloat = 0
    var backgroundViewEffect:UIVisualEffect!
    var isPangestureEnable = true
    var isDialogDropResetting = false
    
    func setPangesture(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        scrollView.addGestureRecognizer(pan)
        pan.delegate = self
    }
    
    @objc func handleGesture(_ sender:UIPanGestureRecognizer){
        guard isPangestureEnable else { return }
        if backgroundView.effect == nil{
            backgroundView.effect = backgroundViewEffect
        }
        guard scrollView.contentOffset.y < 1 else{
            if isPangestureEnable{
                cancel()
            }
            return
        }
        let translation = sender.translation(in: viewController?.view)
        let origin = sender.location(in: viewController?.view)
        switch sender.state {
            case .changed:
                guard translation.y > 0 else{ return }
                update(translation, origin: origin)
            case .ended:
                if translation.y > 100 {
                    finish()
                }else{
                    cancel()
                }
            default:
                break
        }
        
    }
    
    func update(_ translation: CGPoint, origin: CGPoint) {
        let multiper = 1 - (translation.y / 10 / 200)
        let viewWidth = viewController?.view.frame.width ?? UIScreen.main.bounds.width
        print(multiper)
        
    }
    
    override func cancel() {
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.6) {
            self.dialogView.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.5, animations: {
                self.backgroundView.effect = self.backgroundViewEffect
                self.viewController?.view.backgroundColor = UIColor(white: self.backgroundColorWhite, alpha: 0)
            })
        }
        animator.startAnimation()
    }
    
    override func finish() {
        let animator = UIViewPropertyAnimator(duration: 0.9, dampingRatio: 0.9) {
            if self.isDialogDropResetting{
                self.dialogView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 1000, 0)
            }else{
                self.dialogView.frame.origin.y += 200
            }
            self.viewController?.dismiss(animated: true, completion: nil)
        }
        animator.startAnimation()
    }
    
}

extension InteractionPanToClose:UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        isPangestureEnable = true
        return true
    }
}
