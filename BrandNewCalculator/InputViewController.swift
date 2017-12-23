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
    @IBOutlet weak var minus: RoundedButton!
    @IBOutlet weak var sqrt: RoundedButton!
    @IBOutlet var memo: [RoundedButton]!
    @IBOutlet weak var equal: RoundedButton!
    @IBOutlet weak var dot: RoundedButton!
    @IBOutlet weak var leftBracket: RoundedButton!
    @IBOutlet weak var rightBracket: RoundedButton!
    @IBOutlet weak var factorial: RoundedButton!
    @IBOutlet weak var memoRead: RoundedButton!
    @IBOutlet weak var memoClean: RoundedButton!
    @IBOutlet var trigOperations: [RoundedButton]!
    @IBOutlet var constants: [RoundedButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBracket.isEnabled = false
        for button in binaryOperations {
            button.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func needToBeCalculate(_ sender: UIButton) {
        if bracketsCount == 0{
            delegate?.symbolReceived(sender.currentTitle!)
        }
    }
    
    @IBAction func eraseClear(_ sender: RoundedButton) {
    }
    
    @IBAction func eraseOne(_ sender: RoundedButton) {
    }
    
    @IBAction func digitWasPressed(_ sender: UIButton) {
        //delegate?.symbolReceived(sender.currentTitle!, ReceivedSymbol.digit)
    }
    //no equal
    @IBAction func buttonWasPressed(_ sender: RoundedButton) {
        if sender == rightBracket {
            bracketsCount -= 1
            if bracketsCount == 0 {
                rightBracket.isEnabled = false
            }
        }
        if sender == leftBracket {
            bracketsCount += 1
            leftBracket.isEnabled = true
        }
        if sender == dot {
            dot.isEnabled = false
            dotWasPressed = true
        }
        if  binaryOperations.contains(sender) {
            for button in binaryOperations {
                button.isEnabled = false
            }
        }
        if trigOperations.contains(sender) {
            for button in binaryOperations {
                button.isEnabled = false
            }
        }
        delegate?.symbolReceived(sender.currentTitle!)
        sender.fade()
    }
   
    // MARK: - Navigation

    func isDigit(_ : String?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let destination = segue.destination as? InputViewController {
         destination.delegate = delegate
        }
    }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
