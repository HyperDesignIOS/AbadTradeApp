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
    var showRooms = [ShowRoom]()
    var insuranceCompanies = [Insurance]()
    var insuranceDetails =  [Insurance]()
    var showRoomDetailsArray = [ShowRoomDetails]()
    var showRoomItemArray = [ShowRoomItem]()
    var vehiclePrices = [VehiclePrice]()
    var vehicleImages = [VehicleImage]()
    var vehicleOptions = [VehicleOption]()
    var vehicleBids : VehicleBid!
    var vehicleItemDetails : VehicleItemDetails!
    var itemTotalAmount : Double!
    var userArray = [User]()
    var user :User!
    var done :String!
    var msg : String!
    var totalBid : String!
    var updatedTotalBid : Float!

    //var insuranceCompnies = []()
    let sm = serverManager()
    
    func loadCategoriesAndImages(didDataReady : @escaping ([Category],[Image]) -> ()) {
        
        sm.connectForApiWith(url: CategoriesAndImagesURL, mType: HTTPServerMethod.get, params: [:], complation: { (json) in
            
            self.categoriesArray.removeAll()
            self.imagesArray.removeAll()

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
    
    func getModels(brandId : String , didDataReady : @escaping ([Model]) -> ()) -> () {
        
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
    
    func getSearchResultsWithModelId(modelId : String , didDataReady : @escaping ([SearchResultItem]) -> ()) -> () {
        
        sm.connectForApiWith(url: SearchWithModelURL, mType: HTTPServerMethod.post, params: ["model" : modelId], complation: { (json) in
            
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
    
    func getShowRooms(didDataReady : @escaping([ShowRoom])->())->(){
        
        sm.connectForApiWith(url: ShowRoomsURL , mType: HTTPServerMethod.get, params: [:], complation: { (json) in
            
            self.showRooms.removeAll()
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["dealers"] as! [[String : Any]]
                for item in items {
                    let item = ShowRoom.init(fromDictionary: item)
                    self.showRooms.append(item)
                    print(item.id)
                }
            }
            didDataReady(self.showRooms)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    func getInsuranceCompany(didDataReady : @escaping([Insurance])->())->(){
        
        sm.connectForApiWith(url: InsuranceCompanyURL  , mType: HTTPServerMethod.get, params: [:], complation: { (json) in
            self.insuranceCompanies.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["insurances"] as! [[String : Any]]
                for item in items {
                    let item = Insurance.init(fromDictionary: item)
                    self.insuranceCompanies.append(item)
                    print(item.id)
                }
            }
            didDataReady(self.insuranceCompanies)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    func getInsuranceDetails(insuranceId : String ,didDataReady : @escaping([Insurance])->())->(){
        
        sm.connectForApiWith(url: ShowInsuranceDetails  , mType: HTTPServerMethod.post, params: ["id":insuranceId], complation: { (json) in
            self.insuranceDetails.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["insurance"] as! [String : Any]
//                for item in items {
                    let item = Insurance.init(fromDictionary: items)
                    self.insuranceDetails.append(item)
                    print(item.id)
//                }
            }
            didDataReady(self.insuranceDetails)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    
    func getShowRoomDetails(showRoomId : String ,didDataReady : @escaping([ShowRoomDetails],[ShowRoomItem])->())->(){
        sm.connectForApiWith(url: ShowRoomDetailsURL  , mType: HTTPServerMethod.post, params: ["id":showRoomId], complation: { (json) in
            self.showRoomDetailsArray.removeAll()
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["dealer"] as! [String : Any]
                let item = ShowRoomDetails.init(fromDictionary: items)
                self.showRoomDetailsArray.append(item)
                print(item.id)
                let secondItems = dictionaryOfJson!["items"] as! [[String : Any]]
                for i in secondItems {
                    let secondItem = ShowRoomItem.init(fromDictionary:i)
                    self.showRoomItemArray.append(secondItem)
                }
            }
            didDataReady(self.showRoomDetailsArray,self.showRoomItemArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([],[])
        })
    }
    
    func getVehicleItemDetails(selectedVehicleId : String ,didDataReady : @escaping(VehicleItemDetails,[VehicleImage],[VehicleOption],[VehiclePrice],VehicleBid,Double)->())->(){
        sm.connectForApiWith(url: VehicleItemDetailsURL  , mType: HTTPServerMethod.post, params: ["id" : selectedVehicleId], complation: { (json) in
            self.vehicleImages.removeAll()
            self.vehiclePrices.removeAll()
            self.vehicleOptions.removeAll()

            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let prices = dictionaryOfJson!["itemprice"] as! [[String : Any]]
                
                for price in prices{
                    let price = VehiclePrice.init(fromJson: price)
                    self.vehiclePrices.append(price)
                }
                let images = dictionaryOfJson!["itemimages"] as! [[String : Any]]
                
                for image in images{
                    let image = VehicleImage.init(fromJson: image)
                    self.vehicleImages.append(image)
                }
                
                let options = dictionaryOfJson!["itemoptions"] as! [[String : Any]]
                
                for option in options{
                    let option = VehicleOption.init(fromJson: option)
                    self.vehicleOptions.append(option)
                }
                
                let itemDetails = VehicleItemDetails.init(fromJson: dictionaryOfJson!["item"] as! [String : Any])
                
                self.vehicleItemDetails = itemDetails
                
                if dictionaryOfJson!["itembids"] as? [String : Any] != nil{
                    let bids =  VehicleBid.init(fromJson: dictionaryOfJson!["itembids"] as! [String : Any])
                    self.vehicleBids = bids
                }
                else {
                    self.vehicleBids = VehicleBid()
                }
                
                let itemTotalAmount = dictionaryOfJson!["totalamount"] as! Double
                
                self.itemTotalAmount = itemTotalAmount
            }
            didDataReady(self.vehicleItemDetails,self.vehicleImages,self.vehicleOptions,self.vehiclePrices,self.vehicleBids,self.itemTotalAmount)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.vehicleItemDetails,[],[],[],self.vehicleBids,0.0)
        })
    }
    
    
    func  register(userName:String,userMail:String,userPassword:String,didDataReady : @escaping(Any,String,String)->())->(){
        
        sm.connectForApiWith(url: RegisterURL  , mType: HTTPServerMethod.post, params: ["username":userName,"email":userMail,"password":userPassword], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let done = dictionaryOfJson!["done"] as! String
                if done == "1"{
                    print(dictionaryOfJson)
                    let items = dictionaryOfJson!["user"] as! [String : Any]
                    let item = User.init(fromDictionary: items)
                    self.user = item
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    self.done = done
                    
                }
                else if done == "0"
                {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = User()
                    self.done = done
                    
                }
            }
            didDataReady(self.user,self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(msg,msg as! String,self.done)
        })
    }
    
    
    func login(userMail:String,userPassword:String,didDataReady : @escaping(User,String,String)->())->(){
        
        sm.connectForApiWith(url: LoginURL  , mType: HTTPServerMethod.post, params: ["email":userMail,"password":userPassword], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                
                let done = dictionaryOfJson!["done"] as! String
                
                if done == "1"{
                    print(dictionaryOfJson)
                    let items = dictionaryOfJson!["user"] as! [String : Any]
                    let item = User.init(fromDictionary: items)
                    self.user = item
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    self.done = done
                    
                }
                else if done == "0"
                {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = User()
                    self.done = done
                    
                }
            }
            didDataReady(self.user,self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user, msg as! String,self.done)
        })
    }
    
    
    func sendMessageToShowRoom(message : String, userId:String ,dealerId:String,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: ShowRoomMsg  , mType: HTTPServerMethod.post, params: ["message":message,"user_id":userId,"dealer_id":dealerId], complation: { (json) in
          
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["msg"] as! String
                let done = dictionaryOfJson!["done"] as! String
                
              self.msg = items
                self.done = done
                
            }
            didDataReady(self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.msg,self.done)
        })
    }
    
    func sendMessageToInsurance(phone:String, message : String, userId:String ,insuranceId:String,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: InsuranceMsg  , mType: HTTPServerMethod.post, params: ["phone":phone,"message":message,"user_id":userId,"insurance_id":insuranceId], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["msg"] as! String
                let done = dictionaryOfJson!["done"] as! String
                
                self.msg = items
                self.done = done
                
            }
            didDataReady(self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.msg,self.done)
        })
    }
    
    
    func sendTender( message : String, userId:String ,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: TenderURL  , mType: HTTPServerMethod.post, params: ["message":message,"id":userId], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let msg = dictionaryOfJson!["msg"] as! String
                self.msg = msg
                let done = dictionaryOfJson!["done"] as! String
                self.done = done
            }
            didDataReady(self.msg, self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.msg,"")
        })
    }
    
    func getTender( didDataReady : @escaping(String)->())->(){
        
        sm.connectForApiWith(url: TenderLabelURL  , mType: HTTPServerMethod.get, params:nil, complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let items = dictionaryOfJson!["responsive"]as!  [String : Any]
                let item = items["tendertext"] as! String
                self.msg = item
               
            }
            didDataReady(self.msg)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.msg)
        })
    }
    
    func buyCar(id: String,userId: String ,didDataReady : @escaping(User,[VehiclePrice])->())->(){
        sm.connectForApiWith(url: BuyCarURL  , mType: HTTPServerMethod.post, params: ["id":id,"user_id":userId], complation: { (json) in
            if let obj = json {
                
                self.vehiclePrices.removeAll()
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let prices = dictionaryOfJson!["itemprice"]as!  [[String : Any]]
                for price in prices {
                    let price = VehiclePrice.init(fromJson: price)
                    self.vehiclePrices.append(price)
                }
                let users = dictionaryOfJson!["user"]as! [String : Any]
               
                let user = User.init(fromDictionary: users)
                
                 self.user = user
            }
            didDataReady(self.user,self.vehiclePrices)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,[])
        })
    }
    
    func postBuyCar( id : String, userId:String , price:String, phone:String, email:String,addressar: String,addressen:String,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: PostBuyCarURL  , mType: HTTPServerMethod.post, params: ["id":id, "user_id":userId,"price":price,"phone":phone,"email":email,"address_ar":addressar,"address_en":addressen], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let done = dictionaryOfJson!["done"] as! String
                let items = dictionaryOfJson!["msg"] as! String
                self.msg = items
                self.done = done
                
            }
            didDataReady(self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.msg,self.done)
        })
    }
    
    func addAuctionForCarBid( id : String, userId : String , value : String ,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: AddBidOfferURL  , mType: HTTPServerMethod.post, params: ["id" : id, "user_id":userId , "value" : value], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let msg = dictionaryOfJson!["msg"] as! String
                self.msg = msg
                
                let total = dictionaryOfJson!["total"] as! String
                self.totalBid = total
            }
            didDataReady(self.msg,self.totalBid)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: error))")
            didDataReady("","")
        })
    }
    
    func updateCurrentBid( id : String , didDataReady : @escaping(String)->())->(){
        
        sm.connectForApiWith(url: UpdateBidURL  , mType: HTTPServerMethod.post, params: ["id" : id], complation: { (json) in
            
            if let obj = json {
                print (obj)
                let dictionaryOfJson = JSON(json!).dictionaryObject
                print(dictionaryOfJson)
                let total = dictionaryOfJson!["total"] as! String
                self.totalBid = total
            }
            didDataReady(self.totalBid)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: error))")
            didDataReady("")
        })
    }
    
}
