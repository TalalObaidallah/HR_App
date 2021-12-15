//
//  LastRequestViewController.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 15/12/2021.
//

import UIKit

class LastRequestViewController: UIViewController {

    @IBOutlet weak var lastLabel: UILabel!
    
    var selectedReqwest:Requests?
    
    var setSelectedReqwest:Requests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectedReqwest = selectedReqwest
        print(setSelectedReqwest?.titleRe)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rejectButton(_ sender: Any) {
    }
    
    @IBAction func aproveButton(_ sender: Any) {
    }
}
