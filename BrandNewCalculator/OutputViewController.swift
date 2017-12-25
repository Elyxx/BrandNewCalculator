//
//  OutputViewController.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/13/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {

    
    @IBOutlet weak var resultWindow: RoundedLabel!
    @IBOutlet weak var indicator: UILabel!
 
    let displayMargin: CGFloat = 10
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func display(_ result: String){
        let width = resultWindow.intrinsicContentSize.width
        if width > ( resultWindow.frame.width - displayMargin ){
            print("limit has been reached")
        }
        resultWindow.text = result
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
