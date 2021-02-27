//
//  SettingProfileView.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/19.
//

import SwiftUI

struct SettingProfileView: View {
    @EnvironmentObject var globalContent: GlobalContent
    
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    globalContent.bgArray.shuffle()
                } label: {
                    Image(globalContent.bgArray[0])
                        .resizable()
                        .frame(height: 300)
                }
            }
            Spacer().frame(height: 30)
            VStack {
                HStack(alignment: .center) {
                    Text("Username:")
                        .bold()
                    TextField("Enter username...", text: $globalContent.username, onEditingChanged: { (changed) in

                        print("Username onEditingChanged - \(changed)")
                    }) {
                        UserDefaults.standard.set(globalContent.username, forKey: "username")
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                HStack(alignment: .center) {
                    Text("email:")
                        .bold()
                    TextField("Enter username...", text: $globalContent.email, onEditingChanged: { (changed) in

                        print("Username onEditingChanged - \(changed)")
                    }) {
                        UserDefaults.standard.set(globalContent.email, forKey: "email")
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                HStack(alignment: .center) {
                    Text("phone:")
                        .bold()
                    TextField("Enter username...", text: $globalContent.phone, onEditingChanged: { (changed) in

                        print("Username onEditingChanged - \(changed)")
                    }) {
                        UserDefaults.standard.set(globalContent.phone, forKey: "phone")
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                HStack(alignment: .center) {
                    Text("website:")
                        .bold()
                    TextField("Enter username...", text: $globalContent.website, onEditingChanged: { (changed) in

                        print("Username onEditingChanged - \(changed)")
                    }) {
                        UserDefaults.standard.set(globalContent.website, forKey: "website")
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            }
            Spacer().frame(height: 30)
            Spacer()
            Spacer()
        }
//        TextField(
//            "type something username...",
//            text: $globalContent.username,
//            onEditingChanged: { _ in print("changed") },
//            onCommit: {
//                UserDefaults.standard.set(globalContent.username, forKey: "username")
//                print("commit") }
//        )
    }
}

struct SettingProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfileView()
    }
}
