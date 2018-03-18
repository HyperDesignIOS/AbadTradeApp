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
    
   
    //    @IBAction func sideMenuButton(_ sender: Any) {
//
//        let storyboard = UIStoryboard.init(name: "sideMenu", bundle: nil)
//        storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController")
//       // show(sideMenuVC, sender: self)
//    }
    var categories = [Category]()
    var images = [Image]()
    var apisInstance = apiRequests()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apisInstance.loadCategoriesAndImages { (categories, images) in
            self.categories = categories
            print(categories.count)
            self.images = images
        }
//        apisInstance.getBrands(vehicleId: 5)
//        apisInstance.getModels(brandId: 2)
        customizeNavigationBar ()
       // SideMenuManager.default.menuLeftNavigationController =

        // to control the slide menu by touch
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "sideMenu", bundle: nil)
        let sideMenuVC = storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController")
        show(sideMenuVC, sender: self)
    }
    
    
    func customizeNavigationBar ()
    {
        UINavigationBar.appearance().barTintColor = UIColor.red
        //UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]

    }
    
    
    @IBAction func categoryBurron(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    

    @IBAction func brandButton(_ sender: Any) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
    
    @IBAction func modelButton(_ sender: Any) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
    @IBAction func yearButton(_ sender: Any) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
    @IBAction func statusButton(_ sender: Any) {
        performSegue(withIdentifier: "categoySegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "categorySegue" {
            
            if let destination = segue.destination as? searchTableViewController{
                
                if (sender as! UIButton).tag == 0 {//category
                    
//                    des.data = categories
//                    des.selectedValue = self.selectedCat
//                    des.filterType = filterType
//                    destination.delegate = self
                    destination.categories = categories
                    
                }else if (sender as! UIButton).tag == 1 {//brand
                    
                    
                    
                }else if (sender as! UIButton).tag ==
                    2{//model
                    
                    
                    
                }else if (sender as! UIButton).tag == 3 {//year
                    
                    
                }
                else if (sender as! UIButton).tag == 4 {//status
                    
                    
                    
                }
            }
//        }else if segue.identifier == "SearchSegue"{
//
////            if let des = segue.destination as? ResultViewController{
////
////                des.selectedCat = self.selectedCat
////                des.selectedReg = self.selectedReg
////                des.selectedSpec = self.selectedSpec
////                des.selectedArea = self.selectedArea
////                des.doctorName = self.lblDoctorName.text ?? ""
//
//            }
        }
    }
}

