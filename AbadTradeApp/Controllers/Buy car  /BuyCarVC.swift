//
//  BuyCarVC.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class BuyCarVC: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
    
    var id : Int!
    var price : [VehiclePrice]!
    var user : User!
    var selectedPrice : String!
    var general = GeneralMethod()

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var PhonTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var addressarTF: UITextField!
    @IBOutlet weak var addessenTF: UITextField!
//    @IBOutlet weak var firstImage: UIImageView!
//    @IBOutlet weak var firstPriceLabel: UILabel!
//    @IBOutlet weak var secondImage: UIImageView!
//    @IBOutlet weak var secondPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
           collectionView.delegate = self
           collectionView.dataSource = self
        
        
//        firstPriceLabel.text = price[0].price
//        secondPriceLabel.text = price[1].price
        nameTF.text = user.name
        nameTF.isEnabled = false
      //  addressarTF.text = addressar
       // addessenTF.text = addressen
       // PhonTF.text = phone
        emailTF.text = user.email
        //PhonTF.becomeFirstResponder()
        
         self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PhonTF.becomeFirstResponder()
    }
    
    
//    @IBAction func priceRadioButton(_ sender: UIButton) {
//
//        switch sender.tag{
//        case 0:
//            imageSwap(forfirstimage: firstImage, andSecondImage: secondImage)
//            selectedPrice = price[0].id
//
//        case 1:
//            imageSwap(forfirstimage: secondImage, andSecondImage: firstImage)
//            selectedPrice = price[1].id
//
//        default:
//            break
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return price.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "priceCell", for: indexPath)
        as! priceCell
//        let item = price[indexPath.row]
//        cell.setup(item: item)
        cell.priceLabel.text = price[indexPath.row].price
        cell.emptyImage.image = #imageLiteral(resourceName: "empty")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let cell = collectionView.cellForItem(at: indexPath) as! priceCell
        print(indexPath.row)
//        selectedPrice = price[indexPath.row]
//        selectedPrice.isPlaying = !selectedPrice.isPlaying
//
//        for cell in tableView.visibleCells {
//            guard let visibleCell = cell as? RadioTableViewCell else { return }
//            let path = tableView.indexPathForCell(visibleCell)
//            let item = items[path.row]
//            item.isPlaying = visibleCell == selectedCell
//            visibleCell.setup(item: item)
//        }
//        cell.emptyImage.image = #imageLiteral(resourceName: "radio-on-button")

        for cell in collectionView.visibleCells {
            let visiableCell = cell as! priceCell
            if collectionView.indexPath(for: visiableCell)?.row == indexPath.row{
                visiableCell.emptyImage.image = #imageLiteral(resourceName: "radio-on-button")
                selectedPrice = price[indexPath.row].price
            }
            else{
                visiableCell.emptyImage.image = #imageLiteral(resourceName: "empty")
            }
        }
    }


    @IBAction func BuyButton(_ sender: Any) {
        
        let email = emailTF.text
        let phone = PhonTF.text
        let addressAr = addessenTF.text
        let addressEn = addessenTF.text
        
        if (email?.isEmpty)! || (email?.containsWhiteSpace())!{
            general.showAlert(title: "", message: "please enter your e-mail", vc: self, closure: nil)
            return
        }
        else if !(email?.isValidEmail())!{
            general.showAlert(title: "", message: "invalid e-mail", vc: self, closure: nil)
            return
        }
        
        if (phone?.isEmpty)! || (phone?.containsWhiteSpace())!{
            general.showAlert(title: "", message: "please enter your phone", vc: self, closure: nil)
            return
        }
        else if !(phone?.isValidPhone())!{
            general.showAlert(title: "", message: "invalid phone", vc: self, closure: nil)
            return
        }
        
        if (addressAr?.isEmpty)! || (addressAr?.containsWhiteSpace())!{
            general.showAlert(title: "", message: "please enter your address in Arabic", vc: self, closure: nil)
            return
        }
        
        if (addressEn?.isEmpty)! || (addressEn?.containsWhiteSpace())!{
            general.showAlert(title: "", message: "please enter your address in English", vc: self, closure: nil)
            return
        }
        
        
        apiRequests.apisInstance.postBuyCar(id: "\(id!)", userId: "\(user.id!)", price: selectedPrice!,phone : PhonTF.text!, email: emailTF.text!, addressar: addressarTF.text!, addressen: addessenTF.text!) { (msg, done) in
            
            if done == "1"
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
                //self.present(controller, animated: true, completion: nil)
                self.show(controller, sender: self)
                
                self.general.showAlert(title: "", message: msg, vc:self, closure:nil )
            }
            else
            {
                
                self.general.showAlert(title: "", message: msg, vc:self, closure:nil )
            }
            
        }
        
    }
    

    func imageSwap(forfirstimage firstImageView: UIImageView,andSecondImage secondImageView: UIImageView)
    {
        firstImageView.image = UIImage(named: "radio-on-button")
        secondImageView.image = UIImage(named: "empty")
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
}


