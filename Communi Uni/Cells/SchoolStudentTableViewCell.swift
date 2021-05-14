//
//  SchoolStudentTableViewCell.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/14/21.
//

import UIKit

class SchoolStudentTableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var joinedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
    }

}
