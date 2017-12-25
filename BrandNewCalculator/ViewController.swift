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
    let segueToOutput = "toOuput"
    var outputString = ""
    var customInput = [String]()
    var calculator = CalcBrain()
    var outputViewController :OutputViewController? = nil
    
    
    func symbolReceived(_ symbol: String) {
        /*if customInput.isEmpty {
            if outputString.isEmpty {
                
            }
            else {
                customInput.insert(outputString, at:0)
                customInput.insert(symbol, at:0)
                outputString += symbol
                outputViewController?.display(outputString)
            }
        }
        else {*/
            customInput.insert(symbol, at:0)
            outputString += symbol
            outputViewController?.display(symbol)
        //}
    }
    
    func deleteLast() {
        if customInput.isEmpty {
            outputViewController?.display("0")
        }
        else {
            for item in customInput.reversed(){
                outputString += item
            }
            outputViewController?.display(outputString)
        }
    }
    
    func clearDisplay() {
        outputString = ""
        customInput = []
        outputViewController?.display("0")
    }
    
    func beginProcessing() {
        let resultNumber = calculator.processing(input: customInput)
        customInput = []
        outputString = String(resultNumber)
        if outputString.hasSuffix(".0") {
            outputString.removeLast()
            outputString.removeLast()
        }
        outputViewController?.display(outputString)
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
            outputViewController = segue.destination as? OutputViewController
        }
    }
}


enum ReceivedSymbol: String {
    case digit
    case equal
}




