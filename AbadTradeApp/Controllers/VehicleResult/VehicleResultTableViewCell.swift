//
//  VehicleResultTableViewCell.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 3/20/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class VehicleResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vehicleImage: UIImageView!
    
    @IBOutlet weak var vehicleShowRoom: UILabel!
    @IBOutlet weak var vehicleModel: UILabel!
    @IBOutlet weak var vehicleBrand: UILabel!
    @IBOutlet weak var vehiclePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
