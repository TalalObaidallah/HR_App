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

class HRLoginViewController : UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
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
    


    
    @IBAction func loginButton(_ sender: HRLoginViewController ) {
        signIn(user: userName.text ?? "", password: userPassword.text ?? "")
      
      }
    
    
    }
    
    

