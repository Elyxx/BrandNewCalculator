//
//  InputViewController.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/13/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var e: RoundedButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonWasPressed(_ sender: RoundedButton) {
        sender.fade()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
