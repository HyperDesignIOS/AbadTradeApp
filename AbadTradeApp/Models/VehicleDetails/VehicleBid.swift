//
//    Itembid.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class VehicleBid : NSObject, NSCoding{
    
    var createdAt : String!
    var endDate : String!
    var id : Int!
    var itemId : String!
    var maximumBid : String!
    var minimumBid : String!
    var startBid : String!
    var startDate : String!
    var statusDate : String!
    var updatedAt : String!
    
    
    override init() {
        
    }
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: [String : Any]!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"] as! String
        endDate = json["end_date"] as! String
        id = json["id"] as! Int
        itemId = json["item_id"] as! String
        maximumBid = json["maximum_bid"] as! String
        minimumBid = json["minimum_bid"] as! String
        startBid = json["start_bid"] as! String
        startDate = json["start_date"] as! String
        statusDate = json["status_date"] as! String
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
        if endDate != nil{
            dictionary["end_date"] = endDate
        }
        if id != nil{
            dictionary["id"] = id
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if maximumBid != nil{
            dictionary["maximum_bid"] = maximumBid
        }
        if minimumBid != nil{
            dictionary["minimum_bid"] = minimumBid
        }
        if startBid != nil{
            dictionary["start_bid"] = startBid
        }
        if startDate != nil{
            dictionary["start_date"] = startDate
        }
        if statusDate != nil{
            dictionary["status_date"] = statusDate
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
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        endDate = aDecoder.decodeObject(forKey: "end_date") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        itemId = aDecoder.decodeObject(forKey: "item_id") as? String
        maximumBid = aDecoder.decodeObject(forKey: "maximum_bid") as? String
        minimumBid = aDecoder.decodeObject(forKey: "minimum_bid") as? String
        startBid = aDecoder.decodeObject(forKey: "start_bid") as? String
        startDate = aDecoder.decodeObject(forKey: "start_date") as? String
        statusDate = aDecoder.decodeObject(forKey: "status_date") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        
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
        if endDate != nil{
            aCoder.encode(endDate, forKey: "end_date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if itemId != nil{
            aCoder.encode(itemId, forKey: "item_id")
        }
        if maximumBid != nil{
            aCoder.encode(maximumBid, forKey: "maximum_bid")
        }
        if minimumBid != nil{
            aCoder.encode(minimumBid, forKey: "minimum_bid")
        }
        if startBid != nil{
            aCoder.encode(startBid, forKey: "start_bid")
        }
        if startDate != nil{
            aCoder.encode(startDate, forKey: "start_date")
        }
        if statusDate != nil{
            aCoder.encode(statusDate, forKey: "status_date")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}
