//
//  FilesView.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/3.
//

import SwiftUI

extension String {
    func index(index: Int) -> Int? {
        var cur = 0
        for char in self {
            if cur == index {
                return cur
            }
            cur += 1
        }
        return nil
    }
}

struct FilesView: View {
    @EnvironmentObject var globalContent: GlobalContent
    var fileName: String
    var title: String
    
    var body: some View {
        List {
            Section {
                ForEach(globalContent.contentsOfPath) { item in
                    NavigationLink(destination: PreviewController(url: URL(fileURLWithPath: globalContent.aFileRoad+"/"+item))){
                        HStack{
                            Image("sfile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)

                            VStack(alignment: .leading) {
                                Text(item)
                            }

                        }
                        
                    }
                    
                    }
                .onDelete(perform: deleteItems)
                    
            }
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
                            
                        }, label: {
                            Text("Add")
                        }))
    }
    func deleteItems(at offsets: IndexSet) {
//        let fm = FileManager.default
//        var road = globalContent.aFileRoad + "/"
//        let it = String(describing: offsets).index(index: 0)!
//        road += globalContent.contentsOfPath[it]
//        try! fm.removeItem(atPath: road)
//
//        let index = Int.init(str)
//        var it = Int()
//        print("offsets: \(offsets)  it:\(it) File: \(globalContent.contentsOfPath[it]) end\n")
        for item in globalContent.contentsOfPath {
            globalContent.fileSet.insert(item)
            print(item)
        }
        print("fileSet: \(globalContent.fileSet)")
        globalContent.contentsOfPath.remove(atOffsets: offsets)
        print("now contensOfPath type: \(type(of: globalContent.contentsOfPath) )")
        print("now contensOfPath: \(globalContent.contentsOfPath)")
        var nowFileSet = Set<String>()
        for item in globalContent.contentsOfPath {
            nowFileSet.insert(item)
        }
        print("fileSet: \(globalContent.fileSet)")
        var tmp = globalContent.fileSet.symmetricDifference(nowFileSet)
        print("tmp: \(tmp)")
        let fm = FileManager.default
        var road = globalContent.aFileRoad + "/"
        for item in tmp {
            var nowRoad = road + item
            print("now delete \(nowRoad)")
            do {
                try fm.moveItem(atPath: nowRoad, toPath: globalContent.trashFileRoad+"/"+item)
//                try fm.removeItem(atPath: nowRoad)
            } catch {
                print("error")
            }
            
        }
    }
}

struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        FilesView(fileName: String(), title: String())
    }
}


//        List(globalContent.contentsOfPath, id: \.self) { index in
//            Image("afile")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 44, height: 44)
//
//            VStack(alignment: .leading) {
//                Text(index)
//            }
//            .onDelete(perform: deleteItems)
//        }
