//
//  Login.swift
//  ToDoListSwift
//
//  Created by Antoine Galpin on 12/09/2016.
//  Copyright © 2016 Antoine Galpin. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Login:  UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = FIRAuth.auth()?.currentUser {
            self.usernameLabel.text = user.email
        } else {
            self.usernameLabel.text = ""
        }
        /* Title bar */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginAction(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            alert("Error connect", message: "Please enter a password and a username to create account")
        } else {
            FIRAuth.auth()?.signInWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: {(user, error) in
                if error == nil {
                    self.usernameLabel.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    let nextViewController:FirstViewController = FirstViewController()
                    self.presentViewController(nextViewController, animated: true, completion: nil)
                } else {
                    self.alert("Error connect", message: "Bad password or bad login")
                }
            })
        }
    }
    
    @IBAction func CreateAccountAction(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            alert("Error connect", message: "Please enter a password and a username to create account")
        } else {
            FIRAuth.auth()?.createUserWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: { (user,error) in
                if error == nil {
                    self.usernameLabel.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                } else {
                    self.alert("Oops", message: "Please enter a password and a login")
                }
                
            })
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
