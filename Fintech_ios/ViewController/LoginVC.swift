//
//  LoginVC.swift
//  GoParking
//
//  Created by Hadi Albinsaad on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
//import SAPFiori
import Spring
import NVActivityIndicatorView

class LoginVC: UIViewController
{
    
    
    @IBOutlet weak var signInLabel: SpringLabel!
    @IBOutlet weak var descriptionLabel: SpringLabel!
    @IBOutlet weak var logoImageView: SpringImageView!
    
    @IBOutlet weak var usernameView: CustomView!
    @IBOutlet weak var passwordView: CustomView!
    @IBOutlet weak var signInButton: SpringButton!
    @IBOutlet weak var loader: NVActivityIndicatorView!
    
//    var loadingIndicator: FUILoadingIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
//        loadingIndicator = FUILoadingIndicatorView()
        setHiddenElements()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showElements()
        animateElements()
    }
    
    
    func setHiddenElements(){
        signInLabel.isHidden = true
        descriptionLabel.isHidden = true
        logoImageView.isHidden = true
        usernameView.isHidden = true
        passwordView.isHidden = true
        signInButton.isHidden = true
    }
    
    func showElements(){
        signInLabel.isHidden = false
        descriptionLabel.isHidden = false
        logoImageView.isHidden = false
        usernameView.isHidden = false
        passwordView.isHidden = false
        signInButton.isHidden = false
    }
    
    func animateElements()
    {
        let duration:CGFloat = 1
        
        //logo view
        logoImageView.animation = "fadeInDown"
        logoImageView.curve = "easeIn"
        logoImageView.duration = duration
        logoImageView.animate()
        
        
        //username view
        usernameView.animation = "squeezeRight"
        usernameView.curve = "easeIn"
        usernameView.duration = duration
        usernameView.delay = 1
        usernameView.animate()
        
        
        //password view
       passwordView.animation = "squeezeRight"
        passwordView.curve = "easeIn"
        passwordView.duration = duration
        passwordView.delay = 1.5
        passwordView.animate()
        
        //sign in button
        signInButton.animation = "squeezeRight"
        signInButton.curve = "easeIn"
        signInButton.duration = duration
        signInButton.delay = 2
        signInButton.animate()
        
        
        //signIn Label
        signInLabel.animation = "fadeIn"
        signInLabel.curve = "easeIn"
        signInLabel.duration = 0.7
        signInLabel.delay = 2.3
        signInLabel.animate()
        
        
        //description Label
        descriptionLabel.animation = "fadeIn"
        descriptionLabel.curve = "easeIn"
        descriptionLabel.duration = 0.7
        descriptionLabel.delay = 2.8
        descriptionLabel.animate()
    }
    
    func animateOut(completion:@escaping ()->()){
        var duartion:CGFloat = 0.5
        
        //username view
        UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: {
            self.usernameView.transform = CGAffineTransform(outside: self.view.bounds, from: .left)
        }, completion: nil)
        
        //password view
        UIView.animate(withDuration: 0.1, delay: 0.3, options: [], animations: {
            self.passwordView.transform = CGAffineTransform(outside: self.view.bounds, from: .left)
        }, completion: nil)
        
        //signIn Label
        signInLabel.animation = "fadeOut"
        signInLabel.curve = "easeIn"
        signInLabel.duration = duartion
        signInLabel.delay = 0.8
        signInLabel.animate()
        
        
        //description Label
        descriptionLabel.animation = "fadeOut"
        descriptionLabel.curve = "easeIn"
        descriptionLabel.duration = duartion
        descriptionLabel.delay = 1
        descriptionLabel.animate()
        
        //button view
        signInButton.animation = "zoomOut"
        signInButton.curve = "easeIn"
        signInButton.duration = duartion
        signInButton.delay = 1.2
        signInButton.animateNext {
            completion()
        }
        
//        logoImageView.animation = "zoomOut"
//        logoImageView.curve = "easeIn"
//        logoImageView.duration = duartion
//        logoImageView.delay = 1.6
//        logoImageView.animateNext {
//            completion()
//        }

        
        
//        usernameView.transform = CGAffineTransform(outside: view.bounds, from: .left)
//        usernameView.animation = "squeezeLeft"
//        usernameView.curve = "easeIn"
//        usernameView.duration = duartion
//        usernameView.delay = 0
//        usernameView.animateNext {
//            completion()
//        }
        
        
    }
 
    @IBAction func login(_ sender: UIButton) {
        //showFioriProcessingIndicator()
        loader.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
           self.loader.stopAnimating()
           self.animateOut {
                 let vc = Constants.Storyboard.MapVC.instantiateViewController(withIdentifier: "MapVC")
                self.present(vc, animated: true, completion: nil)
            
            }
            
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

