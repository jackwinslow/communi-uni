//
//  StudentDetailViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/14/21.
//

import UIKit

class StudentDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var interestsTextField: UITextView!
    @IBOutlet weak var communicateButton: UIButton!
    
    let firstname = UserDefaults.standard.string(forKey: "userFirstName")
    let lastname = UserDefaults.standard.string(forKey: "userLastName")
    
    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(communicateButton)
        
        interestsTextField.layer.borderWidth = 0.5
        interestsTextField.layer.cornerRadius = 10
        interestsTextField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        
        nameLabel.text = student.firstname
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNewChat" {
            print("doing segue ****************************")
            let destination = segue.destination as! ContainerViewController
            destination.currentUserName = firstname!
            destination.user2Name = student.firstname
            destination.user2UID = student.uid
            destination.studentSchool = student.school
            destination.hidesBottomBarWhenPushed = true
        }
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
