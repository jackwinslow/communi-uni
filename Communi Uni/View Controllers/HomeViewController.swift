//
//  HomeViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/8/21.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var schools: Schools!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schools = Schools()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        schools.loadData {
            self.collectionView.reloadData()
        }
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schools.schoolArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentlyAddedCell", for: indexPath) as! RecentlyAddedCollectionViewCell
        cell.nameLabel.text = schools.schoolArray[indexPath.row].name
        cell.locationLabel.text = schools.schoolArray[indexPath.row].location
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 225, height: 180)
    }
    
}
