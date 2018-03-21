//
//  Year.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/19/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//


import Foundation
import SwiftyJSON



class Year : NSObject, NSCoding{
    
    var id : String!
    var year : String!
    
    
    override init() {
        id = "0"
        year = ""
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = String(describing: dictionary["id"])
        year = dictionary["year"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
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
        id = aDecoder.decodeObject(forKey: "id") as? String
        year = aDecoder.decodeObject(forKey: "year") as? String
        
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
        if year != nil{
            aCoder.encode(year, forKey: "year")
        }
        
    }
    
}
