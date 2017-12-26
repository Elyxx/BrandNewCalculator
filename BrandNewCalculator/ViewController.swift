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
   
    var calculator = CalcBrain()
    var outputViewController :OutputViewController? = nil
    
    func beginProcessing(input: [String]) -> Double {
        let resultNumber = calculator.processing(input: input)
        var displayString = String(resultNumber)
        if displayString.hasSuffix(".0") {
            displayString.removeLast()
            displayString.removeLast()
        }
        outputViewController?.display(displayString)
        return resultNumber
    }
    
    func inputReceived(input: String) {
       outputViewController?.display(input)
    }
   
    func setMemoryIndicator(active: String) {
        outputViewController?.indicator.text = active
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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




