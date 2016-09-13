//
//  ViewController.swift
//  SwiftStudy_02
//
//  Created by Fengur on 16/9/13.
//  Copyright © 2016年 code.sogou.fengur. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var countries = [String]()
    var correctAuswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        button1.layer.borderWidth = 1;
        button2.layer.borderWidth = 1;
        button3.layer.borderWidth = 1;
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = button1.layer.borderColor
        button3.layer.borderColor = button2.layer.borderColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action:UIAlertAction!=nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries)as! [String]
        button1.setBackgroundImage(UIImage(named:countries[0]), for: .normal)
        button2.setBackgroundImage(UIImage(named:countries[1]), for: .normal)
        button3.setBackgroundImage(UIImage(named:countries[2]), for: .normal)
        
        correctAuswer = GKRandomSource.sharedRandom().nextInt(upperBound:3)
        title = countries[correctAuswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: AnyObject) {
        var tempTitle :String
        
        if sender.tag == correctAuswer{
            tempTitle = "正确"
            score += 1
        }else{
            tempTitle = "错误"
            score -= 1;
        }
        let ac = UIAlertController(title: tempTitle, message: "得分为 \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "继续", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

