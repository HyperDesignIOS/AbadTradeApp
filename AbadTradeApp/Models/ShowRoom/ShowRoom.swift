//
//    Dealer.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ShowRoom : NSObject, NSCoding{
    
    var aboutAr : String!
    var aboutEn : String!
    var addressAr : String!
    var addressEn : String!
    var areaId : String!
    var countryId : String!
    var createdAt : String!
    var id : String!
    var lat : String!
    var logo : String!
    var longField : String!
    var metaDesc : AnyObject!
    var metaKey : AnyObject!
    var nameAr : String!
    var nameEn : String!
    var phone : String!
    var regionId : String!
    var updatedAt : String!
    var userId : String!
    var workTimes : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        aboutAr = dictionary["about_ar"] as? String ?? ""
        aboutEn = dictionary["about_en"] as? String ?? ""
        addressAr = dictionary["address_ar"] as? String ?? ""
        addressEn = dictionary["address_en"] as? String ?? ""
        areaId = dictionary["area_id"] as? String ?? ""
        countryId = dictionary["country_id"] as? String ?? ""
        createdAt = dictionary["created_at"] as? String ?? ""
        id = dictionary["id"] as? String ?? ""
        lat = dictionary["lat"] as? String ?? ""
        logo = dictionary["logo"] as? String ?? ""
        longField = dictionary["long"] as? String ?? ""
        metaDesc = dictionary["meta_desc"] as AnyObject
        metaKey = dictionary["meta_key"] as AnyObject
        nameAr = dictionary["name_ar"] as? String ?? ""
        nameEn = dictionary["name_en"] as? String ?? ""
        phone = dictionary["phone"] as? String ?? ""
        regionId = dictionary["region_id"] as? String ?? ""
        updatedAt = dictionary["updated_at"] as? String ?? ""
        userId = dictionary["user_id"] as? String ?? ""
        workTimes = dictionary["work_times"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if aboutAr != nil{
            dictionary["about_ar"] = aboutAr
        }
        if aboutEn != nil{
            dictionary["about_en"] = aboutEn
        }
        if addressAr != nil{
            dictionary["address_ar"] = addressAr
        }
        if addressEn != nil{
            dictionary["address_en"] = addressEn
        }
        if areaId != nil{
            dictionary["area_id"] = areaId
        }
        if countryId != nil{
            dictionary["country_id"] = countryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lat != nil{
            dictionary["lat"] = lat
        }
        if logo != nil{
            dictionary["logo"] = logo
        }
        if longField != nil{
            dictionary["long"] = longField
        }
        if metaDesc != nil{
            dictionary["meta_desc"] = metaDesc
        }
        if metaKey != nil{
            dictionary["meta_key"] = metaKey
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if regionId != nil{
            dictionary["region_id"] = regionId
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if workTimes != nil{
            dictionary["work_times"] = workTimes
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        aboutAr = aDecoder.decodeObject(forKey: "about_ar") as? String
        aboutEn = aDecoder.decodeObject(forKey: "about_en") as? String
        addressAr = aDecoder.decodeObject(forKey: "address_ar") as? String
        addressEn = aDecoder.decodeObject(forKey: "address_en") as? String
        areaId = aDecoder.decodeObject(forKey: "area_id") as? String
        countryId = aDecoder.decodeObject(forKey: "country_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        lat = aDecoder.decodeObject(forKey: "lat") as? String
        logo = aDecoder.decodeObject(forKey: "logo") as? String
        longField = aDecoder.decodeObject(forKey: "long") as? String
        metaDesc = aDecoder.decodeObject(forKey: "meta_desc") as AnyObject
        metaKey = aDecoder.decodeObject(forKey: "meta_key") as AnyObject
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        regionId = aDecoder.decodeObject(forKey: "region_id") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        workTimes = aDecoder.decodeObject(forKey: "work_times") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if aboutAr != nil{
            aCoder.encode(aboutAr, forKey: "about_ar")
        }
        if aboutEn != nil{
            aCoder.encode(aboutEn, forKey: "about_en")
        }
        if addressAr != nil{
            aCoder.encode(addressAr, forKey: "address_ar")
        }
        if addressEn != nil{
            aCoder.encode(addressEn, forKey: "address_en")
        }
        if areaId != nil{
            aCoder.encode(areaId, forKey: "area_id")
        }
        if countryId != nil{
            aCoder.encode(countryId, forKey: "country_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lat != nil{
            aCoder.encode(lat, forKey: "lat")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if longField != nil{
            aCoder.encode(longField, forKey: "long")
        }
        if metaDesc != nil{
            aCoder.encode(metaDesc, forKey: "meta_desc")
        }
        if metaKey != nil{
            aCoder.encode(metaKey, forKey: "meta_key")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if regionId != nil{
            aCoder.encode(regionId, forKey: "region_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if workTimes != nil{
            aCoder.encode(workTimes, forKey: "work_times")
        }
        
    }
    
}

