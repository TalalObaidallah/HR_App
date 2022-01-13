//
//  EmployeesLoinVC.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 08/12/2021.
//

import Foundation

import FirebaseAuth
import Firebase
import UIKit

// Class of employees data ;-
class EMLoginViewController : UIViewController {
    
    @IBOutlet weak var newRegester: UILabel!
    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mangerId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRegester.font = UIFont(name: "Almarai-Bold", size: 30)
//        nameUser.layer.cornerRadius = 6
//        nameUser.borderStyle = .none
//        phoneNumber.layer.cornerRadius = 6
//        phoneNumber.borderStyle = .none
//        email.layer.cornerRadius = 6
//        email.borderStyle = .none
//        password.layer.cornerRadius = 6
//        password.borderStyle = .none
//        mangerId.layer.cornerRadius = 6
//        mangerId.borderStyle = .none
//
    }
    
    // action button to create user by user Api :-
    @IBAction func EMloginButton(_ sender: HRLoginViewController) {
        
        Auth.auth().createUser(withEmail: email.text ?? "", password: password.text ?? "") { authResult, error in
            if let error = error {
                print(error)
            } else {
             
                UserApi.addUser(name: self.nameUser.text ?? "", uid: authResult?.user.uid ?? "", phone: self.phoneNumber.text ?? "", email: self.email.text ?? "", isManger: false, idManager: self.mangerId.text ?? "") { check in
                    if check {
                        self.performSegue(withIdentifier: "second", sender: nil)
                        print("Done saving in Database")
                    } else {
                        
                    }
                }
            }
            
        }
    }
    
}
