//
//  SignUpManager.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

class SignUpManager {
    
    static let shared = SignUpManager()
    
    let person : Person
    
    private init() {
        person = Person(name: "", lastname: "", subjectD: "", birthday: BirthDay(), number: "", agreement: false)
    }
    
    func dataFullFilled() -> Bool {
        if (person.name != "") && ( person.lastName != "") && (person.birthDay.validateBirthday())  {
            return true
        } else {
            return false
        }
        
    }
    
    
}
