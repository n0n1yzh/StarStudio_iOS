//
//  WebView.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/22.
//

import SwiftUI
struct UIBridgingWebView: UIViewControllerRepresentable {
    // 这个UIViewControllerType你要接哪个就是哪个，在这里就是viewController
    typealias UIViewControllerType = ViewController
    // 必须实现的方法，当swiftUI要显示view时，会调用这个方法。返回值就是当前需要显示的类
    func makeUIViewController(context: UIViewControllerRepresentableContext<UIBridgingWebView>) -> UIBridgingWebView.UIViewControllerType {
        return ViewController()
    }
    // 更新UIViewController时会调用此方法
    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIBridgingWebView>) {
    }
}
struct WebView: View {
    var body: some View {
        UIBridgingWebView()
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
