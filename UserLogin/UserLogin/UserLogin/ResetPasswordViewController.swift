//
//  ResetPasswordViewController.swift
//  UserLogin
//
//  Created by Danni Chen on 11/15/20.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPswAction(_ sender: Any) {
        let email = txtEmail.text
                
        if !email!.isEmail {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
            if error != nil {
                self.lblStatus.text = "Reset Failed"
            } else {
                self.lblStatus.text = "Reset Email Sent"
            }
        }
    }
    
    

}
