//
//  GlobalContent.swift
//  ASimpleAlarm
//
//  Created by YZH on 2021/1/18.
//

import SwiftUI

class GlobalContent: ObservableObject {
    @Published var alarmLabelArray = [String]()
    @Published var setDate = Date()
    @Published var nowDate = Date()
    
    
    
    func addAlarm() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: setDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let formatter = DateFormatter()
        // let dateString = formatter.string(from: setDate)
        let dateString = "\(hour)  :  \(minute)"
        
        // let addLabel = "7:30"
        alarmLabelArray.append(dateString)
        // alarmLabelArray.append(hour)
    }
    
    func checkWhetherEqual() {
        // let setDateComponents = Calendar.current.dateComponents([.hour, .minute], from: setDate)
        let nowDateComponents = Calendar.current.dateComponents([.hour, .minute], from: nowDate)
        
        // let setDateHour = setDateComponents.hour ?? 0
        // let setDateMinute = setDateComponents.minute ?? 0
        
        let nowDateHour = nowDateComponents.hour ?? 0
        let nowDateMinute = nowDateComponents.minute ?? 0
        
        let nowDateString = "\(nowDateHour)  :  \(nowDateMinute)"
        
        if alarmLabelArray.count != 0 {
            if nowDateString == alarmLabelArray[0] {
                
            }
        }
        
        
    }
    
}
