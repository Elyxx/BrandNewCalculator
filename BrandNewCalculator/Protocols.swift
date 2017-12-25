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
    func beginProcessing()
    func clearDisplay()
    func deleteLast()
    func symbolReceived(_ symbol: String)//, _ group: ReceivedSymbol)
}
