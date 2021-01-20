//
//  ContentView.swift
//  learning
//
//  Created by YZH on 2021/1/14.
//

import SwiftUI
import UIKit

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView()
        }
    }
}
struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}
/*
struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination:
                                NextView()) {
                    Text("next")
                }
                Spacer()
            }.navigationTitle("MainView")
        }
        
    }
}
*/
struct NextView: View {
    var body: some View {
        VStack {
            NavigationLink(destination:
                            ThirdView()) {
                Rectangle()
                    .frame(width: 640, height: 480)
                    .foregroundColor(.green)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("NextView")
    }
}

struct ThirdView:View {
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 640, height: 280)
                .foregroundColor(.red)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("ThirdView")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
