//
//  LoginViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/5/10.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit
protocol LoginViewControllerDelegate : class {
    func loginButtonTapped()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIVisualEffectView!
    @IBOutlet weak var dialogView: DesignableView!
    let panToClose = InteractionPanToClose()
    
    weak var delegate:LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPanToClose()
        setTapToClose()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentAnimation()
    }

    // MARK: - Actions
    @IBAction func clickForgetPwd(_ sender: UIButton) {
        showFeatureUnavailableAlert()
    }
    
    @IBAction func clickLoginBtn(_ sender: DesignableButton) {
        DispatchQueue.main.async {
            self.view.hideLoading()
        }
        let email = emailTF.text!
        let pwd = pwdTF.text!
        DCService.login(email: email, password: pwd) { (user) in
            if let user = user{
                RealmService.updateUsser(sender: user, completion: {[weak self] in
                    self?.delegate?.loginButtonTapped()
                    self?.dismiss(animated: true, completion: nil)
                })
            }else{
                DispatchQueue.main.async {
                    UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                            self.dialogView.transform = CGAffineTransform(translationX: 50, y: 0)
                        })
                        UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                            self.dialogView.transform = CGAffineTransform(translationX: -50, y: 0)
                        })
                        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                            self.dialogView.transform = CGAffineTransform(translationX: 25, y: 0)
                        })
                        UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                            self.dialogView.transform = CGAffineTransform(translationX: 0, y: 0)
                        })
                    }, completion: nil)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - Animation
extension LoginViewController{
    func presentAnimation(){
        let myView = dialogView
        myView?.alpha = 0
        let rotate = spring3DRotate(degrees: 150)
        let translate = spring3DTranslate(x: -80, y: 200, z: 0)
        myView?.layer.transform = CATransform3DConcat(rotate, translate)
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.7) {
            myView?.transform = CGAffineTransform.identity
            myView?.alpha = 1
        }
        animator.startAnimation()
    }
}

// MARK: - TapToClose
extension LoginViewController:UIGestureRecognizerDelegate{
    func setTapToClose(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        tap.delegate = self
        scrollView.addGestureRecognizer(tap)
    }
    
    @objc func closeButtonTapped(){
        SpringDialog.animateClose(dialogView: dialogView, backgroundView: backgroundView) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: dialogView))!{
            return false
        }
        return true
    }
}

// MARK: - PanToClose
extension LoginViewController{
    func setPanToClose(){
        panToClose.viewController = self
        panToClose.backgroundView = backgroundView
        panToClose.dialogView = dialogView
        panToClose.scrollView = scrollView
        panToClose.isDialogDropResetting = true
        panToClose.setPangesture()
    }
}
