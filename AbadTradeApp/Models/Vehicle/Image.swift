//
//  Image.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation

class Image : NSObject, NSCoding{
    
    var headerPhoto1 : String!
    var headerPhoto2 : String!
    var headerPhoto3 : String!
    var lang : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        headerPhoto1 = dictionary["header_photo1"] as? String
        headerPhoto2 = dictionary["header_photo2"] as? String
        headerPhoto3 = dictionary["header_photo3"] as? String
        lang = dictionary["lang"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if headerPhoto1 != nil{
            dictionary["header_photo1"] = headerPhoto1
        }
        if headerPhoto2 != nil{
            dictionary["header_photo2"] = headerPhoto2
        }
        if headerPhoto3 != nil{
            dictionary["header_photo3"] = headerPhoto3
        }
        if lang != nil{
            dictionary["lang"] = lang
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        headerPhoto1 = aDecoder.decodeObject(forKey: "header_photo1") as? String
        headerPhoto2 = aDecoder.decodeObject(forKey: "header_photo2") as? String
        headerPhoto3 = aDecoder.decodeObject(forKey: "header_photo3") as? String
        lang = aDecoder.decodeObject(forKey: "lang") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if headerPhoto1 != nil{
            aCoder.encode(headerPhoto1, forKey: "header_photo1")
        }
        if headerPhoto2 != nil{
            aCoder.encode(headerPhoto2, forKey: "header_photo2")
        }
        if headerPhoto3 != nil{
            aCoder.encode(headerPhoto3, forKey: "header_photo3")
        }
        if lang != nil{
            aCoder.encode(lang, forKey: "lang")
        }
        
    }
    
}
