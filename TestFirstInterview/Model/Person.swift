//
//  Person.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

class Person {
   
    var name: String
    var lastName: String
    var subjectDegree: String
    var birthDay: BirthDay
    var number: String
    var agreement : Bool
    
    init(name: String, lastname: String, subjectD: String, birthday: BirthDay, number: String, agreement: Bool) {
        self.name = name
        self.lastName = lastname
        self.subjectDegree = subjectD
        self.birthDay = birthday
        self.number = number
        self.agreement = agreement
    }
    
}

extension Person: CustomStringConvertible {
    var description: String {
        return "nombre: \(self.name), apellido: \(self.lastName), fecha de nacimiento: \(birthDay.description)"
    }
    
    
}
