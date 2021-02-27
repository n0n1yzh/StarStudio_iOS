//
//  FileTestApp.swift
//  Shared
//
//  Created by 雨中寒 on 2021/2/5.
//

import SwiftUI

@main
struct FileTestApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: FileTestDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
