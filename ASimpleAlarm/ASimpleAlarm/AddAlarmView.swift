//
//  AddAlarmView.swift
//  ASimpleAlarm
//
//  Created by YZH on 2021/1/16.
//

import SwiftUI

struct AddAlarmView: View {
    @ObservedObject var globalContent: GlobalContent
   // @State private var setDate = Date()
   // @State private var isOn = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Please enter a time", selection: $globalContent.setDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
             /*   Toggle("",isOn:$isOn)
                    .offset(x:-50)
 */
                Spacer()
            }
            .navigationBarTitle(Text("Setting"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.globalContent.addAlarm()
                print(globalContent.alarmLabelArray)
            }) {
                Text("Save")
            })
        }
        
    }
}

struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddAlarmView(globalContent: GlobalContent())
    }
}
