//
//  RegisterVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit


class RegisterVC: UIViewController {

    @IBAction func SideMenuButton(_ sender: Any) {
         performSegue(withIdentifier: "registerSideMenu", sender: self)
    }
    var user : User!

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordConfirmText: UITextField!
    
    @IBAction func RegisterButton(_ sender: Any) {
        apiRequests.apisInstance.register(userName: nameText.text!, userMail:mailText.text! , userPassword: passwordText.text!) { (user) in
            self.user = user as! User
            print(self.user.name)
          }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
