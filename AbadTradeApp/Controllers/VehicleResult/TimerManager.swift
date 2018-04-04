//
//  TimerManager.swift
//  AbadTradeApp
//
//  Created by Hyper Design on 4/4/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation

var timeEnd : NSDate!
var timeNow : NSDate!
var timer : Timer!

//func updateView() {
//    // Initialize Label
//    setTimeLeft()
//    
//    // Start timer
//    timer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)
//}
//
//func setTimeLeft() {
//    let timeNow = NSDate()
//    
//    // Only keep counting if timeEnd is bigger than timeNow
//    if timeEnd.compare(timeNow) == NSComparisonResult.OrderedDescending {
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: timeNow, toDate: timeEnd, options: [])
//        
//        var dayText = String(components.day) + "d "
//        var hourText = String(components.hour) + "h "
//        
//        // Hide day and hour if they are zero
//        if components.day <= 0 {
//            dayText = ""
//            if components.hour <= 0 {
//                hourText = ""
//            }
//        }
//        timeLeftLabel.text = dayText + hourText + String(components.minute) + "m " + String(components.second) + "s"
//        
//    } else {
//        timeLeftLabel.text = "Ended"
//    }
//}

