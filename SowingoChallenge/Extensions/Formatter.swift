//
//  Formatter.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-22.
//

import Foundation
// This Extension was obtained from StackOverflow:
///
///https://stackoverflow.com/questions/24960621/struggling-with-nsnumberformatter-in-swift-for-currency#24960818

/// Create a string with currency formatting based on the device locale
extension Double {
    var asLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        return formatter.string(from: NSNumber(value: self))!
    }
}
