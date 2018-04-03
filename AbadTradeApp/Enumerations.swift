//
//  Enumerations.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/20/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
enum FilterType : String{
    
    case Category = "Category"
    case Brand = "Brand"
    case Model = "Model"
    case Year = "Year"
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}
