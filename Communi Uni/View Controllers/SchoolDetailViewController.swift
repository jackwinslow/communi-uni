//
//  SchoolDetailViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/14/21.
//

import UIKit
import Firebase

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter
}()

class SchoolDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var studentCountLabel: UILabel!
    @IBOutlet weak var exploreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var students: Students!
    
    var location = ""
    var studentCount = 0
    
    var collegeName = ""
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        students = Students()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameLabel.text = collegeName
        
        detailView.layer.cornerRadius = 10
        detailView.layer.shadowRadius = 3
        detailView.layer.shadowOpacity = 0.2
        detailView.layer.shadowOffset = .zero
        
        loadSchoolData {
            self.updateUserInterface()
        }
        
        students.loadData(school: collegeName) {
            self.tableView.reloadData()
        }
    }
    
    func updateUserInterface() {
        locationLabel.text = location
        studentCountLabel.text = "\(studentCount)"
        exploreLabel.text = "Explore Students from \(collegeName)"
    }
    
    func loadSchoolData(completed: @escaping () -> ()) {
        db.collection("schools").document(collegeName).addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("😡 ERROR: adding the snapshot listener \(error?.localizedDescription)")
                return completed()
            }
            
            let school = School(dictionary: querySnapshot!.data()!)
            school.documentID = querySnapshot!.documentID
            self.location = school.location
            self.studentCount = school.studentCount
            
            completed()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStudent" {
            let destination = segue.destination as! StudentDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.student = students.studentArray[selectedIndexPath.row]
        }
    }

    @IBAction func schoolDetailBackButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SchoolDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolStudentCell", for: indexPath) as! SchoolStudentTableViewCell
        cell.studentNameLabel.text = students.studentArray[indexPath.row].firstname
        cell.joinedLabel.text = "Joined: \(dateFormatter.string(from: students.studentArray[indexPath.row].date))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
