//
//  LoginViewController.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 19/06/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let translatex = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: 0, animations: {
            self.usernameField.transform = CGAffineTransform(translationX: -translatex, y: 0)
            self.passwordField.transform = CGAffineTransform(translationX: -translatex, y: 0)
            self.loginButton.transform = CGAffineTransform(translationX: -translatex, y: 0)
            self.loginLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        })
        
        UIView.animate(withDuration: 0.6, animations: {
            self.usernameField.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        UIView.animate(withDuration: 0.8, animations: {
            self.passwordField.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.95, animations: {
            self.loginButton.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.8, animations: {
            self.loginLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loginButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if usernameField.text?.count != 0 && passwordField.text?.count != 0{
            let translateY = UIScreen.main.bounds.size.height
            
            UIView.animate(withDuration: 0.4, animations: {
                self.loginLabel.transform = CGAffineTransform(translationX: 0, y: -translateY)
            })
            
            UIView.animate(withDuration: 0.6, animations: {
                self.usernameField.transform = CGAffineTransform(translationX: 0, y: -translateY)
            })
            
            UIView.animate(withDuration: 0.8, animations: {
                self.passwordField.transform = CGAffineTransform(translationX: 0, y: -translateY)
            })
            
            UIView.animate(withDuration: 0.95, animations: {
                self.loginButton.transform = CGAffineTransform(translationX: 0, y: -translateY)
            }, completion: {(finished:Bool) in
                let vc = SearchMovieController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
    
    


}
