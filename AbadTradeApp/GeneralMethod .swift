//
//  general method .swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/21/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import UIKit

  class GeneralMethod
  {
    var timer = Timer()
    
    func showAlert(title:String, message:String, vc:UIViewController, closure:(()->())?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            closure?()
        }
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func updateView(id : String , update : @escaping (String)->()) {
        
        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.setTimeLeft(id:update:)), userInfo: nil, repeats: true)

    }
    
    @objc func setTimeLeft(id : String , update : @escaping (String)->()) {
        
        // Only keep counting if timeEnd is bigger than timeNow
        apiRequests.apisInstance.updateCurrentBid(id: id) { (total) in
            update(total)
        }
    }
    
    func timerInvalidate(){
        timer.invalidate()
    }
    
    
    
    

}
