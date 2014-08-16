//
//  ViewController.swift
//  UserManDemo
//
//  Created by Richard Lee on 8/8/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var labelUserName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackground()
        
        var currentUser = PFUser.currentUser()
        if currentUser {
            labelUserName.text = currentUser.username
        } else {
            labelUserName.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSignUp(sender: AnyObject) {
        var user = PFUser()
        user.username = textFieldUserName.text
        user.password = textFieldPassword.text
        user.email = user.username
        
        user.signUpInBackgroundWithBlock {
            (successed: Bool!, error: NSError!) -> Void in
            if !error {
                NSLog("User created: " + user.username)
            } else {
                let errorString = error.userInfo["error"] as NSString
                NSLog("User creation ERROR: " + errorString)
            }
        }
    }

    @IBAction func actionSignIn(sender: AnyObject) {
        var username = textFieldUserName.text
        PFUser.logInWithUsernameInBackground(username, password: textFieldPassword.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user {
                NSLog("User login successfully! - " + username)
                self.labelUserName.text = username
            } else {
                NSLog("User login failed. - " + username)
            }
        }
    }
    @IBAction func actionSignOut(sender: AnyObject) {
        PFUser.logOut()
        labelUserName.text = ""
    }
    @IBAction func actionResetPassword(sender: AnyObject) {
        PFUser.requestPasswordResetForEmail(textFieldUserName.text)
    }
}

