//
//  MainViewController.swift
//  FBAUTH
//
//  Created by Yoga Pratama on 14/11/17.
//  Copyright © 2017 Yoga Pratama. All rights reserved.
//

import UIKit
import Firebase
class MainViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var user = Auth.auth().currentUser?.displayName
        userLabel.text = "Welcome,\(user)"
        
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("logout execute")
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
    
}
