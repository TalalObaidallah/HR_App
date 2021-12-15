//
//  EmpProfileVC.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 09/12/2021.
//

import UIKit
import FirebaseAuth

class EmpProfileVC: UIViewController {

    @IBOutlet weak var adminButton: UIButton!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var phoneUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            self.nameUser.text = user.name
            self.phoneUser.text = user.phone
            self.emailUser.text = user.email
            if user.isManger ?? false {
                self.adminButton.isHidden = false
            } else {
                self.adminButton.isHidden = true
            }
        }
    }
    

    @IBAction func adminRole(_ sender: UIButton) {
        performSegue(withIdentifier: "toManegarRole", sender: nil)
    }
}
