//
//  ContentView.swift
//  learning
//
//  Created by YZH on 2021/1/14.
//

import SwiftUI
import UIKit
import MapKit
import PDFKit
// kUTTypeText
//import MobileCoreServices
//extension String: Identifiable {
//    public typealias ID = Int
//    public var id: ID {
//        return hashValue
//    }
//}
//
//extension Int: Identifiable {
//    public typealias ID = Int
//    public var id: ID {
//        return self
//    }
//}
//struct UIBridging: UIViewControllerRepresentable {
//    //这个UIViewControllerType你要接哪个就是哪个，在这里就是viewController
//    typealias UIViewControllerType = viewController
//    //必须实现的方法，当swiftUI要显示view时，会调用这个方法。返回值就是当前需要显示的类
//    func makeUIViewController(context: UIViewControllerRepresentableContext<UIBridging>) -> UIBridging.UIViewControllerType {
//        return viewController()
//    }
//    //更新UIViewController时会调用此方法
//    func updateUIViewController(_ uiViewController: viewController, context: UIViewControllerRepresentableContext<UIBridging>) {
//    }
//}
//
//struct PDFKitView: View {
//    var url: URL
//    var body: some View {
//        PDFKitRepresentedView(url)
//    }
//}
//
//struct PDFKitRepresentedView: UIViewRepresentable {
//    let url: URL
//    init(_ url: URL) {
//        self.url = url
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
//        let pdfView = PDFView()
//        pdfView.document = PDFDocument(url: self.url)
//        pdfView.autoScales = true
//        return pdfView
//    }
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
//        // Update the view.
//    }
//}
//struct ContentView: View {
//    let fileUrl = Bundle.main.url(forResource: "Resume", withExtension: "pdf")!
//        var body: some View {
//            PDFKitView(url: self.fileUrl)
//            Button(action: {
//                print("fileURL:", fileUrl)
//            }) {
//                Text("button")
//                    .foregroundColor(.black)
//            }
//        }
//}

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Are you sure you want to delete this?"),
                message: Text("There is no undo"),
                primaryButton: .destructive(Text("Delete")) {
                    print("Deleting...")
                },
                secondaryButton: .cancel()
            )
        }
    }
}
//            if let a = UIImage(data: data) {
//                           image = Image(uiImage: a)
//                       } else {
//
//                       }
//
//            let uiimage    = UIImage(contentsOfFile: url)
//}

// user
//
//struct ContentView: View {
//    @State private var selectedStrength = "Mild"
//    let strengths = ["Mild", "Medium", "Mature"]
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    Picker("Strength", selection: $selectedStrength) {
//                        ForEach(strengths, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Select your cheese")
//        }
//    }
//}
// user



//struct ContentView: View {
//    @State var selection: Int?
//
//    var body: some View {
//        NavigationView() {
//            List(0..<50) {(row) in
//                NavigationLink(destination: Detail(rowID: row, selection: $selection), tag: row, selection: $selection, label: {Text(verbatim: "\(row)")})
//            }
//            .navigationBarTitle("Root View")
//        }
//    }
//
//    private struct Detail: View {
//        let rowID: Int
//        @Binding var selection: Int?
//        @Environment(\.presentationMode) var presentationMode
//
//        var body: some View {
//            Text(verbatim: "\(rowID)")
//            Button("Dismiss through presentation mode!", action: {presentationMode.wrappedValue.dismiss()})
//            Button("Dismiss through state change!", action: {selection = nil})
//        }
//    }
//}
//struct DocumentPicker: UIViewControllerRepresentable {
//    @Binding var fileContent: String
//
//    func makeCoordinator() -> DocumentPickerCoordinator {
//        return DocumentPickerCoordinator(fileContent: $fileContent)
//    }
//    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
//        let controller: UIDocumentPickerViewController
//
//        if #available(iOS 14, *) {
//            controller = UIDocumentPickerViewController(forOpeningContentTypes: [.text], asCopy: true)
//        } else {
//            controller = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText)], in: .import)
//        }
//
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
//
//    }
//}
//
//class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate  {
//    @Binding var fileContent: String
//
//    init(fileContent: Binding<String>) {
//        _fileContent = fileContent
//    }
//
//    func documnetPicker(_ controller: UIDocumentPickerViewController, didPickerDocumentsAt urls: [URL]) {
//        let fileURL = urls[0]
//        do {
//            fileContent = try String(contentsOf: fileURL, encoding: .utf8)
//        } catch let error {
//            print("error")
//        }
//    }
//}
//
//struct ContentView: View {
//    @State var fileContent = ""
//    @State var showDocumentPicker = false
//
//    var body: some View {
//
//        VStack {
//            Text(fileContent).padding()
//
//            Button("import file") {
//                showDocumentPicker = true
//            }
//        }
//        .sheet(isPresented: self.$showDocumentPicker) {
//            DocumentPicker(fileContent: $fileContent)
//        }
//    }
//}


//struct ContentView: View{
//    @State var order = ["hello", "world", "YZH", "n0n1yzh"]
//
//    var body: some View {
//        NavigationView {
//            List {
//                Section {
//                    ForEach(order) { item in
//                            HStack {
//                                Text(item)
//                                Spacer()
//                                Text("$\(item)")
//                            }
//                        }.onDelete(perform: deleteItems)
//                }
//            }
//        }
//    }
//    func deleteItems(at offsets: IndexSet) {
//        order.remove(atOffsets: offsets)
//    }
//}
//       
//        //UIBridging()
//        
////        Button(action: {
////            readTxt()
////        }, label: ({Text(readTxt())}) )
//    }
//
//    func readTxt() -> String {
//        let manager = FileManager.default
//        let urlsForDocDirectory = manager.urls(for: .documentDirectory, in:.userDomainMask)
//        let docPath = urlsForDocDirectory[0]
//        print(docPath)
//        let file = docPath.appendingPathComponent("test.txt")
//
//        //方法1
//        let readHandler = try! FileHandle(forReadingFrom:file)
//        let data = readHandler.readDataToEndOfFile()
//        let readString = String(data: data, encoding: String.Encoding.utf8)
//        print("文件内容: \(type(of: readString))")
//        print("文件内容: \(readString)")
//
//        //方法2
//        let data2 = manager.contents(atPath: file.path)
//        let readString2 = String(data: data2!, encoding: String.Encoding.utf8)
//        print("文件内容: \(readString2!)")
//        return readString2!
//    }
//}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
