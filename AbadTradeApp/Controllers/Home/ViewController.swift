//
//  ViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.


import UIKit
import SideMenu
import SwiftyJSON
import Alamofire
import ImageSlideshow
import AlamofireImage

class ViewController: UIViewController , searchVCProtocol{
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    let statuses = [Status(name: "Used"),Status(name: "New")]
    var statusOfVehicle = String()
    var categories = [Category]()
    var images = [Image]()
    var brands = [Brand]()
    var models = [Model]()
    var years = [Year]()
//    var searchResults = [SearchResultItem]()
    var filterType : FilterType!
    var selectedCategory : Category!
    var selectedBrand = Brand()
    var selectedModel = Model()
    var selectedYear = Year()
   
    //var apisInstance = apiRequests()
    var showAlert = GeneralMethod()
    var delegate : searchVCProtocol!
    
    @IBOutlet weak var newRadioButton: UIImageView!
    @IBOutlet weak var usedRdioButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        apiRequests.apisInstance.loadCategoriesAndImages { (categories, images) in
            self.categories = categories
            print(categories.count)
            self.images = images
            self.slider()
        }
   
        customizeNavigationBar ()
       // SideMenuManager.default.menuLeftNavigationController
        // to control the slide menu by touch
      //  SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeNavigationBar ()
    {
        UINavigationBar.appearance().barTintColor = UIColor.red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        
        performSegue(withIdentifier: "sideMenuSegue", sender: self)
    }
    
    @IBAction func categoryButton(_ sender: UIButton) {
        
        filterType = FilterType.Category
        performSegue(withIdentifier: "categorySegue", sender: sender)
    }
    

    @IBAction func brandButton(_ sender:UIButton) {
        filterType = FilterType.Brand
        if selectedCategory != nil {
            performSegue(withIdentifier: "categorySegue", sender: sender)
        }
        else
        {
            showAlert.showAlert(title: "", message: "Select category first", vc: self, closure: nil)
        }
    }
    
    @IBAction func modelButton(_ sender: UIButton) {
        
        filterType = FilterType.Model
        if selectedCategory != nil{
            if selectedBrand.id != "0" {
                performSegue(withIdentifier: "categorySegue", sender: sender)
            }
            else
            {
                showAlert.showAlert(title: "", message: "Select brand first", vc: self, closure: nil)
            }
            
        }
        else{
              showAlert.showAlert(title: "", message: "Select category first", vc: self, closure: nil)
        }
        
    }
    @IBAction func yearButton(_ sender: UIButton) {
        
        filterType = FilterType.Year
       
        if selectedCategory != nil{
            if selectedBrand.id != "0" {
                if selectedModel.id != "0" {
                performSegue(withIdentifier: "categorySegue", sender: sender)
                }else{
                    showAlert.showAlert(title: "", message: "Select model first", vc: self, closure: nil)
                }
            }
            else
            {
                showAlert.showAlert(title: "", message: "Select brand first", vc: self, closure: nil)
            }
            
        }
        else{
            showAlert.showAlert(title: "", message: "Select category first", vc: self, closure: nil)
            
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
        if selectedCategory
            != nil {
                self.performSegue(withIdentifier: "vehicleResultSegue", sender: self)
        }else{
            showAlert.showAlert(title: "", message: "Please select search data", vc: self, closure: nil)
        }
    }
    func slider(){
        slideShow.setImageInputs([
            AlamofireSource(urlString: "\(SliderImagesURL)\(images[0].headerPhoto1!)")!,AlamofireSource(urlString: "\(SliderImagesURL)\(images[0].headerPhoto2!)")!,AlamofireSource(urlString: "\(SliderImagesURL)\(images[0].headerPhoto3!)")!
            ])
        slideShow.slideshowInterval = 2
    //        slideShow.zoomEnabled = true
   //    slideShow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "categorySegue" {

            if let destination = segue.destination as? searchTableViewController{

                if (sender as! UIButton).tag == 0 {//category
                    
                    destination.delegate = self
                    destination.searchResultData = categories

                }else if (sender as! UIButton).tag == 1 {//brand
               
                    destination.selectedObject = self.selectedBrand
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
        }else if segue.identifier == "vehicleResultSegue"
        {
            if let destination = segue.destination as? VehicleResultTableViewController{
                destination.selectedCategory = selectedCategory
                destination.selectedBrand = selectedBrand
                destination.selectedModel = selectedModel
                destination.selectedYear = selectedYear
                destination.statusOfVehicle = statusOfVehicle
            }
        }
        else if segue.identifier == "sideMenuSegue"{
            if let navigation = segue.destination as? UISideMenuNavigationController {
                if let destination = navigation.topViewController as? SideMenuTableViewController{
                    destination.vehicles = self.categories
                }
            }
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
                print(selectedCategory.id)
                categoryTextField.text = selectedCategory.nameEn
                /*(Localize.currentLanguage() == "en" ? selectedCat?.nameEn : selectedCat?.nameAr)*/
                brandTextField.text = ""
                modelTextField.text = ""
                yearTextField.text = ""
                //self.selectedBrand = nil
                apiRequests.apisInstance.getBrands(vehicleId:  selectedCategory.id, didDataReady: { (brands) in
                    self.brands = brands
                })
                
            }else if ft == FilterType.Brand{
                
                selectedBrand = selectedValue as! Brand
                brandTextField.text = selectedBrand.nameEn
                modelTextField.text = ""
                //self.selectedModel = nil
                apiRequests.apisInstance.getModels(brandId: Int(selectedBrand.id)!, didDataReady: { (models) in
                    self.models = models
                })
            }else if ft == FilterType.Model{
                
                selectedModel = selectedValue as! Model
                modelTextField.text = selectedModel.nameEn
                apiRequests.apisInstance.getYears(modelId: Int(selectedModel.id)!, didDataReady: { (years) in
                    self.years = years
                })
                
            }else if ft == FilterType.Year{
                
                selectedYear = selectedValue as! Year
                yearTextField.text = selectedYear.year
            }
        }
    }
}

