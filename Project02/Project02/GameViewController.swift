//
//  GameViewController.swift
//  Project02
//
//  Created by YZH on 2020/12/10.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    var nameForPerson = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        nameForPerson += ["YLN", "ALMALS", "ZWMCSWA"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        button1.setImage(UIImage(named: nameForPerson[0]), for: .normal)
        button2.setImage(UIImage(named: nameForPerson[1]), for: .normal)
        button3.setImage(UIImage(named: nameForPerson[2]), for: .normal)
        
    }
    
}

