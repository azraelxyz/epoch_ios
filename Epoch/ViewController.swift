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
        //todo judge input text has string or not
        if self.epochInput.text.isEmpty {
//            let inputEmpty = "input empty"
//            self._showErrorDialog(inputEmpty)
        } else {
            self._queryForEpoch(Int64(self.epochInput.text.toInt()!))
        }
        
        
    }
    
    var _service : GTLServiceEpoch?
    var service : GTLServiceEpoch {
        if _service != nil {
            return _service!
        }
        _service = GTLServiceEpoch()
        _service?.retryEnabled = true
        return _service!
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - private methods
    
    func viewEdit() {
        //convert button view
        convertButton.layer.cornerRadius = 8
        convertButton.layer.borderWidth = 2
    }
    
    //query human readable time from google cloud endpoints
    func _queryForEpoch(sec: Int64) {
        let query = GTLQueryEpoch.queryForGetEpochWithSec(Int64(sec)) as GTLQueryEpoch
        service.executeQuery(query, completionHandler: { (ticket, response, error) -> Void in
            if error != nil {
                self._showErrorDialog(error)
            } else {
                let getTime = response as GTLEpochHumanReadableTime
                if let humanReadableTime = getTime.message {
                    self.readableTime.text = humanReadableTime
                }
            }
        })

    }
    
    //show error message when something is wrong
    func _showErrorDialog(error : NSError) {
        let alertController = UIAlertController(title: "Endpoints error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
        let defaultAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

