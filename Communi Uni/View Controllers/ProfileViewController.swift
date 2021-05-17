//
//  ProfileViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/9/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    let userDefault = UserDefaults.standard
    
    let firstname = UserDefaults.standard.string(forKey: "userFirstName")
    let lastname = UserDefaults.standard.string(forKey: "userLastName")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide keyboard if we tap outside of a field
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        userNameLabel.text = "\(firstname!) \(lastname!)"
    }
    
    // Call to send user back to welcome screen
    func transitionToWelcome() {
                
        let welcomeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.welcomeViewController) as? WelcomeViewController
        
        view.window?.rootViewController = welcomeViewController
        view.window?.makeKeyAndVisible()
        
    }

    @IBAction func signOutButtonPressed(_ sender: Any) {
        print("**** User logged out.")
        
        self.userDefault.set(false, forKey: "usersignedin")
        self.userDefault.set("", forKey: "userEmail")
        self.userDefault.set("", forKey: "userPassword")
        self.userDefault.set("", forKey: "userFirstName")
        self.userDefault.set("", forKey: "userLastName")
        self.userDefault.synchronize()
        
        transitionToWelcome()
    }
    

}
