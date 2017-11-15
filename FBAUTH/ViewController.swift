//
//  ViewController.swift
//  FBAUTH
//
//  Created by Yoga Pratama on 14/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    @IBAction func facebookLogin(_ sender: Any) {
        print("try to loggin fb")
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            //let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print("error : \(error)")
                    let alertController = UIAlertController(title: "Login Error",message : error?.localizedDescription,preferredStyle: .alert)
                    let okAction =   UIAlertAction(title: "Ok" , style : .cancel,handler : nil)
                    alertController.addAction(okAction)
                    self.present(alertController,animated:  true ,completion: nil)
                    return
                }else{
                    self.performSegue(withIdentifier: "goToMainSegue", sender: nil)
                }
                
                
                
                
                
            })
           
        }
            
    }
    
    

}

