//
//  MessageListViewController.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/9/21.
//

import UIKit
import Firebase

class MessageListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var conversations: Conversations!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversations = Conversations()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        conversations.loadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChat" {
            print("doing segue ****************************")
            let destination = segue.destination as! ContainerViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.currentUserName = "Nick"
            destination.user2Name = conversations.conversationArray[selectedIndexPath.row].studentName
            destination.user2UID = conversations.conversationArray[selectedIndexPath.row].studentUID
            destination.studentSchool = conversations.conversationArray[selectedIndexPath.row].studentSchool
            destination.hidesBottomBarWhenPushed = true
        }
    }


}

extension MessageListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.conversationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConvCell", for: indexPath) as! MessageListTableViewCell
        cell.studentNameLabel.text = conversations.conversationArray[indexPath.row].studentName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
