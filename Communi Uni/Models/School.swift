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
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["name": name, "location": location]
    }

    init(name: String, location: String, documentID: String) {
        self.name = name
        self.location = location
        self.documentID = documentID
    }
    
    convenience init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String? ?? ""
        let location = dictionary["location"] as! String? ?? ""
        
        self.init(name: name, location: location, documentID: "")
    }
}
