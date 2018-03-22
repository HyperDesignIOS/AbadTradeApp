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
    
    static let apisInstance = apiRequests()
    
    var categoriesArray = [Category]()
    var imagesArray = [Image]()
    var brandsArray = [Brand]()
    var modelsArray = [Model]()
    var yearsArray = [Year]()
    var searchResultItems = [SearchResultItem]()
    let sm = serverManager()
    
    func loadCategoriesAndImages(didDataReady : @escaping ([Category],[Image]) -> ()) {
        
        sm.connectForApiWith(url: CategoriesAndImagesURL, mType: HTTPServerMethod.get, params: [:], complation: { (json) in
            
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
        
        sm.connectForApiWith(url: BrandsURL, mType: HTTPServerMethod.post, params: ["id" : vehicleId], complation: { (json) in
            self.brandsArray.removeAll()
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
    
    func getModels(brandId : Int , didDataReady : @escaping ([Model]) -> ()) -> () {
        
        sm.connectForApiWith(url: ModelsURL, mType: HTTPServerMethod.post, params: ["id" : brandId], complation: { (json) in
            
            self.modelsArray.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                let models = dictionaryOfJson!["models"] as! [[String : Any]]
                for model in models {
                    let model = Model.init(fromJson: model)
                    self.modelsArray.append(model)
                    print(model.nameEn)
                }
            }
            didDataReady(self.modelsArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    
   //****************
    
    func getYears(modelId : Int , didDataReady : @escaping ([Year]) -> ()) -> () {
        
        sm.connectForApiWith(url: YearsURL, mType: HTTPServerMethod.post, params: ["id" : modelId], complation: { (json) in
            
            self.yearsArray.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                let years = dictionaryOfJson!["years"] as! [[String : Any]]
                for year in years {
                    let year = Year.init(fromDictionary: year)
                    self.yearsArray.append(year)
                    print(year.id)
                }
            }
            didDataReady(self.yearsArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    
    func getSearchResults(categoryId : Int, brandId : String , modelId : String ,yearId : String , status : String , didDataReady : @escaping ([SearchResultItem]) -> ()) -> () {
        
        sm.connectForApiWith(url: SearchURL, mType: HTTPServerMethod.post, params: ["cat" : categoryId, "brand" : brandId , "model" : modelId, "year" : yearId , "name" : "" , "case" : status], complation: { (json) in
            
            self.searchResultItems.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                let items = dictionaryOfJson!["item"] as! [[String : Any]]
                for item in items {
                    let item = SearchResultItem.init(fromDictionary: item)
                    self.searchResultItems.append(item)
                    print(item.id)
                }
            }
            didDataReady(self.searchResultItems)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
}
