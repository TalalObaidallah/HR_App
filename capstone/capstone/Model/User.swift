//
//  User.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 09/12/2021.
//

import Foundation
import UIKit
// class user :-
class User {
    
    var name:String?
    var phone: String?
    var email: String?
    var isManger:Bool?
    var idManager: String?
}
// extension user :-
extension User {
    // function get user :-
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.phone = dict["phone"] as? String
        user.name = dict["name"] as? String
        user.email = dict["email"] as? String
        user.isManger = dict["isManger"] as? Bool
        user.idManager = dict["idManager"] as? String
        return user
    }
    // function create user :-
    static func CreateUser(phone:String,name:String,email:String,isManger:Bool,idManager:String) -> [String: Any] {
       
        let newUser = ["phone":phone,
                       "name":name,
                       "email" :email,
                       "isManger" : isManger,
                       "idManager" : idManager
                    ] as [String : Any]
        
        return newUser
    }
}
