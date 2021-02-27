//
//  ViewController.swift
//  FM
//
//  Created by 雨中寒 on 2021/2/22.
//

import UIKit

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show WebPage", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        button.center = view.center
    }
    
    @objc private func didTapButton() {
        print("hello")
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        let vc = WebViewViewController(url: url, title: "Google")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
}
