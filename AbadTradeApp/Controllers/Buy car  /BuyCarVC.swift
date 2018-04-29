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


    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        collectionView.delegate = self
        collectionView.dataSource = self
        nameTF.text = user.name
        nameTF.isEnabled = false
        emailTF.text = user.email
        buyButton.setTitle(NSLocalizedString("BUY", comment: ""), for: .normal)
        self.hideKeyboardWhenTappedAround()
    }

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
        
        print(indexPath.row)
        for cell in collectionView.visibleCells {
            let visiableCell = cell as! priceCell
            if collectionView.indexPath(for: visiableCell)?.row == indexPath.row{
                visiableCell.emptyImage.image = #imageLiteral(resourceName: "radio-on-button")
                selectedPrice = price[indexPath.row].id
            }
            else{
                visiableCell.emptyImage.image = #imageLiteral(resourceName: "empty")
            }
        }
    }


    @IBAction func BuyButton(_ sender: Any) {
        
        let email = emailTF.text
        let phone = PhonTF.text
        let addressAr = addressarTF.text
        let addressEn = addessenTF.text
        
        if selectedPrice == nil {
            general.showAlert(title: "", message: NSLocalizedString("NOPRICESELECTED", comment: ""), vc: self, closure: nil)
            return
        }
        if (email?.isEmpty)! || (email?.containsWhiteSpace())!{
            general.showAlert(title: "", message: NSLocalizedString("NOEMAILENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if !(email?.isValidEmail())!{
            general.showAlert(title: "", message: NSLocalizedString("INVALIDEMAIL", comment: ""), vc: self, closure: nil)
            return
        }
        
        if (phone?.isEmpty)! || (phone?.containsWhiteSpace())!{
            general.showAlert(title: "", message: NSLocalizedString("NOPHONEENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if !(phone?.isValidPhone())!{
            general.showAlert(title: "", message: NSLocalizedString("INVALIDPHONE", comment: ""), vc: self, closure: nil)
            return
        }
        
        if (addressAr?.isEmpty)! || (addressAr?.containsWhiteSpace())!{
            general.showAlert(title: "", message: NSLocalizedString("NOARADDRESSENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        
        if (addressEn?.isEmpty)! || (addressEn?.containsWhiteSpace())!{
            general.showAlert(title: "", message: NSLocalizedString("NOENADDRESSENTERED", comment: ""), vc: self, closure: nil)
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
}


