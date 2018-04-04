//
//  TimerManager.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import UIKit

class TimerManager  {

    var timeEnd : Date!
    var timeNow : Date!
    var timer = Timer()
    var targetViewController : UIViewController!
    var isEnded = false
    var dayText : String!
    var hourText : String!
    var minuteText : String!
    var secondText : String!
    
    func updateView(complaition : ()->()) {
        // Initialize Label
        //setTimeLeft()
        
        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: targetViewController, selector: #selector(setTimeLeft), userInfo: nil, repeats: true)
        complaition()
    }
    
    @objc func setTimeLeft() {
        
        // Only keep counting if timeEnd is bigger than timeNow
        if timeEnd.compare(timeNow) == ComparisonResult.orderedDescending {
            isEnded = false
            let calendar = NSCalendar.current
            
            let components = calendar.dateComponents([.day, .hour, .minute, .second], from: timeNow, to: timeEnd)
            
            dayText = "\(components.day!)d "
            hourText = "\(components.hour!)h "

            // Hide day and hour if they are zero
            if components.day! <= 0 {
                dayText = ""
                if components.hour! <= 0 {
                    hourText = ""
                }
            }
            minuteText = "\(components.minute!)m "
            secondText = "\(components.second!)s "

        } else {
            isEnded = true
        }
    }
}

