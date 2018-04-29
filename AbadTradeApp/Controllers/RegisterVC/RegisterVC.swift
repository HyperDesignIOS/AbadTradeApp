//
//  RegisterVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit


class RegisterVC: UIViewController {
    
    var generalMethod = GeneralMethod()
    var user : User!
    var msg: String!
    var done : String!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SideMenuButton(_ sender: Any) {
        performSegue(withIdentifier: "registerSideMenu", sender: self)
    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
       let name = self.name.text!
        if name.isEmpty || name.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOUSERNAMEENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        let mail = self.mail.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOEMAILENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if !mail.isValidEmail() {
                  generalMethod.showAlert(title: "", message: NSLocalizedString("INVALIDEMAIL", comment: ""), vc: self, closure: nil)
                 return
        }
        let password = self.password.text!
        if password.isEmpty || password.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        else if password.count < 6 {
            generalMethod.showAlert(title: "", message: NSLocalizedString("SHORTPASSWORD", comment: ""), vc: self, closure: nil)
            return
        }
        let confirmpass = self.passwordConfirm.text!
        if confirmpass.isEmpty || confirmpass.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOCONFIRMATIONPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if password != confirmpass {
                 generalMethod.showAlert(title: "", message: NSLocalizedString("PASSWORDCONFIRMATIONFAILD", comment: ""), vc: self, closure: nil)
                return
        }
 
        apiRequests.apisInstance.register(userName:name, userMail:mail , userPassword:password) { (user,msg,done) in
            
            self.done = done
            if self.done == "1"{
            self.user = user as! User
            self.msg = msg
            print(self.user.name)
            UserDefaults.standard.setUserID(value: self.user.id)
            UserDefaults.standard.setLoggedIn(value: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
            self.show(controller, sender: self)
            }
            else if self.done == "0"
            {
                self.msg = msg
                self.generalMethod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
            }
          }
        
    }
}
