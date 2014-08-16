//
//  NotificationViewController.swift
//  UserManDemo
//
//  Created by Richard Lee on 8/15/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet var labelTextA: UILabel!
    @IBOutlet var labelTextB: UILabel!
    var d: NSDictionary = [:]

    @IBAction func sendNotification(sender: AnyObject) {
        // Create our Installation query
        var pushQuery = PFInstallation.query()
        pushQuery.whereKey("deviceType", equalTo: "ios")

        // Send push notification to query
        PFPush.sendPushMessageToQueryInBackground(pushQuery, withMessage: "Hello World!")
    }

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        NSLog("Initialize View Controller")

        d = [ "a": 1, "b": "Woe"]
    }

    init(data param: NSDictionary) {
        super.init(nibName: nil, bundle: nil)
        self.d = param
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add an observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update", name: "notification", object: nil)
    }

    func update() {
        NSLog("updated")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

//        if d.count != 0 {
//            NSLog(d.description)
//            let a = d["a"] as? Int
//            self.labelTextA.text = "h"
//            if a != nil { self.labelTextA.text = String(a!) }
//            let b = d["b"] as? String
//            if b != nil { self.labelTextB.text = b }
//        }
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
