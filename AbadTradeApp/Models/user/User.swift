//
//  User.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 4/1/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

//
//    User.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class User : NSObject, NSCoding{
    
    var addressAr : AnyObject!
    var addressEn : AnyObject!
    var admin : String!
    var areaId : AnyObject!
    var createdAt : String!
    var email : String!
    var id : Int!
    var name : String!
    var phone : AnyObject!
    var regionId : AnyObject!
    var type : String!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        addressAr = dictionary["address_ar"] as AnyObject
        addressEn = dictionary["address_en"] as AnyObject
        admin = dictionary["admin"] as? String ?? ""
        areaId = dictionary["area_id"] as AnyObject
        createdAt = dictionary["created_at"] as? String ?? ""
        email = dictionary["email"] as? String ?? ""
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String ?? ""
        phone = dictionary["phone"] as AnyObject
        regionId = dictionary["region_id"] as AnyObject
        type = dictionary["type"] as? String ?? ""
        updatedAt = dictionary["updated_at"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if addressAr != nil{
            dictionary["address_ar"] = addressAr
        }
        if addressEn != nil{
            dictionary["address_en"] = addressEn
        }
        if admin != nil{
            dictionary["admin"] = admin
        }
        if areaId != nil{
            dictionary["area_id"] = areaId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if regionId != nil{
            dictionary["region_id"] = regionId
        }
        if type != nil{
            dictionary["type"] = type
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
        addressAr = aDecoder.decodeObject(forKey: "address_ar") as? AnyObject
        addressEn = aDecoder.decodeObject(forKey: "address_en") as? AnyObject
        admin = aDecoder.decodeObject(forKey: "admin") as? String
        areaId = aDecoder.decodeObject(forKey: "area_id") as? AnyObject
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? AnyObject
        regionId = aDecoder.decodeObject(forKey: "region_id") as? AnyObject
        type = aDecoder.decodeObject(forKey: "type") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if addressAr != nil{
            aCoder.encode(addressAr, forKey: "address_ar")
        }
        if addressEn != nil{
            aCoder.encode(addressEn, forKey: "address_en")
        }
        if admin != nil{
            aCoder.encode(admin, forKey: "admin")
        }
        if areaId != nil{
            aCoder.encode(areaId, forKey: "area_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if regionId != nil{
            aCoder.encode(regionId, forKey: "region_id")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}
