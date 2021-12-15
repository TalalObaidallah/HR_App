//
//  RequestsApi.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//


import Foundation
import FirebaseFirestore
class RequestsApi {
    
    static func addRequest(titleRe:String,commentRe:String,completion: @escaping (Bool) -> Void) {
        
        let refRequest = Firestore.firestore().collection("Requests")
        
        
        refRequest.addDocument(data: Requests.creatRequest(titleRe: titleRe, commentRe: commentRe, isApproved: false, reasonOfRejection: "nil"))
        
        completion(true)
        
    }
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
    static func changeRequest(completion: @escaping (Requests) -> Void) {
       
        let refRequest = Firestore.firestore().collection("Requests")
        
        refRequest.document("uid").getDocument { document, error in
            if let document = document, document.exists {
                let request = Requests.getRequest(dict: document.data()!)
                completion(request)
            }
        }
        
    }
     
}
