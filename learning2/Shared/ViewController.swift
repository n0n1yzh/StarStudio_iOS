//
//  ViewController.swift
//  learning2
//
//  Created by 雨中寒 on 2021/2/22.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    var blueBoxView: UIView?
    var redBoxView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var frameRect = CGRect(x: 10, y: 20, width: 80, height: 80)
        blueBoxView = UIView(frame: frameRect)
        blueBoxView?.backgroundColor = UIColor.blue

        frameRect = CGRect(x: 150, y: 100, width: 60, height: 60)
        redBoxView = UIView(frame: frameRect)
        redBoxView?.backgroundColor = UIColor.red

        self.view.addSubview(blueBoxView!)
        self.view.addSubview(redBoxView!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func openTapped() {
        
    }
}
