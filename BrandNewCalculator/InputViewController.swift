//
//  InputViewController.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/13/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    var memoryStorage: Double?
    var customInput = [String]()
    var outputString = ""
    
    var bracketsCount = 0
    var dotWasPressed = false
    var memoryEnabled = false
    weak var delegate: InputDelegate?
    
    @IBOutlet var binaryOperations: [RoundedButton]!
    @IBOutlet var minus: [RoundedButton]!
    @IBOutlet var sqrt: [RoundedButton]!
    @IBOutlet var memo: [RoundedButton]!
    @IBOutlet weak var equal: RoundedButton!
    @IBOutlet weak var dot: RoundedButton!
    @IBOutlet weak var leftBracket: RoundedButton!
    @IBOutlet weak var rightBracket: RoundedButton!
    @IBOutlet var factorial: [RoundedButton]!
    @IBOutlet var memoRead: [RoundedButton]!
    @IBOutlet var memoClean: [RoundedButton]!
    @IBOutlet var trigOperations: [RoundedButton]!
    @IBOutlet var constants: [RoundedButton]!
    @IBOutlet var digits: [RoundedButton]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBlock(false)
        //equal.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func needToBeCalculate(_ sender: RoundedButton) {
        var resultNumber: Double?
        if bracketsCount == 0 {
            resultNumber = delegate?.beginProcessing(input: customInput)
        }
        customInput = []
        if sender.currentTitle! != "=" && resultNumber != nil {
            if sender.currentTitle! == "MS" {
                memoryStorage = resultNumber
            }
            if sender.currentTitle! == "M+" {
                memoryStorage = ( memoryStorage ?? 0 ) + resultNumber!
            }
            if sender.currentTitle! == "M-" {
                memoryStorage = ( memoryStorage ?? 0 ) - resultNumber!
            }
            delegate?.setMemoryIndicator(active: "M")
        }
        dotWasPressed = false
        leftBlock(true)
        rightBlock(false)
        blockMinus(true)
        blockDigits(true)
        if sender.currentTitle! != "=" {
            memoryEnabled = true
        }
        outputString = ""
        sender.fade()
    }
    
    @IBAction func memoRead(_ sender: RoundedButton) {
        if memoryEnabled {
           if let res = memoryStorage {
                customInput.insert( String(res), at:0)
                outputString += String(res)
                delegate?.inputReceived(input: outputString)
            }
        }
    }
    
    @IBAction func memoCleanPressed(_ sender: RoundedButton) {
        memoryStorage = nil
        delegate?.setMemoryIndicator(active: "")
        memoryEnabled = false
        blockReading(memoryEnabled)
        sender.fade()
    }
    
    @IBAction func eraseClear(_ sender: RoundedButton) {
        bracketsCount = 0
        dotWasPressed = false
        customInput = []
        outputString = ""
        delegate?.inputReceived(input: "0")
        leftBlock(true)
        blockDigits(true)
        rightBlock(false)
        sender.fade()
    }
    
    @IBAction func eraseOne(_ sender: RoundedButton) {
        outputString = ""
        
        if customInput.isEmpty {
            delegate?.inputReceived(input: "0")
        }
        else {
            if customInput[0] == "." {
                dotWasPressed = false
            }
            else {
                dotWasPressed = true
            }
            customInput.remove(at:0)
            
            if customInput.isEmpty {
                delegate?.inputReceived(input: "0")
            }
            else {
                for item in customInput.reversed() {
                    outputString += item
                }
                delegate?.inputReceived(input: outputString)
            }
        }
        sender.fade()
    }
    
    @IBAction func digitWasPressed(_ sender: RoundedButton) {
        leftBlock(false)
        rightBlock(true)
        dotBlock(true)
        sender.fade()
    }
    
    @IBAction func dotPressed(_ sender: RoundedButton) {
        dotWasPressed = true
        dotBlock(false)
        sender.fade()
    }
    
    @IBAction func leftBracketPressed(_ sender: RoundedButton) {
        bracketsCount += 1
    }
    
    @IBAction func rightBracketPressed(_ sender: RoundedButton) {
        bracketsCount -= 1
        blockRightBracket(bracketsCount > 0)
    }
    
    @IBAction func leftButtonsPressed(_ sender: RoundedButton) {
        leftBlock(false)
        blockDigits(false)
        rightBlock(true)
        dotBlock(false)
        blockFactorial(factorial.contains(sender))
        sender.fade()
    }
    
    @IBAction func rightButtonPressed(_ sender: RoundedButton) {
        rightBlock(false)
        leftBlock(true)
        blockDigits(true)
        dotBlock(false)
        blockMinus(!minus.contains(sender))
        sender.fade()
    }
    
    @IBAction func buttonWasPressed(_ sender: RoundedButton) {
        customInput.insert(sender.currentTitle!, at:0)
        outputString += sender.currentTitle!
        delegate?.inputReceived(input: outputString)
    }
   ///////////////
    
    /*func symbolReceived(_ symbol: String) {
        if !outputString.isEmpty && customInput.isEmpty {
            customInput.insert(outputString, at:0)
            customInput.insert(symbol, at:0)
            outputString += symbol
            outputViewController?.display(outputString)
        }
        else {
            customInput.insert(symbol, at:0)
            outputString += symbol
            outputViewController?.display(outputString)
        }
    }*/
    
    
    //////////////
    func blockDigits (_ condition: Bool) {
       for button in digits {
            button.isEnabled = condition
       }
    }
    
    func blockTrigOperations(_ condition: Bool) {
        for button in trigOperations {
            button.isEnabled = condition
        }
    }
    
    func blockSqrt(_ condition: Bool) {
        for button in sqrt {
            button.isEnabled = condition
        }
    }
    
    func blockConstants(_ condition: Bool) {
        for button in constants {
            button.isEnabled = condition
        }
        for button in memoRead {
            button.isEnabled = condition && memoryEnabled
        }
    }
    
    func blockLeflBracket(_ condition: Bool) {
        leftBracket.isEnabled = condition
    }
    
    func blockRightBracket(_ condition: Bool) {
        rightBracket.isEnabled = ( condition  && bracketsCount > 0 )
    }
    
    func blockOperations(_ condition: Bool) {
        for button in binaryOperations {
            button.isEnabled = condition
        }
    }
    
    func blockFactorial(_ condition: Bool) {
        for button in factorial {
            button.isEnabled = condition
        }
    }
    
    func blockMinus(_ condition: Bool) {
        for button in minus {
            button.isEnabled = condition
        }
    }
    
    func blockEqual(_ condition: Bool) {
        for button in memo {
            button.isEnabled = condition
        }
        equal.isEnabled = condition
    }
    
    func leftBlock(_ condition: Bool) {
        blockTrigOperations(condition)
        blockConstants(condition)
        blockSqrt(condition)
        blockLeflBracket(condition)
    }
    
    func rightBlock(_ condition: Bool) {
        blockFactorial(condition)
        blockOperations(condition)
        blockEqual(condition)
        blockRightBracket(condition)
    }
    
    func dotBlock(_ condition: Bool) {
        dot.isEnabled = condition && !dotWasPressed
    }
  
    func blockReading(_ condition: Bool) {
        for button in memoRead {
            button.isEnabled = condition && memoryEnabled
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InputViewController {
            destination.delegate = delegate
        }
    }

}
