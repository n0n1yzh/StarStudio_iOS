//
//  ContentView.swift
//  Shared
//
//  Created by 雨中寒 on 2021/1/30.
//

import SwiftUI

struct ContentView: View {
    var globalContent = GlobalContent()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
            TabView {
                FMView().environmentObject(globalContent)
                    .font(.title)
                    .tabItem({
                        Image(systemName: "list.dash")
                        Text("Menu")
                    })
                    .navigationBarTitle(Text("File Manager"))
                    
                    .tag(0)
                WebView()
                    .font(.title)
                    .tabItem({
                        Image(systemName: "network")
                        Text("Web")
                    })
                    .tag(1)
                SettingView().environmentObject(globalContent)
                    .font(.title)
                    .tabItem({
                        Image(systemName: "person")
                        Text("Profile")
                    })
                    .tag(2)
                    .navigationBarTitle(Text("Setting"))
                
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
    }
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*Text("Hello World")
    .onTapGesture {
        let str = "hello YZH"
        let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")

        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print("url:\(url)")
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
*/
//        NavigationView {
