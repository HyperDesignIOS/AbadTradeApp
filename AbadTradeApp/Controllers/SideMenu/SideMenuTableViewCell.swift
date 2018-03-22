//
//  SideMenuTableViewCell.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/22/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sideMenuItemName: UILabel!
    @IBOutlet weak var sideMenuItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
