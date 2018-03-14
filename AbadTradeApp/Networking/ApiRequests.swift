//
//  ApiRequests.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/14/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import SwiftyJSON

class apiRequests {
    
    var categoriesArray = [Category]()
    var imagesArray = [Image]()
    let sm = serverManager()
    
    func loadCategoriesAndImages(didDataReady : @escaping ([Category],[Image]) -> ()) {
        
        sm.connectForApiWith(url: "http://hyper-design.com/Abad/api", mType: HTTPServerMethod.get, params: [:], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                let categorys = dictionaryOfJson!["category"] as! [[String : Any]]
                for cat in categorys {
                    let category = Category.init(fromDictionary: cat)
                    self.categoriesArray.append(category)
                    print(category.nameEn)
                }
                let images = dictionaryOfJson!["images"] as! [[String : Any]]
                for img in images {
                    let image = Image.init(fromDictionary: img)
                    self.imagesArray.append(image)
                    print(image.headerPhoto1)
                
                }
            }
            didDataReady(self.categoriesArray,self.imagesArray)
            
        }, errorHandler: { (error, msg) in
            didDataReady([],[])
        })
    }
    
//    func getBrands() -> [Brand] {
    
//        sm.connectForApiWith(url: "http://hyper-design.com/Abad/api", mType: HTTPServerMethod.get, params: [:], complation: { (json) in
//            
//            if let obj = json {
//                print (obj)
//                let dictionaryOfJson = JSON(json!).dictionaryObject
//                let categorys = dictionaryOfJson!["category"] as! [[String : Any]]
//                for cat in categorys {
//                    let category = Category.init(fromDictionary: cat)
//                    self.categoriesArray.append(category)
//                    print(category.nameEn)
//                }
//                let images = dictionaryOfJson!["images"] as! [[String : Any]]
//                for img in images {
//                    let image = Image.init(fromDictionary: img)
//                    self.imagesArray.append(image)
//                    print(image.headerPhoto1)
//                    
//                }
//            }
//            didDataReady(self.categoriesArray,self.imagesArray)
//            
//        }, errorHandler: { (error, msg) in
//            didDataReady([],[])
//        })
//    }
    
}
