//
//    Itemoption.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class VehicleOption : NSObject, NSCoding{
    
    var catOptionsId : String!
    var createdAt : String!
    var id : String!
    var itemId : String!
    var updatedAt : String!
    var valueAr : String!
    var valueEn : String!
    var nameEn : String!
    var nameAr : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: [String : Any]!){
        if json.isEmpty{
            return
        }
        catOptionsId = json["cat_options_id"] as! String
        createdAt = json["created_at"] as! String
        id = json["id"] as! String
        itemId = json["item_id"] as! String
        updatedAt = json["updated_at"] as! String
        valueAr = json["value_ar"] as! String
        valueEn = json["value_en"] as! String
        nameEn = json["name_en"] as! String
        nameAr = json["name_ar"] as! String

    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if catOptionsId != nil{
            dictionary["cat_options_id"] = catOptionsId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if valueAr != nil{
            dictionary["value_ar"] = valueAr
        }
        if valueEn != nil{
            dictionary["value_en"] = valueEn
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        catOptionsId = aDecoder.decodeObject(forKey: "cat_options_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        itemId = aDecoder.decodeObject(forKey: "item_id") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        valueAr = aDecoder.decodeObject(forKey: "value_ar") as? String
        valueEn = aDecoder.decodeObject(forKey: "value_en") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if catOptionsId != nil{
            aCoder.encode(catOptionsId, forKey: "cat_options_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if itemId != nil{
            aCoder.encode(itemId, forKey: "item_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if valueAr != nil{
            aCoder.encode(valueAr, forKey: "value_ar")
        }
        if valueEn != nil{
            aCoder.encode(valueEn, forKey: "value_en")
        }
        
    }
    
}
