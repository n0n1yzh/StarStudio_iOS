//
//  ContentView.swift
//  Shared
//
//  Created by 雨中寒 on 2021/2/5.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: FileTestDocument

    var body: some View {
        NavigationView {
            Form {
                Text("hello")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(FileTestDocument()))
    }
}
