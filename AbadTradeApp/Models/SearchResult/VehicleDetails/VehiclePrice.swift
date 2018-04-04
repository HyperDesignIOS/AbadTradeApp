//
//    Itemprice.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class VehiclePrice : NSObject, NSCoding{
    
    var createdAt  = ""
    var id = ""
    var itemId = ""
    var nameAr = ""
    var nameEn = ""
    var price = ""
    var status = ""
    var updatedAt = ""
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: [String : Any]!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"] as! String
        id = json["id"] as! String
        itemId = json["item_id"] as! String
        nameAr = json["name_ar"] as! String
        nameEn = json["name_en"] as! String
        price = json["price"] as! String
        status = json["status"] as! String
        updatedAt = json["updated_at"] as! String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if price != nil{
            dictionary["price"] = price
        }
        if status != nil{
            dictionary["status"] = status
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = (aDecoder.decodeObject(forKey: "created_at") as? String)!
        id = (aDecoder.decodeObject(forKey: "id") as? String)!
        itemId = (aDecoder.decodeObject(forKey: "item_id") as? String)!
        nameAr = (aDecoder.decodeObject(forKey: "name_ar") as? String)!
        nameEn = (aDecoder.decodeObject(forKey: "name_en") as? String)!
        price = (aDecoder.decodeObject(forKey: "price") as? String)!
        status = (aDecoder.decodeObject(forKey: "status") as? String)!
        updatedAt = (aDecoder.decodeObject(forKey: "updated_at") as? String)!
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if itemId != nil{
            aCoder.encode(itemId, forKey: "item_id")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}
