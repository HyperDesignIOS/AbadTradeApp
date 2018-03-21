//
//  Protocols.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/20/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
protocol searchVCProtocol {
    func handelSelection(selectedValue : AnyObject)
    func handleSearchApiResponse(searchResults : [SearchResultItem])
}
