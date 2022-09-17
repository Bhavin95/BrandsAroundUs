//
//  StringExtension.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/15/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

extension String {
    var isIndianPhoneNumber: Bool {
        if self.isStringEmpty() {
            return false
        }
        let indianRegex = "^((91[0-9]{10})|(0[0-9]{10}))|([5-9][0-9]{9})$"
        let phoneText = NSPredicate(format: "SELF MATCHES %@", indianRegex)
        let isValid = phoneText.evaluate(with: self) as Bool
        return isValid
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isStringEmpty() -> Bool {
        return self.stringByTrimmingWhiteSpace().count == 0 ? true : false
    }
    // Get string by removing White Space
    func stringByTrimmingWhiteSpace() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
