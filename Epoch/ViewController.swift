//
//  ViewController.swift
//  Epoch
//
//  Created by Liang on 2015/3/15.
//  Copyright (c) 2015年 5t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var epochInput: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var readableTime: UILabel!
    
    
    @IBAction func pressConvert(sender: AnyObject) {
        readableTime.text = epochInput.text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewEdit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewEdit() {
        //convert button
        convertButton.layer.cornerRadius = 8
        convertButton.layer.borderWidth = 2
        
    }


}

