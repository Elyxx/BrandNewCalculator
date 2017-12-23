//
//  ViewController.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/7/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InputDelegate {
    
    let segueToInput = "toInput"
    let segueToOutput = "toOutput"
    
    
    
    func symbolReceived(_ symbol: String) {
        //if isDigit(sender.currentTitle) {
            
        //}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueToInput) {
            let inputViewController = segue.destination as? InputViewController
            inputViewController?.delegate = self
        }
        else if segue.identifier == segueToOutput {
         //   outputViewController = segue.destination as? OutputViewController
        }
    }
    
    func isDigit(_ : String?) -> Bool{
        return true
    }
}


enum ReceivedSymbol: String {
    case digit
    case equal
}

protocol InputDelegate: class {
    //var customInput = [String]() {get set}
    func symbolReceived(_ symbol: String)//, _ group: ReceivedSymbol)
}


