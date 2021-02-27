//
//  SettingView.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/19.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var globalContent: GlobalContent
    @State private var image: Image? = Image(uiImage: UIImage(data: UserDefaults.standard.data(forKey: "Data")!) ?? UIImage(named: "img")!)
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var name: String = ""
//    @State var username: String = UserDefaults.standard.string(forKey: "username") ?? "YZH"
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Picker("Mode", selection: $isDarkMode) {
                    Text("Light")
                        .tag(false)
                    Text("Dark")
                        .tag(true)
                }.pickerStyle(SegmentedPickerStyle())
   
                VStack {
                    image?
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 160, height: 160)
                    Text(globalContent.username)
                        .font(.title)
                        .bold()
                }
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "envelope")
                        Text(globalContent.email)
                            .font(.system(size: 20))
                            .bold()
                    }
                    HStack {
                        Image(systemName: "phone")
                        Text(globalContent.phone)
                            .font(.system(size: 20))
                            .bold()
                    }
                    HStack {
                        Link(destination: URL(string: "https://www."+globalContent.website ?? "https://www.google.com")!) {
                            Image(systemName: "network")
                            Text(globalContent.website)
                                .font(.system(size: 20))
                                .bold()
                        }
                    }
                }
                NavigationLink(destination: SettingProfileView()) {
                    Text("updata profile")
                        .bold()
                        .frame(width: 260, height: 50)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                   }
                Button {
                    self.showingAlert = true
//                    globalContent.clearCaches()
                } label: {
                    Text("clear caches")
                        .bold()
                        .frame(width: 260, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete these files?"),
                        message: Text("There is no undo"),
                        primaryButton: .destructive(Text("Delete")) {
                            globalContent.clearCaches()
                            print("Deleting...")
                        },
                        secondaryButton: .cancel()
                    )
                }

                
//                HStack(spacing: 50) {
//                    Text("Username")
//                        .padding(.leading, 30)
//                        .font(.system(size: 30, weight: .light, design: .default))
//                    TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
//
//                        print("Username onEditingChanged - \(changed)")
//                    }) {
//                        UserDefaults.standard.set(self.username, forKey: "username")
//                        print("Username onCommit")
//                    }
//                }
//
                Spacer()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage)  {
                ImagePicker(image: self.$inputImage)
            }
            .navigationBarTitle("Setting")
            .navigationBarItems(trailing: Button(action: {
                self.showingImagePicker = true
            }, label: {
                Image(systemName: "camera.fill")
            }))
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
//        imageData = inputImage.pngData()
//        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let url = documents.appendingPathComponent("landscape.png")
//        UserDefaults.standard.set(imageData, forKey: "imageData")
        if let data = inputImage.pngData() {
            // Create URL
            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let url = documents.appendingPathComponent("landscape.png")

//            var s: UIImage?
//            s = UIImage(contentsOfFile: url.path)
//            image = Image(uiImage: s!)
//            print("url:\(url.path)")

            do {
                // Write to Disk
                try data.write(to: url)

                // Store URL in User Defaults
                UserDefaults.standard.set(data, forKey: "Data")
                UserDefaults.standard.set(url, forKey: "background")
                

            } catch {
                print("Unable to Write Data to Disk (\(error))")
            }
        }
    }

}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
