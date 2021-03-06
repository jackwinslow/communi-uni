//
//  DiscoverViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/9/21.
//

import UIKit

class DiscoverViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var schools: Schools!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schools = Schools()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        schools.loadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSchoolDetail" {
            print("doing segue ****************************")
            let destination = segue.destination as! SchoolDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.collegeName = schools.schoolArray[selectedIndexPath.row].name
            destination.hidesBottomBarWhenPushed = true
        }
    }
    

}

extension DiscoverViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.schoolArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverCell", for: indexPath) as! DiscoverTableViewCell
        cell.nameLabel.text = schools.schoolArray[indexPath.row].name
        cell.locationLabel.text = schools.schoolArray[indexPath.row].location
        cell.availableStudentsLabel.text = "\(schools.schoolArray[indexPath.row].studentCount) students available to message"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
