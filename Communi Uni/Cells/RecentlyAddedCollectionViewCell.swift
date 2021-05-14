//
//  RecentlyAddedCollectionViewCell.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/13/21.
//

import UIKit

class RecentlyAddedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
    }
}
