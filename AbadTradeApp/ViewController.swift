//
//  ViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.


import UIKit
import SideMenu
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBAction func sideMenuButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "sideMenu", bundle: nil)
        let sideMenuVC = storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController")
        show(sideMenuVC, sender: self)
    }
    var categoriesArray = [Category]()
    var imagesArray = [Image]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNavigationBar ()
      SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        
        // to control the slide menu by touch
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func customizeNavigationBar ()
    {
        UINavigationBar.appearance().barTintColor = UIColor.red
        //UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]

    }


}

