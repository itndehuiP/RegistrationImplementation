//
//  CustomDate.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

protocol CustomDate {
    var day: Int { get set }
    var month: Int { get set }
    var year: Int { get set }
}

class BirthDay: CustomDate {
    
    var day: Int
    var month: Int
    var year: Int
    
    private let currentDate = CurrentCustomDate.init().currentDate()
    
    init(day: Int, month: Int, year: Int ) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    init() {
        
        self.day = currentDate.day
        self.month = currentDate.month
        self.year = currentDate.year
    }
    
    
    func validateBirthday() -> Bool {
        let actualYear = currentDate.year
        let baseYearRange = actualYear-70
        let dayRange = 1..<32
        let monthRange = 1..<13
        let yearRange = baseYearRange..<actualYear
        
        if dayRange.contains(self.day) && monthRange.contains(self.month) && yearRange.contains(self.year){
            return true
        } else {
            return false
        }
    }

}

extension BirthDay : CustomStringConvertible {
    var description: String {
        return "\(self.day) - \(self.month) - \(self.year)"
    }
}


struct CurrentCustomDate: CustomDate {
    var day: Int = 0
    var month: Int = 0
    var year: Int = 0
    
        func currentDate() -> CustomDate {
            let date = Date()
            return dateToCustom(date: date)
        }
    
    func dateToCustom(date: Date) -> CustomDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let currentDay = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "MM"
        let currentMonth = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "YYYY"
        let currentYear = Int(dateFormatter.string(from: date))
        return CurrentCustomDate(day: currentDay!, month: currentMonth!, year: currentYear!)
    }
    
    func customToDate(custom: CustomDate) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        let dateStrng = dateString(dateElement: custom.month)+"/"+dateString(dateElement: custom.day)+"/\(custom.year)"
        print(dateStrng)
        return dateFormatter.date(from: dateStrng)
    
    }
    
    private func dateString(dateElement: Int) -> String {
        if dateElement.digitCount == 1 {
            return "0\(dateElement)"
        }
        return "\(dateElement)"
    }

}

