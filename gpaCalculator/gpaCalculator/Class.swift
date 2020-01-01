//
//  Class.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 12/30/19.
//  Copyright © 2019 Calli Sabaitis. All rights reserved.
//

import Foundation
import UIKit

class Class {
    var name: String
    var credits: Int
    var grade: String
    var semesterTaken: String
    
    init(name: String, credits: Int, grade: String, semester: String) {
        self.name = name
        self.credits = credits
        self.grade = grade
        self.semesterTaken = semester
    }
    
    func gradeToInt(grade: String, credits: Int) -> CGFloat {
        if (grade == "A+") {
            return CGFloat(credits)*4.3
        } else if (grade == "A"){
            return CGFloat(credits)*4.0
        } else if (grade == "A-") {
            return CGFloat(credits)*3.7
        } else if (grade == "B+") {
            return CGFloat(credits)*3.3
        } else if (grade == "B") {
            return CGFloat(credits)*3.0
        } else if (grade == "B-") {
            return CGFloat(credits)*2.7
        } else if (grade == "C+") {
            return CGFloat(credits)*2.3
        } else if (grade == "C") {
            return CGFloat(credits)*2.0
        } else if (grade == "C-") {
            return CGFloat(credits)*1.7
        } else if (grade == "D+") {
            return CGFloat(credits)*1.3
        } else if (grade == "D") {
            return CGFloat(credits)*1.0
        } else {
            return 0
        }
    }
}
