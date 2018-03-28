//
//  ShowRoomItem.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/28/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//




import Foundation


class ShowRoomItem : NSObject, NSCoding{
    
    var brandId : String!
    var categoryId : String!
    var createdAt : String!
    var dealerId : String!
    var descriptionAr : String!
    var descriptionEn : String!
    var id : Int!
    var image : String!
    var linkAr : String!
    var linkEn : String!
    var luxury : String!
    var metaDesc : AnyObject!
    var metaKey : AnyObject!
    var modelId : String!
    var modelYearId : String!
    var nameAr : String!
    var nameEn : String!
    var priceType : String!
    var review : String!
    var status : String!
    var type : String!
    var updatedAt : String!
    var userId : String!
    var visites : AnyObject!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        brandId = dictionary["brand_id"] as? String
        categoryId = dictionary["category_id"] as? String
        createdAt = dictionary["created_at"] as? String
        dealerId = dictionary["dealer_id"] as? String
        descriptionAr = dictionary["description_ar"] as? String
        descriptionEn = dictionary["description_en"] as? String
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String
        linkAr = dictionary["link_ar"] as? String
        linkEn = dictionary["link_en"] as? String
        luxury = dictionary["luxury"] as? String
        metaDesc = dictionary["meta_desc"] as? AnyObject
        metaKey = dictionary["meta_key"] as? AnyObject
        modelId = dictionary["model_id"] as? String
        modelYearId = dictionary["model_year_id"] as? String
        nameAr = dictionary["name_ar"] as? String
        nameEn = dictionary["name_en"] as? String
        priceType = dictionary["price_type"] as? String
        review = dictionary["review"] as? String
        status = dictionary["status"] as? String
        type = dictionary["type"] as? String
        updatedAt = dictionary["updated_at"] as? String
        userId = dictionary["user_id"] as? String
        visites = dictionary["visites"] as? AnyObject
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
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if dealerId != nil{
            dictionary["dealer_id"] = dealerId
        }
        if descriptionAr != nil{
            dictionary["description_ar"] = descriptionAr
        }
        if descriptionEn != nil{
            dictionary["description_en"] = descriptionEn
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if linkAr != nil{
            dictionary["link_ar"] = linkAr
        }
        if linkEn != nil{
            dictionary["link_en"] = linkEn
        }
        if luxury != nil{
            dictionary["luxury"] = luxury
        }
        if metaDesc != nil{
            dictionary["meta_desc"] = metaDesc
        }
        if metaKey != nil{
            dictionary["meta_key"] = metaKey
        }
        if modelId != nil{
            dictionary["model_id"] = modelId
        }
        if modelYearId != nil{
            dictionary["model_year_id"] = modelYearId
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if priceType != nil{
            dictionary["price_type"] = priceType
        }
        if review != nil{
            dictionary["review"] = review
        }
        if status != nil{
            dictionary["status"] = status
        }
        if type != nil{
            dictionary["type"] = type
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if visites != nil{
            dictionary["visites"] = visites
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
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        dealerId = aDecoder.decodeObject(forKey: "dealer_id") as? String
        descriptionAr = aDecoder.decodeObject(forKey: "description_ar") as? String
        descriptionEn = aDecoder.decodeObject(forKey: "description_en") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        linkAr = aDecoder.decodeObject(forKey: "link_ar") as? String
        linkEn = aDecoder.decodeObject(forKey: "link_en") as? String
        luxury = aDecoder.decodeObject(forKey: "luxury") as? String
        metaDesc = aDecoder.decodeObject(forKey: "meta_desc") as? AnyObject
        metaKey = aDecoder.decodeObject(forKey: "meta_key") as? AnyObject
        modelId = aDecoder.decodeObject(forKey: "model_id") as? String
        modelYearId = aDecoder.decodeObject(forKey: "model_year_id") as? String
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String
        priceType = aDecoder.decodeObject(forKey: "price_type") as? String
        review = aDecoder.decodeObject(forKey: "review") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        visites = aDecoder.decodeObject(forKey: "visites") as? AnyObject
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if brandId != nil{
            aCoder.encode(brandId, forKey: "brand_id")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if dealerId != nil{
            aCoder.encode(dealerId, forKey: "dealer_id")
        }
        if descriptionAr != nil{
            aCoder.encode(descriptionAr, forKey: "description_ar")
        }
        if descriptionEn != nil{
            aCoder.encode(descriptionEn, forKey: "description_en")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if linkAr != nil{
            aCoder.encode(linkAr, forKey: "link_ar")
        }
        if linkEn != nil{
            aCoder.encode(linkEn, forKey: "link_en")
        }
        if luxury != nil{
            aCoder.encode(luxury, forKey: "luxury")
        }
        if metaDesc != nil{
            aCoder.encode(metaDesc, forKey: "meta_desc")
        }
        if metaKey != nil{
            aCoder.encode(metaKey, forKey: "meta_key")
        }
        if modelId != nil{
            aCoder.encode(modelId, forKey: "model_id")
        }
        if modelYearId != nil{
            aCoder.encode(modelYearId, forKey: "model_year_id")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if priceType != nil{
            aCoder.encode(priceType, forKey: "price_type")
        }
        if review != nil{
            aCoder.encode(review, forKey: "review")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if visites != nil{
            aCoder.encode(visites, forKey: "visites")
        }
        
    }
    
}

