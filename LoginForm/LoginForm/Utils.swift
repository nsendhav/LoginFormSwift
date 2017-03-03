//
//  Utils.swift
//  LoginForm
//
//  Created by Narendra Singh Sendhav on 3/3/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static public func isValidUsername(Input:String) -> Bool {
        let RegEx = "\\A\\w{7,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    static public func isValidEmail(Input:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: Input)
    }
    
    static public func showAlertWithTitle(title:String, message:String, onView controller:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
