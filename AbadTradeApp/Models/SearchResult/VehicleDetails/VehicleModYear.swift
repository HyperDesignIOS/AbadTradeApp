//
//    ModYear.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class ModYear : NSObject, NSCoding{
    
    var brandId : String!
    var createdAt : String!
    var id : String!
    var modelId : String!
    var status : String!
    var updatedAt : String!
    var year : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: [String : Any]!){
        if json.isEmpty{
            return
        }
        brandId = json["brand_id"]as! String
        createdAt = json["created_at"]as! String
        id = json["id"]as! String
        modelId = json["model_id"]as! String
        status = json["status"]as! String
        updatedAt = json["updated_at"]as! String
        year = json["year"]as! String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if brandId != nil{
            dictionary["brand_id"] = brandId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if modelId != nil{
            dictionary["model_id"] = modelId
        }
        if status != nil{
            dictionary["status"] = status
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if year != nil{
            dictionary["year"] = year
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        brandId = aDecoder.decodeObject(forKey: "brand_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        modelId = aDecoder.decodeObject(forKey: "model_id") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        year = aDecoder.decodeObject(forKey: "year") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if brandId != nil{
            aCoder.encode(brandId, forKey: "brand_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if modelId != nil{
            aCoder.encode(modelId, forKey: "model_id")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if year != nil{
            aCoder.encode(year, forKey: "year")
        }
        
    }
    
}
