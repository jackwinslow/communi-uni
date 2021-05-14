//
//  AppUsers.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/13/21.
//

import Foundation
import Firebase

class Students {
    var studentArray: [Student] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(school: String, completed: @escaping () -> ()) {
        print(Auth.auth().currentUser!.uid)
        db.collection("schools").document(school).collection("students").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("😡 ERROR: adding the snapshot listener \(error?.localizedDescription)")
                return completed()
            }
            self.studentArray = [] // clean out existing studentArray since new data will load
            // there are querySnapshot!.documents.count documents in the snapshot
            for document in querySnapshot!.documents {
                let student = Student(dictionary: document.data())
                student.documentID = document.documentID
                self.studentArray.append(student)
            }
            completed()
        }
    }
}
