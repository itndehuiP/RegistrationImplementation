//
//  Extension+Int+CountDigit.swift
//  TestFirstInterview
//
//  Created by Guerson on 6/1/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

extension Int {
    var digitCount: Int {
        let intInString = String(self)
        return intInString.count
    }
}
