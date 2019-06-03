//
//  SubjectCatalog.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/31/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import Foundation

struct SubjectCatalog {
    
    private let subjectOne = "Ciencias Sociales"
    private let subjectTwo = "Física"
    private let subjectThree = "Medicina"
    private let subjectFour = "Enfermería"
    
    static let sharedSubjectCatalog = SubjectCatalog()
    
    let subjects : [String]
    
    private init() {
        subjects = [subjectOne, subjectTwo, subjectThree, subjectFour ]
    }
    
    func subjectsCount () -> Int {
        return subjects.count
    }
    
    func subject(for row: Int ) -> String? {
        if rowIsInRange(row: row) {
            return subjects[row]
        }
        else {
            return nil
        }
    }
    
    func rowForSubject(subject: String) -> Int? {
        for i in 0..<subjects.count {
            if subjects[ i ] == subject {
                return i
            }
        }
        return nil
    }
    
    private func rowIsInRange(row: Int) -> Bool {
        let min = row >= 0
        let max = row < subjects.count
        return min && max
    }
}
