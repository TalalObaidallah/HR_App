//
//  RequestsApi.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//


import Foundation
import FirebaseFirestore

// class of request Api :-
class RequestsApi {
    // function of add new request :-
    static func addRequest(uid: String, titleRe:String,commentRe:String,nameRe:String,completion: @escaping (Bool) -> Void) {
        
        let refRequest = Firestore.firestore().collection("Requests")
        
        let id = UUID().uuidString
        refRequest.document(id).setData(Requests.creatRequest(uid: uid, id: id, titleRe: titleRe, nameRe:nameRe, commentRe: commentRe, isApproved: 0, reasonOfRejection: "nil"))
        
        completion(true)
        
    }
    // function of get requests :-
    static func getRequest(completion: @escaping (Requests) -> Void) {
       
        let refRequest = Firestore.firestore().collection("Requests")
        
        refRequest.getDocuments { documents, error in
            guard let documents = documents?.documents else { return }
            for document in documents {
                refRequest.document(document.documentID).getDocument { document, error in
                    if let document = document, document.exists {
                        let reqwest = Requests.getRequest(dict: document.data()!)
                        completion(reqwest)
                    }
                }
            }
        }
//
//        refRequest.getDocument { document, error in
//            if let document = document, document.exists {
//                let request = Requests.getRequest(dict: document.data()!)
//                completion(request)
//            }
//        }
        
    }
    
    static func getRequestForCurrentUser(uid: String, completion: @escaping (Requests) -> Void) {
       
        let refRequest = Firestore.firestore().collection("Requests")
        

        refRequest.whereField("uid", isEqualTo: uid).getDocuments { documents, error in
            guard let documents = documents?.documents else { return }
            for document in documents {
                refRequest.document(document.documentID).getDocument { document, error in
                    if let document = document, document.exists {
                        let reqwest = Requests.getRequest(dict: document.data()!)
                        completion(reqwest)
                    }
                }
            }
        }
//
//        refRequest.getDocument { document, error in
//            if let document = document, document.exists {
//                let request = Requests.getRequest(dict: document.data()!)
//                completion(request)
//            }
//        }
        
    }
    
    
    
    // function of change request aproved 
    static func changeRequestApprove(isApprove:Int,idReqwest:String) {
       
        let refRequest = Firestore.firestore().collection("Requests")
        
        refRequest.document(idReqwest).setData(["isApproved":isApprove],merge: true)
        
        
    }
     
}
