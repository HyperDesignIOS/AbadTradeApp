//
//    Item.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class VehicleItemDetails : NSObject, NSCoding{
    
    var brand : Brand!
    var brandId : String!
    var categoryId : String!
    var createdAt : String!
    var dealer : ShowRoom!
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
    var modYear : ModYear!
    var model : Model!
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
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: [String : Any]!){
        if json.isEmpty{
            return
        }
        if let brandData = json["brand"] as? [String:Any]{
            brand = Brand(fromJson: brandData)
        }
        brandId = json["brand_id"] as? String ?? ""
        categoryId = json["category_id"] as? String ?? ""
        createdAt = json["created_at"] as? String ?? ""
        if let dealerData = json["dealer"] as? [String:Any]{
            dealer = ShowRoom(fromDictionary: dealerData)
        }
        dealerId = json["dealer_id"] as? String ?? ""
        descriptionAr = json["description_ar"] as? String ?? ""
        descriptionEn = json["description_en"] as? String ?? ""
        id = json["id"] as! Int
        image = json["image"] as? String ?? ""
        linkAr = json["link_ar"]as? String ?? ""
        linkEn = json["link_en"]as? String ?? ""
        luxury = json["luxury"]as? String ?? ""
        metaDesc = json["meta_desc"] as AnyObject
        metaKey = json["meta_key"] as AnyObject
        if let modYearJson = json["mod_year"] as? [String:Any]{
            modYear = ModYear(fromJson: modYearJson)
        }
        if let modelData = json["model"] as? [String:Any]{
            model = Model(fromJson: modelData)
        }
        modelId = json["model_id"]as? String ?? ""
        modelYearId = json["model_year_id"]as? String ?? ""
        nameAr = json["name_ar"]as? String ?? ""
        nameEn = json["name_en"]as? String ?? ""
        priceType = json["price_type"]as? String ?? ""
       // review = json["review"]as! String
        status = json["status"]as? String ?? ""
        type = json["type"]as? String ?? ""
        updatedAt = json["updated_at"]as? String ?? ""
        userId = json["user_id"]as? String ?? ""
        visites = json["visites"] as AnyObject
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if brand != nil{
            dictionary["brand"] = brand.toDictionary()
        }
        if brandId != nil{
            dictionary["brand_id"] = brandId
        }
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if dealer != nil{
            dictionary["dealer"] = dealer.toDictionary()
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
        if modYear != nil{
            dictionary["mod_year"] = modYear.toDictionary()
        }
        if model != nil{
            dictionary["model"] = model.toDictionary()
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
        brand = aDecoder.decodeObject(forKey: "brand") as? Brand
        brandId = aDecoder.decodeObject(forKey: "brand_id") as? String
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        dealer = aDecoder.decodeObject(forKey: "dealer") as? ShowRoom
        dealerId = (aDecoder.decodeObject(forKey: "dealer_id") as? String)!
        descriptionAr = aDecoder.decodeObject(forKey: "description_ar") as? String
        descriptionEn = aDecoder.decodeObject(forKey: "description_en") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        linkAr = aDecoder.decodeObject(forKey: "link_ar") as? String
        linkEn = aDecoder.decodeObject(forKey: "link_en") as? String
        luxury = aDecoder.decodeObject(forKey: "luxury") as? String
        metaDesc = aDecoder.decodeObject(forKey: "meta_desc") as AnyObject
        metaKey = aDecoder.decodeObject(forKey: "meta_key") as AnyObject
        modYear = aDecoder.decodeObject(forKey: "mod_year") as? ModYear
        model = aDecoder.decodeObject(forKey: "model") as? Model
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
        visites = aDecoder.decodeObject(forKey: "visites") as AnyObject
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if brand != nil{
            aCoder.encode(brand, forKey: "brand")
        }
        if brandId != nil{
            aCoder.encode(brandId, forKey: "brand_id")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if dealer != nil{
            aCoder.encode(dealer, forKey: "dealer")
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
        if modYear != nil{
            aCoder.encode(modYear, forKey: "mod_year")
        }
        if model != nil{
            aCoder.encode(model, forKey: "model")
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
