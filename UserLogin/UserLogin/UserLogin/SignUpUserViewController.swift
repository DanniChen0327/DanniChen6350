//
//  SignUpUserViewController.swift
//  UserLogin
//
//  Created by Danni Chen on 11/15/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpUserViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func SignUp(_ sender: Any) {
        let email = txtEmail.text
       let password = txtPassword.text
       
       if email == "" || password!.count < 6 {
           lblStatus.text = "Please enter email and correct password"
           return
       }
       
       if email?.isEmail == false {
           lblStatus.text = "Please enter valid email"
           return
       }
       
       SwiftSpinner.show("Creating new user...")
       Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
           SwiftSpinner.hide()
                   
           if(error != nil) {
               self.lblStatus.text = "Error!"
               print("error： " + error!.localizedDescription)
               return
           }
           self.lblStatus.text = "User created!"
       }

    }
    
}
