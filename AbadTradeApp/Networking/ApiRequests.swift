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
    var brandsArray = [Brand]()
//    var modelsArray = [Model]()
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
    
    func getBrands(vehicleId : Int , didDataReady : @escaping ([Brand]) -> ()) -> () {
        
        sm.connectForApiWith(url: "http://hyper-design.com/Abad/api/getBrand", mType: HTTPServerMethod.post, params: ["id" : vehicleId], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                let brands = dictionaryOfJson!["brands"] as! [[String : Any]]
                for brand in brands {
                    let brand = Brand.init(fromJson: brand)
                    self.brandsArray.append(brand)
                    print(brand.nameEn)
                }
            }
            didDataReady(self.brandsArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    
//    func getModels(brandId : Int) -> [Model] {
//        
//        sm.connectForApiWith(url: "http://hyper-design.com/Abad/api/getModel", mType: HTTPServerMethod.post, params: ["id" : brandId], complation: { (json) in
//            
//            if let obj = json {
//                print (obj)
//                let dictionaryOfJson = JSON(json!).dictionaryObject
//                let models = dictionaryOfJson!["models"] as! [[String : Any]]
//                for model in models {
//                    let model = Model.init(fromJson: model)
//                    self.modelsArray.append(model)
//                    print(model.nameEn)
//                }
//            }
//        }, errorHandler: { (error, msg) in
//            print("\(String(describing: msg))")
//        })
//        
//        return self.modelsArray
//    }
    
}
