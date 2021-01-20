//
//  ContentView.swift
//  ASimpleAlarm
//
//  Created by YZH on 2021/1/15.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var globalContent = GlobalContent()
    
    @State private var isPresented = false

    
    var body: some View {
        
        NavigationView{
            VStack{
            /*    Button(action: {
                    globalContent.addAlarm()
                    print(globalContent.alarmLabelArray)
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            */
              
                List(globalContent.alarmLabelArray, id: \.self) {
                     AlarmLabelView(name: $0)
                 }
                 
            }
            .navigationBarTitle(Text("ALARM"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Add") {
                self.isPresented = true
            }.sheet(isPresented: $isPresented, content: {
                AddAlarmView(globalContent: globalContent)
            }))
        }
        
    }
    
    func updateView() -> some View {
        return List {
            ForEach(globalContent.alarmLabelArray, id: \.self) { item in
                AlarmLabelView(name: item)
            }
        }
    }
}

struct AlarmLabelView : View {
    @State var name: String
    @State private var isOn = true
    
    var body: some View {
        ZStack {
            Text("\(name)")
            Toggle("",isOn: $isOn)
                .offset(x:-50)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
