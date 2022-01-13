//
//  LastRequestViewController.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 15/12/2021.
//

import UIKit
import FirebaseAuth

// Class Of Last Request :-

class LastRequestViewController: UIViewController {
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var lastLabelName: UILabel!
    @IBOutlet weak var lastLabelTitle: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedReqwest:Requests?
    var setSelectedReqwest:Requests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastLabel.font = UIFont(name: "Almarai", size: 20)
        lastLabelName.font = UIFont(name: "Almarai", size: 20)
        lastLabelTitle.font = UIFont(name: "Almarai", size: 20)
        nameTitle.font = UIFont(name: "Almarai", size: 20)
        titleLabel.font = UIFont(name: "Almarai", size: 20)
        // We call tittle , comment and name :-
        
        setSelectedReqwest = selectedReqwest
        lastLabelTitle.text = setSelectedReqwest?.titleRe
        lastLabel.text = setSelectedReqwest?.commentRe
        lastLabelName.text = setSelectedReqwest?.nameRe
        nameTitle.text = "name".localize
        titleLabel.text = "title".localize
        lastLabelTitle.layer.cornerRadius = 15
        
        
        
        
    }
    // Reject Button if rejected = 2
    @IBAction func rejectButton(_ sender: Any) {
        RequestsApi.changeRequestApprove(isApprove: 2, idReqwest: setSelectedReqwest?.id ?? "")
        let rejected = UIAlertController(title: "The Order Is Rejected".localize, message: " Order Of employee is rejected By manager".localize, preferredStyle: .alert)
        rejected.addAction(UIAlertAction(title: "Done".localize, style: .cancel, handler: nil))
        self.present(rejected, animated: false)
    }
    
    // Aprove Button if aproved = 1
    @IBAction func aproveButton(_ sender: Any) {
        RequestsApi.changeRequestApprove(isApprove: 1, idReqwest: setSelectedReqwest?.id ?? "")
        let aproved = UIAlertController(title: "The Order Is Aproved".localize, message: " Order Of employee is Aproved By manager".localize, preferredStyle: .alert)
        aproved.addAction(UIAlertAction(title: "Done".localize, style: .cancel, handler: nil))
        self.present(aproved, animated: false)
        
    }
}

