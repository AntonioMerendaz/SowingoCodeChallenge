//
//  NSAttributedString.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-22.
//

import Foundation
extension NSAttributedString {

    /// This Extension was obtained from StackOverflow: https://stackoverflow.com/questions/13133014/how-can-i-create-a-uilabel-with-strikethrough-text

        /// Returns a new instance of NSAttributedString with same contents and attributes with strike through added.
         /// - Parameter style: value for style you wish to assign to the text.
         /// - Returns: a new instance of NSAttributedString with given strike through.
         func withStrikeThrough(_ style: Int = 1) -> NSAttributedString {
             let attributedString = NSMutableAttributedString(attributedString: self)
             attributedString.addAttribute(.strikethroughStyle,
                                           value: style,
                                           range: NSRange(location: 0, length: string.count))
             return NSAttributedString(attributedString: attributedString)
         }
    }
