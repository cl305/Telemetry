//
//  ViewController.swift
//  GyroTest
//
//  Created by Cody Li on 6/8/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate{

    var tele : Telemetry!
    @IBOutlet weak var sendMailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tele = Telemetry()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMail(sender: AnyObject) {
        print(MFMailComposeViewController.canSendMail())
        if (MFMailComposeViewController.canSendMail()){
            print("passed this check")
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            mailComposer.setSubject("CSV File")
            mailComposer.setMessageBody("body text", isHTML: false)
            var data = tele.dataString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            if let content = data{
                print("NSData : \(content)")
            }
            print("\(data)")
            
            mailComposer.addAttachmentData(data!, mimeType: "text/csv", fileName: "Telemetry.csv")
            self.presentViewController(mailComposer, animated: true, completion: nil)
            
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

}

