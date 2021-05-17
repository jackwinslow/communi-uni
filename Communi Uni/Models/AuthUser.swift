//
//  AuthUser.swift
//  Communi Uni
//
//  Created by BC Swift Student Loan 1 on 5/17/21.
//

import Foundation
import Firebase

class AuthUser {
    var firstname: String
    var lastname: String
    var uid: String
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["firstname": firstname, "lastname": lastname, "uid": uid]
    }

    init(firstname: String, lastname: String, uid: String, documentID: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.uid = uid
        self.documentID = documentID
    }
    
    convenience init(dictionary: [String: Any]) {
        let firstname = dictionary["firstname"] as! String? ?? ""
        let lastname = dictionary["lastname"] as! String? ?? ""
        let uid = dictionary["uid"] as! String? ?? ""
        
        self.init(firstname: firstname, lastname: lastname, uid: uid, documentID: "")
    }
}
