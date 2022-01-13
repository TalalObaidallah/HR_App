//
//  RequestDetails.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//

import UIKit
import FirebaseAuth

// class of request details :-
class RequestDetails: UIViewController {

    @IBOutlet weak var titleRequest: UILabel!
    @IBOutlet weak var textRequest: UITextView!
    @IBOutlet weak var nameRequest: UILabel!
    
    var setTitleRequest = ""
    var order : RequestName!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleRequest.font = UIFont(name: "Almarai-Bold", size: 20)
        nameRequest.font = UIFont(name: "Almarai-Bold", size: 20)
        textRequest.font = UIFont(name: "Almarai", size: 17)
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            self.nameRequest.text = user.name
        }
        titleRequest.text = order.name
    }
    // button action to send request :-
    @IBAction func sendRequest(_ sender: RequestDetails) {
        // requestApi add request
        RequestsApi.addRequest(uid: Auth.auth().currentUser?.uid ?? "" , titleRe: titleRequest.text ?? "", commentRe: textRequest.text ?? "", nameRe: nameRequest.text ?? "") { check in
        }
        let sendOrderRequest = UIAlertController(title: "The Order Is send".localize, message: "please wait the answer".localize, preferredStyle: .alert)
        sendOrderRequest.addAction(UIAlertAction(title: "Done".localize, style: .cancel, handler: nil))
        self.present(sendOrderRequest, animated: false)
    }

}


