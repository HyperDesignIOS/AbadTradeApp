//
//  ViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.


import UIKit
import SideMenu
import SwiftyJSON

class ViewController: UIViewController , searchVCProtocol{
    

    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    var statusOfVehicle = ""
    var categories = [Category]()
    var images = [Image]()
    var brands = [Brand]()
    var models = [Model]()
    var years = [Year]()
    let statuses = [Status(name: "Used"),Status(name: "New")]
    var filterType : FilterType!
    var selectedCategory : Category!
    var selectedBrand : Brand!
    var selectedModel : Model!
    var selectedYear : Year!
   
    
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
        
        filterType = FilterType.Category
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    

    @IBAction func brandButton(_ sender:UIButton) {
        filterType = FilterType.Brand

        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    
    @IBAction func modelButton(_ sender: UIButton) {
        
        filterType = FilterType.Model
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    @IBAction func yearButton(_ sender: UIButton) {
        
        filterType = FilterType.Year
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "categorySegue" {

            if let destination = segue.destination as? searchTableViewController{

                if (sender as! UIButton).tag == 0 {//category

//                    des.selectedValue = self.selectedCat
//                    des.filterType = filterType
                    destination.delegate = self
                    destination.searchResultData = categories

                }else if (sender as! UIButton).tag == 1 {//brand
               
                    destination.delegate = self
                    destination.searchResultData = brands

                }else if (sender as! UIButton).tag == 2{//model
                    destination.delegate = self
                    destination.searchResultData = models


                }else if (sender as! UIButton).tag == 3 {//year

                    destination.delegate = self
                    destination.searchResultData = years
                }
                else if (sender as! UIButton).tag == 4 {//status
                    destination.delegate = self
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
    
    func handelSelection(selectedValue: AnyObject) {
        
        if let ft = filterType{
            
            if ft == FilterType.Category{
                
                selectedCategory = selectedValue as! Category
                categoryTextField.text = selectedCategory.nameEn
                /*(Localize.currentLanguage() == "en" ? selectedCat?.nameEn : selectedCat?.nameAr)*/
                brandTextField.text = ""
                modelTextField.text = ""
                yearTextField.text = ""
                self.selectedBrand = nil
                apisInstance.getBrands(vehicleId:  selectedCategory.id, didDataReady: { (brands) in
                    self.brands = brands
                })
                
            }else if ft == FilterType.Brand{
                
                selectedBrand = selectedValue as! Brand
                brandTextField.text = selectedBrand.nameEn
                modelTextField.text = ""
                self.selectedModel = nil
                apisInstance.getModels(brandId: Int(selectedBrand.id)!, didDataReady: { (models) in
                    self.models = models
                })
            }else if ft == FilterType.Model{
                
                selectedModel = selectedValue as! Model
                modelTextField.text = selectedModel.nameEn
                apisInstance.getYears(modelId: Int(selectedModel.id)!, didDataReady: { (years) in
                    self.years = years
                })
                
            }else if ft == FilterType.Year{
                
                selectedYear = selectedValue as! Year
                yearTextField.text = selectedYear.year
            }
        }
    }
}

