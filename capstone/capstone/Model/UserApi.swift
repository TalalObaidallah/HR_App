//
//  UserApi.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 09/12/2021.
//

import Foundation
import FirebaseFirestore

// calss user Api :-
class UserApi {
    // function of add user
    static func addUser(name:String,uid:String,phone:String,email:String,isManger:Bool,idManager:String,completion: @escaping (Bool) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        
        refUsers.document(uid).setData(User.CreateUser(phone: phone, name: name, email: email, isManger: isManger, idManager: idManager))
        
        completion(true)
        
    }
    // function of get user :-
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
       
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
        
    }
    
}
