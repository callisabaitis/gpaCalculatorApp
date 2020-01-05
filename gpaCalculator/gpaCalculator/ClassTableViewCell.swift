//
//  ClassTableViewCell.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 12/31/19.
//  Copyright © 2019 Calli Sabaitis. All rights reserved.
//

import Foundation
import UIKit

class ClassTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var creditsLabel: UILabel!
    var gradeLabel: UILabel!
    var semesterTakenLabel: UILabel!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        creditsLabel = UILabel()
        creditsLabel.font = UIFont.systemFont(ofSize: 12)
        creditsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(creditsLabel)
        
        gradeLabel = UILabel()
        gradeLabel.font = UIFont.systemFont(ofSize: 12)
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        gradeLabel.textAlignment = .right
        contentView.addSubview(gradeLabel)
        
        semesterTakenLabel = UILabel()
        semesterTakenLabel.font = UIFont.systemFont(ofSize: 12)
        semesterTakenLabel.translatesAutoresizingMaskIntoConstraints = false
        semesterTakenLabel.textAlignment = .right
        contentView.addSubview(semesterTakenLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            creditsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            creditsLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            creditsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            gradeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            gradeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            gradeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            gradeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
        NSLayoutConstraint.activate([
            semesterTakenLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            semesterTakenLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            semesterTakenLabel.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor, constant: padding),
            semesterTakenLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configure(for class1: Classes) {
        nameLabel.text = class1.name
        creditsLabel.text = "Credits: " + String(class1.credits)
        gradeLabel.text = "Grade: " + class1.grade
        semesterTakenLabel.text = "Semester: " + class1.semesterTaken
    }
}
