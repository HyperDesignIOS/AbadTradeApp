//
//  Extentions.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/3/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import UIKit

var kbHeight: CGFloat!
extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
    
}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func trimmedText()->String
    {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func hasNoCharchters() -> Bool
    {
        return trimmedText().count == 0
    }
    
    func isValidEmail() -> Bool
    {
        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool
    {
        let passRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d@#$%&;:'^{}<>,!\"'*=+-_|\\/\\\\]{8,}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", passRegex)
        let isValid = emailTest.evaluate(with: self)
        return isValid
    }
    
    func isValidPhone() -> Bool
    {
        
        //  let passRegex = "^(?:\\+971|00971|05)\\d{7,9}$"
        let passRegex =   "^[0-9]{11}$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", passRegex)
        let isValid = phoneTest.evaluate(with: self)
        return isValid
    }
    func containsWhiteSpace() -> Bool {
        
        // check if there's a range for a whitespace
        
        let range =  self.rangeOfCharacter(from: .whitespaces)
        
        // returns false when there's no range for whitespace
        if let _ = range {
            return true
        } else {
            return false
        }
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height - (self.view.constraints.last?.constant)!
            }
        }
    }
        
    @objc func keyboardWillHide(notification: NSNotification){
        
//        self.animateTextField(up: false)

//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
    }
    
}
