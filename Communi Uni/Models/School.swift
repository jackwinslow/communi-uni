//
//  School.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/9/21.
//

import Foundation
import Firebase

class School {
    var name: String
    var location: String
    var studentCount: Int
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["name": name, "location": location, "studentCount": studentCount]
    }

    init(name: String, location: String, studentCount: Int, documentID: String) {
        self.name = name
        self.location = location
        self.studentCount = studentCount
        self.documentID = documentID
    }
    
    convenience init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String? ?? ""
        let location = dictionary["location"] as! String? ?? ""
        let studentCount = dictionary["studentCount"] as! Int? ?? 0
        
        self.init(name: name, location: location, studentCount: studentCount, documentID: "")
    }
}
