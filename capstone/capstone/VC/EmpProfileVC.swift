//
//  EmpProfileVC.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 09/12/2021.
//

import UIKit
import FirebaseAuth

// Class Employees profile
class EmpProfileVC: UIViewController {

    @IBOutlet weak var nameUser2: UILabel!
    
    @IBOutlet weak var phoneUser2: UILabel!
    
    @IBOutlet weak var emailUser2: UILabel!
    @IBOutlet weak var personalProfile: UILabel!
    @IBOutlet weak var adminButton: UIButton!
    @IBOutlet weak var nameUser: UILabel!
    
    @IBOutlet weak var nameUserText: UILabel!
    @IBOutlet weak var phoneUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalProfile.font = UIFont(name: "Almarai-Bold", size: 30)
        nameUser2.font = UIFont(name: "Almarai-Bold", size: 17)
        nameUserText.font = UIFont(name: "Almarai", size: 17)
        phoneUser2.font = UIFont(name: "Almarai-Bold", size: 17)
        emailUser2.font = UIFont(name: "Almarai-Bold", size: 17)
        
        print(Auth.auth().currentUser?.uid)
        adminButton.layer.cornerRadius = 12
        nameUser.layer.cornerRadius = 12
        phoneUser.layer.cornerRadius = 12
        emailUser.layer.cornerRadius = 12
        // using user api
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
    
// button action of admin user :-
    @IBAction func adminRole(_ sender: UIButton) {
        performSegue(withIdentifier: "toManegarRole", sender: nil)
    }
}
