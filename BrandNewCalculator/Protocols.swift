//
//  Protocols.swift
//  BrandNewCalculator
//
//  Created by adminaccount on 12/25/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import Foundation

protocol ProcessDelegate:class{
    func processing(input: [String])->Double
}

protocol InputDelegate: class {
    //func cleanMemory()
    //func readMemory()
    func beginProcessing(input: [String]) -> Double
    func setMemoryIndicator(active: String)
    //func deleteLast() -> Bool
    func inputReceived(input: String)//, _ group: ReceivedSymbol)
}
