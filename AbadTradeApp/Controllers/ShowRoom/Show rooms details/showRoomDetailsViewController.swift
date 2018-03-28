//
//  showRoomDetailsViewController.swift
//  AbadTradeApp
//
//  Created by AmrObjection on 3/28/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import AlamofireImage

class showRoomDetailsViewController: UIViewController {
    
    var showRoomsDetails = [showRoomDetail]()
    
    @IBOutlet weak var showRoomImage: UIImageView!
    @IBOutlet weak var showRoomName: UILabel!
    @IBOutlet weak var showRoomAddess: UILabel!
    @IBOutlet weak var showRoomphone: UILabel!
    @IBOutlet weak var showRoomWorkTimes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         showRoomImage.af_setImage(withURL: URL(string: "\(ShowRoomImageURL)\(showRoomsDetails[0].logo!)")!)
        showRoomName.text = showRoomsDetails[0].nameEn
        showRoomAddess.text = showRoomsDetails[0].addressEn
        showRoomphone.text = showRoomsDetails[0].phone
        showRoomWorkTimes.text = showRoomsDetails[0].workTimes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
