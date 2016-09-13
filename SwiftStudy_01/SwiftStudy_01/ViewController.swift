//
//  ViewController.swift
//  SwiftStudy_01
//
//  Created by Fengur on 16/9/12.
//  Copyright © 2016年 code.sogou.fengur. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var targetTableView: UITableView!
    var pictures = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello swift"
        targetTableView.delegate = self;
        targetTableView.dataSource = self;
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let imageItems = try! fm.contentsOfDirectory(atPath: path)
        
        for item in imageItems {
            if item.hasPrefix("nssl") {
                pictures.append(item);
            }
        }
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let targetCell = tableView.dequeueReusableCell(withIdentifier: "picture",for:indexPath)
        
        targetCell.textLabel?.text = pictures[indexPath.row]
        return targetCell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "targetDetail") as? DetailViewController {
            vc.seletedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

