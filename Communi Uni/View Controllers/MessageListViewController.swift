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
            destination.user2Name = conversations.conversationArray[selectedIndexPath.row].firstname
            destination.user2UID = conversations.conversationArray[selectedIndexPath.row].id
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
        cell.studentNameLabel.text = conversations.conversationArray[indexPath.row].firstname
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
