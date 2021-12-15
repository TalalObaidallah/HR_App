//
//  RequestDetails.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//

import UIKit

class RequestDetails: UIViewController {

    @IBOutlet weak var titleRequest: UILabel!
    @IBOutlet weak var textRequest: UITextView!
    
    var setTitleRequest = ""
    var order : RequestName!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleRequest.text = order.name
    }
    
    @IBAction func sendRequest(_ sender: RequestDetails) {
        RequestsApi.addRequest(titleRe: titleRequest.text ?? "", commentRe: textRequest.text ?? "") { check in
        }
        //creatRequest(titleRe: titleRequest.text ?? "",commentRe: textRequest.text ?? "")
    }
    
}
