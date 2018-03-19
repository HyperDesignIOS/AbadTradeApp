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

    
    var statusOfVehicle = ""
    
    @IBAction func changeRadioButton(_ sender: UIButton) {
        switch sender.tag{
        case 5:
            imageSwap(forfirstimage: newRadioButton, andSecondImage: usedRdioButton)
                        statusOfVehicle = "new"
            
        case 6:
            imageSwap(forfirstimage: usedRdioButton, andSecondImage: newRadioButton)
            statusOfVehicle = "used"
            
            
        default:
            break
        }
        print (statusOfVehicle)
        
        
    }
    func imageSwap(forfirstimage firstImageView: UIImageView,andSecondImage secondImageView: UIImageView)
    {
        firstImageView.image = UIImage(named: "radio-on-button")
        secondImageView.image = UIImage(named: "empty")
        
    }
    
    //    @IBAction func sideMenuButton(_ sender: Any) {
//
//        let storyboard = UIStoryboard.init(name: "sideMenu", bundle: nil)
//        storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController")
//       // show(sideMenuVC, sender: self)
//    }
    var categories = [Category]()
    var images = [Image]()
    var brands = [Brand]()
    var models = [Model]()
    var years = [Year]()
    let statuses = [Status(name: "Used"),Status(name: "New")]
    
   
    
    var apisInstance = apiRequests()
    
   
   
    @IBOutlet weak var newRadioButton: UIImageView!
    
    @IBOutlet weak var usedRdioButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apisInstance.loadCategoriesAndImages { (categories, images) in
            self.categories = categories
            print(categories.count)
            self.images = images
        }
        apisInstance.getBrands(vehicleId: 5) { (brands) in
            self.brands = brands
        }
        apisInstance.getModels(brandId: 2) { (models) in
            self.models = models
        }
        //*****
        apisInstance.getYears(modelId: 1) { (years) in
            self.years = years
        }
        
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
    
    
    @IBAction func categoryButton(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    

    @IBAction func brandButton(_ sender:UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    
    @IBAction func modelButton(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    @IBAction func yearButton(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    @IBAction func statusButton(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "categorySegue" {

            if let destination = segue.destination as? searchTableViewController{

                if (sender as! UIButton).tag == 0 {//category

//                    des.data = categories
//                    des.selectedValue = self.selectedCat
//                    des.filterType = filterType
//                    destination.delegate = self
//                    destination.type = .Category
                    
                    destination.searchResultData = categories

                }else if (sender as! UIButton).tag == 1 {//brand
               
                    destination.searchResultData = brands

                }else if (sender as! UIButton).tag == 2{//model
                    
                    destination.searchResultData = models


                }else if (sender as! UIButton).tag == 3 {//year

                    destination.searchResultData = years
                }
                else if (sender as! UIButton).tag == 4 {//status
                    
                    destination.searchResultData = statuses
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

