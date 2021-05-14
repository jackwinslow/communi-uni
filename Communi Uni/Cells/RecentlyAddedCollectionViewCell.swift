//
//  RecentlyAddedCollectionViewCell.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/13/21.
//

import UIKit

class RecentlyAddedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.shadowRadius = 5
        self.contentView.layer.shadowOpacity = 0.3
        self.contentView.layer.shadowOffset = .zero
    }
}
