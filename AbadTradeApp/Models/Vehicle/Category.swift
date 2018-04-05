//
//  Category.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category : NSObject, NSCoding{
    
    var id : Int!
    var nameAr : String!
    var nameEn : String!
    var categoryImage : String!
    
    
  
    init(fromDictionary dictionary: [String : Any]){
        id = dictionary["id"] as! Int
        nameAr = dictionary["name_ar"] as? String ?? ""
        nameEn = dictionary["name_en"] as? String ?? ""
        categoryImage = dictionary["image"] as? String ?? ""
    }
    

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String ?? ""
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String ?? ""
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
    }
}
