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
    @IBOutlet weak var userFirstNameLabel: UILabel!
    @IBOutlet weak var userInterestsTextView: UITextView!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide keyboard if we tap outside of a field
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        userInterestsTextView.layer.borderWidth = 0.5
        userInterestsTextView.layer.cornerRadius = 10
        userInterestsTextView.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
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
        self.userDefault.synchronize()
        
        transitionToWelcome()
    }
    

}
