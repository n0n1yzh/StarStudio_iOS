//
//  GlobalContent.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/1.
//

import SwiftUI

class GlobalContent: ObservableObject {
    @Published var filesArray = ["iCloud Drive","我的 iPhone","最近删除"]
    @Published var aFileRoad = ""
    @Published var contentsOfPath = [String]()
    @Published var fileSet = Set<String>()
    @Published var username: String = UserDefaults.standard.string(forKey: "username") ?? "YZH"
    @Published var email: String = UserDefaults.standard.string(forKey: "email") ?? "n0n1yzh@gmail.com"
    @Published var phone: String = UserDefaults.standard.string(forKey: "phone") ?? "111-111-111"
    @Published var website: String = UserDefaults.standard.string(forKey: "website") ?? "n0n1yzh.fun"
    @Published var trashFileRoad = NSHomeDirectory() + "/Documents/最近删除"
    @Published var bgArray = ["bg", "bg1", "bg2", "bg3"]
    
    struct File: Identifiable, Hashable {
        var id = UUID()
        var name: String
    }
    @Published var fileLists = [
        File(name: "iCloud Drive"),
        File(name: "我的 iPhone"),
        File(name: "最近删除")
    ]
    
    //@EnvironmentObject var globalContent: GlobalContent
    @Published var linkSelection: Int? = nil {
        didSet {
            if let linkSelection = linkSelection {
                if linkSelection == 0 {
                    var road:String = NSHomeDirectory() + "/Documents/"
                    aFileRoad = road + fileLists[0].name
                    print("HERE:\(aFileRoad)")
                    
                    addFiles()
                    
                    let manager = FileManager.default
                    contentsOfPath = try! manager.contentsOfDirectory(atPath: aFileRoad) as Array
                    
                    //print("contentsOfPath: \(type(of: contentsOfPath))")
//                    for item in contentsOfPath {
//                        //fileSet.insert(item)
//                        print(item)
//                    }
                    print("global fileSet: \(fileSet)")
                    
                    
                }
                if linkSelection == 1 {
                    var road:String = NSHomeDirectory() + "/Documents/"
                    aFileRoad = road + fileLists[1].name
                    print("HERE:\(aFileRoad)")
                    
                    addFiles()
                    let manager = FileManager.default
                    contentsOfPath = try! manager.contentsOfDirectory(atPath: aFileRoad)
                    print("contentsOfPath: \(String(describing: contentsOfPath))")
                }
                if linkSelection == 2 {
                    var road:String = NSHomeDirectory() + "/Documents/"
                    aFileRoad = road + fileLists[2].name
                    print("HERE:\(aFileRoad)")
                    
                    addFiles()
                    let manager = FileManager.default
                    contentsOfPath = try! manager.contentsOfDirectory(atPath: aFileRoad)
                    print("contentsOfPath: \(String(describing: contentsOfPath))")
                }
                // action
                print("selected: \(String(describing: linkSelection))")
            }
        }
    }
    
    
    func addFiles() {
        var road:String = NSHomeDirectory() + "/Documents/"
        let fileManager = FileManager.default
        for item in 0...2 {
            var aRoad = road + filesArray[item]
            try! fileManager.createDirectory(atPath: aRoad,
                                             withIntermediateDirectories: true, attributes: nil)
        }
        print("trash file road:\(type(of: trashFileRoad))")
        
    }
    
    func clearCaches() {
        let fm = FileManager.default
        contentsOfPath = try! fm.contentsOfDirectory(atPath: NSHomeDirectory() + "/Documents/最近删除")
        print("contentsOfPath: \(contentsOfPath)")
        for item in contentsOfPath {
            var nowRoad =  NSHomeDirectory() + "/Documents/最近删除/" + item
            print("now delete \(nowRoad)")
            do {
                try fm.removeItem(atPath: nowRoad)
            } catch {
                print("error")
            }
            
        }
    }
    
    func addFileRoad(at index: Int) {
        var road:String = NSHomeDirectory() + "/Documents/"
        let aRoad = road + fileLists[index].name
        print("HERE:index: \(index) aRoad: \(aRoad)")
    }
    
    
    
    
}
//
//class NavigationModel: ObservableObject {
//
//}
