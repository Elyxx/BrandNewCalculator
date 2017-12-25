//
//  InputViewController.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/13/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    var bracketsCount = 0
    var dotWasPressed = false
    
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
        rightBracket.isEnabled = false
        for button in binaryOperations {
            button.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func needToBeCalculate(_ sender: RoundedButton) {
        if bracketsCount == 0 {
            delegate?.beginProcessing()
        }
        sender.fade()
    }
    
    @IBAction func memoCleanPressed(_ sender: RoundedButton) {
        sender.fade()
    }
    
    @IBAction func eraseClear(_ sender: RoundedButton) {
        bracketsCount = 0
        dotWasPressed = false
        delegate?.clearDisplay()
    }
    
    @IBAction func eraseOne(_ sender: RoundedButton) {
        delegate?.deleteLast()
    }
    
    @IBAction func digitWasPressed(_ sender: RoundedButton) {
        leftBlock(false)
        rightBlock(true)
        sender.fade()
    }
    
    @IBAction func dotPressed(_ sender: RoundedButton) {
        dotWasPressed = true
        dotBlock(true)
        sender.fade()
    }
    
    @IBAction func leftBracketPressed(_ sender: RoundedButton) {
        bracketsCount += 1
    }
    
    @IBAction func rightBracketPressed(_ sender: RoundedButton) {
        bracketsCount -= 1
    }
    
    @IBAction func leftButtonsPressed(_ sender: RoundedButton) {
        leftBlock(false)
        blockDigits(false)
        rightBlock(true)
        //dotBlock(true)
        blockFactorial(factorial.contains(sender))
        sender.fade()
    }
    
    @IBAction func rightButtonPressed(_ sender: RoundedButton) {
        rightBlock(false)
        leftBlock(true)
        blockDigits(true)
        //dotBlock(true)
        blockMinus(!minus.contains(sender))
        sender.fade()
    }
    
    @IBAction func buttonWasPressed(_ sender: RoundedButton) {
        delegate?.symbolReceived(sender.currentTitle!)
    }
   
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
            button.isEnabled = condition
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
        dot.isEnabled = condition
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InputViewController {
            destination.delegate = delegate
        }
    }

}
