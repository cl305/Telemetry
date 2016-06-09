////
////  Export.swift
////  GyroTest
////
////  Created by Cody Li on 6/9/16.
////  Copyright © 2016 Cody Li. All rights reserved.
////
//
//import Foundation
//import MessageUI
//
//class Export{
//    
//    var mailString : NSMutableString
//    var data : NSData?
//    
//    init(mailString : NSMutableString){
//        self.mailString = mailString
//        self.data = mailString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
//        
//        if let content = data{
//            print("NSData : \(content)")
//        }
//    }
//    
//    func configuredMailComposeViewController() -> MFMailComposeViewController {
//        let emailController = MFMailComposeViewController()
//        emailController.mailComposeDelegate = self
//        emailController.setSubject("CSV File")
//        emailController.setMessageBody("", isHTML: false)
//        
//        emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Telemetry.csv")
//        
//        return emailController
//    }
//    
//    func convert{
//        let emailViewController = configuredMailComposeViewController()
//        if MFMailComposeViewController.canSendMail(){
//            self.presentViewController(emailViewController, animated: true, completion: nil)
//        }
//    }
//}