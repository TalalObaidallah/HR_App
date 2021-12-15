//
//  Requests.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//

import Foundation
import UIKit
class Requests {
    var titleRe : String?
    var commentRe : String?
    var isApproved : Bool?
    var reasonOfRejection : String?
}
extension Requests {
    
    static func getRequest(dict: [String: Any]) -> Requests {
       
        let request = Requests()
        
        request.commentRe = dict["commentRe"] as? String
        request.titleRe = dict["titleRe"] as? String
        request.isApproved = dict["isApproved"] as? Bool
        request.reasonOfRejection = dict["reasonOfRejection"] as? String
        return request
    }
    
    static func
    changeStatusRequest(isApproved:Bool,reasonOfRejection:String) -> [String: Any] {
       
        if isApproved {
            let newReguest = ["isApproved":isApproved
                        ] as [String : Any]
            
            return newReguest
        } else {
            let newReguest = ["reasonOfRejection":reasonOfRejection,
                           "isApproved":isApproved
                        ] as [String : Any]
            
            return newReguest
        }
        
    }
    
    
    
    
    static func creatRequest(titleRe:String,commentRe:String,isApproved:Bool,reasonOfRejection:String) -> [String: Any] {
       
        let newRequest = ["titleRe":titleRe,
                       "commentRe":commentRe,
                       "isApproved":isApproved,
                       "reasonOfRejection":reasonOfRejection
                    ] as [String : Any]
        
        return newRequest
    }
}
