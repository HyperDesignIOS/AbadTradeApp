//
//  ServerManager.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/13/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import Alamofire


enum ErrorCode:Int
{
    case Caneled = -999
    case NoInternet = -1009
    case UnKnown = 000
}

public enum HTTPServerMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
}

class serverManager {
    
    func connectForApiWith(url : String , mType : HTTPServerMethod , params : [String : Any]? , complation: @escaping (Any?) -> (), errorHandler: @escaping (ErrorCode, Any?) -> ()){
        
        let httpMethod = HTTPMethod(rawValue: mType.rawValue)
        Alamofire.request(url, method: httpMethod!, parameters: params, encoding: URLEncoding.default).responseJSON
            { response in
                if response.result.error != nil{
                    DispatchQueue.main.async{
                        if let errorEnum = ErrorCode(rawValue: (response.result.error?._code)!)
                        {
                            errorHandler(errorEnum, response.result.error)
                        }
                        else
                        {
                            errorHandler(ErrorCode(rawValue: 000)!, response.result.error)
                        }
                    }
                    return
                }
                
                if response.data?.count == 0{
                    DispatchQueue.main.async{
                        if let errorEnum = ErrorCode(rawValue: (response.result.error?._code)!)
                        {
                            errorHandler(errorEnum, response.result.error)
                        }
                        else
                        {
                            errorHandler(ErrorCode(rawValue: 000)!, "No Data Retrived")
                        }
                    }
                    return
                }
                
                if (response.result.value != nil) {
                    complation(response.value)
                }
        }
    }
    
}


