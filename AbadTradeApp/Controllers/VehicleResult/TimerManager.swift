////
////  TimerManager.swift
////  AbadTradeApp
////
////  Created by Hyper Design on 4/4/18.
////  Copyright © 2018 AmrObjection. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class TimerManager  {
//
//    var timeEnd : Date!
//    var timeNow : Date!
//    var timer = Timer()
//    var targetViewController : UIViewController!
//
//    func updateView() {
//        // Initialize Label
//        setTimeLeft()
//
//        // Start timer
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: targetViewController, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)
//    }
//
//    @objc func setTimeLeft() {
//
//        // Only keep counting if timeEnd is bigger than timeNow
//        if timeEnd.compare(timeNow) == ComparisonResult.orderedDescending {
//            let calendar = NSCalendar.current
//
//            let components = calendar.dateComponents([.day, .hour, .minute, .second], from: timeNow, to: timeEnd)
//
//            var dayText = "\(components.day!)d "
//            var hourText = "\(components.hour!)h "
//
//            // Hide day and hour if they are zero
//            if components.day! <= 0 {
//                dayText = ""
//                if components.hour! <= 0 {
//                    hourText = ""
//                }
//            }
//            var minuteText = "\(components.minute!)m "
//            var secondText = "\(components.second!)s "
//
//            timeLeftLabel.text = dayText + hourText + String(components.minute) + "m " + String(components.second) + "s "
//
//        } else {
//            timeLeftLabel.text = "Ended"
//        }
//    }
//}
//
