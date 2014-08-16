//
//  NotificationViewController.swift
//  UserManDemo
//
//  Created by Richard Lee on 8/15/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBAction func sendNotification(sender: AnyObject) {
        // Create our Installation query
        var pushQuery = PFInstallation.query()
        pushQuery.whereKey("deviceType", equalTo: "ios")

        // Send push notification to query
        PFPush.sendPushMessageToQueryInBackground(pushQuery, withMessage: "Hello World!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
