//
//  MainViewController.swift
//  Salon
//
//  Created by Marzoog Almoklif on 17/04/1443 AH.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fideInAnimation()
    }
    
    func fideInAnimation() {
        let left = CGAffineTransform(translationX: -300, y: 0)
        let right = CGAffineTransform(translationX: 300, y: 0)
        let top = CGAffineTransform(translationX: 0, y: 0)
        
        logoImageView.layer.opacity = 0
        loginButton.layer.opacity = 0
        signUpButton.layer.opacity = 0
        signUpLabel.layer.opacity = 0
        logoImageView.transform = CGAffineTransform(translationX: 0, y: -300)
        
        backgroundImageView.transform = CGAffineTransform(translationX: 0, y: 400)
        
        UIView.animate(withDuration: 1.0,delay: 1.0) {
            self.loginButton.layer.opacity = 1
            self.signUpButton.layer.opacity = 1
            self.signUpLabel.layer.opacity = 1
        }
        
        UIView.animate(withDuration: 1.0,delay: 0.5) {
            self.logoImageView.transform = top
            self.logoImageView.layer.opacity = 1
            self.backgroundImageView.transform = top
        }
    }
    
    
    func fideOutAnimation() {
        let left = CGAffineTransform(translationX: -300, y: 0)
        let right = CGAffineTransform(translationX: 300, y: 0)
        let top = CGAffineTransform(translationX: 0, y: -300)
        let buttom = CGAffineTransform(translationX: 0, y: 400)

        
        UIView.animate(withDuration: 0.8,delay: 0.5) {
            self.logoImageView.transform = top
            self.logoImageView.layer.opacity = 0
            self.loginButton.layer.opacity = 0
            self.signUpButton.layer.opacity = 0
            self.signUpLabel.layer.opacity = 0
            self.backgroundImageView.transform = buttom
            self.view.backgroundColor = .white
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        signUp()
    }
    
    
    
    func login() {
        fideOutAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) + .microseconds(50)) {
            self.performSegue(withIdentifier: "login_segue", sender: nil)
        }
        
    }
    
    func signUp() {
        fideOutAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) + .microseconds(50)) {
            self.performSegue(withIdentifier: "sign_up_segue", sender: nil)
        }
    }
}
