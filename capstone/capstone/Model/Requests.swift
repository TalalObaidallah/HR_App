//
//  Requests.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//

import Foundation
import UIKit
// class requests :-

class Requests {
    var uid: String?
    var id : String?
    var nameRe : String?
    var titleRe : String?
    var commentRe : String?
    var isApproved : Int?
    var reasonOfRejection : String?
}
// extension request
extension Requests {
    // function of get request :-
    static func getRequest(dict: [String: Any]) -> Requests {
       
        let request = Requests()
        request.id = dict["id"] as? String
        request.uid = dict["uid"] as? String
        request.nameRe = dict["nameRe"] as? String
        request.commentRe = dict["commentRe"] as? String
        request.titleRe = dict["titleRe"] as? String
        request.isApproved = dict["isApproved"] as? Int
        request.reasonOfRejection = dict["reasonOfRejection"] as? String
        return request
    }
    
    
    // function of creat request 
    static func creatRequest(uid: String, id:String,titleRe:String,nameRe:String,commentRe:String,isApproved:Int,reasonOfRejection:String) -> [String: Any] {
       
        let newRequest = ["uid":uid, "id":id,"nameRe":nameRe,
            "titleRe":titleRe,
                       "commentRe":commentRe,
                       "isApproved":isApproved,
                       "reasonOfRejection":reasonOfRejection
                    ] as [String : Any]
        
        return newRequest
    }
}
