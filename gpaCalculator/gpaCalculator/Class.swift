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
}
