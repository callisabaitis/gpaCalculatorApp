//
//  ViewController.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 12/30/19.
//  Copyright © 2019 Calli Sabaitis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let padding: CGFloat = 8
    let border: CGFloat = 4
    var classes: [Class] = []
    var gpa: CGFloat!
    
    var addButton: UIButton!
    var currentGPALabel: UILabel!
    var currentGPANumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "GPA Calculator"
        
        let class1 = Class(name: "CS 1110")
        classes = [class1]
        //gpa = fixGPA(classes: classes)
        
        addButton = UIButton()
        addButton.setTitle("Add New Class", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.borderWidth = border
        addButton.layer.cornerRadius = 10;
        view.addSubview(addButton)
        
        currentGPALabel = UILabel()
        currentGPALabel.text = "Current GPA:"
        currentGPALabel.textColor = .black
        currentGPALabel.translatesAutoresizingMaskIntoConstraints = false
        currentGPALabel.textAlignment = .right
        view.addSubview(currentGPALabel)
        
        currentGPANumber = UILabel()
        //currentGPANumber.text = gpa.description
        currentGPANumber.text = "3.0"
        currentGPANumber.textColor = .black
        currentGPANumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentGPANumber)
        
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            
        ])
        NSLayoutConstraint.activate([
            currentGPALabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: padding),
            currentGPALabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -3*padding),
            currentGPALabel.heightAnchor.constraint(equalToConstant: 50),
            currentGPALabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            currentGPALabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2*padding+100)
        ])
        NSLayoutConstraint.activate([
            currentGPANumber.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: padding),
            currentGPANumber.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 3*padding),
            currentGPANumber.heightAnchor.constraint(equalToConstant: 50),
            currentGPANumber.bottomAnchor.constraint(equalTo: addButton.bottomAnchor, constant: padding+50)
        ])
    }
    
//    func fixGPA(classes: ([Class])) -> CGFloat) {
//        var sumCredits = 0
//        var sum
//        return 3
//    }

}

