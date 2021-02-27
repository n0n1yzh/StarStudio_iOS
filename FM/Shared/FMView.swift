//
//  FMView.swift
//  FM
//
//  Created by 雨中寒 on 2021/1/30.
//

import SwiftUI
//
extension String: Identifiable {
    public typealias ID = Int
    public var id: ID {
        return hashValue
    }
}

extension Int: Identifiable {
    public typealias ID = Int
    public var id: ID {
        return self
    }
}
//
struct FMView: View {
    @EnvironmentObject var globalContent: GlobalContent
    @State var isPushed: Bool = false
    //@EnvironmentObject var navigationModel: NavigationModel
    var body: some View {
        NavigationView {
            List(0..<3, id: \.self) { row in
                NavigationLink(destination: FilesView(fileName: globalContent.fileLists[row].name, title: globalContent.fileLists[row].name), tag: row, selection: self.$globalContent.linkSelection) {
                    Image("file")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(globalContent.fileLists[row].name)
                    }
                }
                
            }
            .navigationBarTitle(Text("File Manager"))
        }
        
    
//        NavigationView {
//            List {
//                Section {
//                    ForEach(globalContent.fileLists) { item in
//                        NavigationLink(destination: FilesView(globalContent: globalContent, fileRoad: item.name, title: item.name), isActive: $isPushed) {
//                            Image("file")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 44, height: 44)
//
//                            VStack(alignment: .leading) {
////                                Text(">^<")
////                                    .font(.headline)
//                                Text(item.name)
//                            }
//                        }
//                        .onChange(of: isPushed) { (newValue) in
//                            globalContent.addFiles()
//
//                        }
//                        .simultaneousGesture(TapGesture().onEnded{
//                            globalContent.addFileRoad(at: globalContent.fileLists.firstIndex(where: { $0.id == item.id })!)
//                                        })
//                    }
//                }
//            }
//            .navigationBarTitle(Text("File Manager"))
//        }
//            List(globalContent.filesArray, id: \.self) {
//                NavigationLink(destination: FilesView(globalContent: globalContent, str: $0)) {
//                    Image("file")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 44, height: 44)
//
//                    VStack(alignment: .leading) {
//                        Text("hello")
//                            .font(.headline)
//                        Text("world")
//                    }
//                }
//            }
//            .navigationBarTitle(Text("File Manager"))
//        }
    }

//            .navigationBarTitle("Moonshot")
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .navigationBarTitle(Text("hello"))
//            .onTapGesture {
//                let str = "hello YZH"
//                //let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
//                let url = self.getDocumentsDirectory().appendingPathComponent("ls")
//
//                do {
//                    //try str.write(to: url, atomically: true, encoding: .utf8)
//                    let myDire: String = NSHomeDirectory() + "/Documents/Rookie/Files/YZH"
//                    let fileManager = FileManager.default
//                    //fileManager.createFile(atPath: <#T##String#>, contents: <#T##Data?#>, attributes: <#T##[FileAttributeKey : Any]?#>)
//                    try! fileManager.createDirectory(atPath: myDire,
//                                                              withIntermediateDirectories: true, attributes: nil)
//
//                    let input = try String(contentsOf: url)
//                    print("url:\(url)")
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}


struct FMView_Previews: PreviewProvider {
    static var previews: some View {
        FMView()
    }
}
