//
//  DateShortPicker.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit

class DateShortPicker: UIDatePicker {

    override func awakeFromNib() {
        let calendar = Calendar.current
        self.maximumDate = calendar.date(byAdding: .year, value: 0, to: Date())
        self.minimumDate = calendar.date(byAdding: .year, value: -70, to: Date())
        self.datePickerMode = .date
    }
    
    

}
