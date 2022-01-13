//
//  LoginVC.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 08/12/2021.
//

import Foundation
import FirebaseAuth
import Firebase
import UIKit

// Class of Login username and password ;-

class HRLoginViewController : UIViewController {
    
    @IBOutlet weak var loginUser: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var bottonLog: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginUser.font = UIFont(name: "Almarai-Bold", size: 30)
        userName.layer.cornerRadius = 12
        userName.borderStyle = .none
        userPassword.layer.cornerRadius = 12
        userPassword.borderStyle = .none
        bottonLog.layer.cornerRadius = 16
        
        
    }
    // function of sign in of users and alert :-
    func signIn (user : String , password : String) {
        Auth.auth().signIn(withEmail: user, password: password) {
            [weak self] authResult, error in
            if let error = error {
                    print(error.localizedDescription)
                let errorUser = UIAlertController(title: "The User Name or The Password is wrong.".localize, message: " You must check the user name and password ".localize, preferredStyle: .alert)
                errorUser.addAction(UIAlertAction(title: "try again".localize, style: .cancel, handler: nil))
                    self?.present(errorUser, animated: false)
            } else {
                self?.performSegue(withIdentifier: "Home", sender: nil)
            }
                  print("email:\(String(describing: authResult?.user.email))")
                  print("uid:\(String(describing: authResult?.user.uid))")
                 // ...
                }
              }
    


    // Button action of login :-
    @IBAction func loginButton(_ sender: HRLoginViewController ) {
        
        signIn(user: userName.text ?? "", password: userPassword.text ?? "")
        
      
      }

    
    }
    
    

