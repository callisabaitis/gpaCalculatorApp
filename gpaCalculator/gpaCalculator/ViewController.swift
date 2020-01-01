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
    var classes: [Class]!
    var gpa: CGFloat!
    let reuseIdentifier = "gpaCellReuse"
    let cellHeight: CGFloat = 100
    
    var addButton: UIButton!
    var currentGPALabel: UILabel!
    var currentGPANumber: UILabel!
    var classesListLabel: UILabel!
    var classesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "GPA Calculator"
        
        let cs1110 = Class(name: "CS 1110", credits: 4, grade: "A", semester: "Fall 2018")
        let psych = Class(name: "Psych 1101", credits: 3, grade: "A", semester: "Fall 2018")
        let french1220 = Class(name: "French 1220", credits: 4, grade: "A-", semester: "Fall 2018")
        classes = [cs1110, psych]
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
        
        classesListLabel = UILabel()
        classesListLabel.text = "Current Classes:"
        classesListLabel.textColor = .black
        classesListLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(classesListLabel)
        
        classesTable = UITableView()
        classesTable.dataSource = self
        //classesTable.delegate = self
        classesTable.translatesAutoresizingMaskIntoConstraints = false
        classesTable.register(ClassTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(classesTable)
        
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
        NSLayoutConstraint.activate([
            classesListLabel.topAnchor.constraint(equalTo: currentGPALabel.bottomAnchor, constant: padding),
            classesListLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 3*padding),
            classesListLabel.bottomAnchor.constraint(equalTo: currentGPALabel.bottomAnchor, constant: 2*padding+50)
        ])
        NSLayoutConstraint.activate([
            classesTable.topAnchor.constraint(equalTo: classesListLabel.bottomAnchor, constant: padding),
            classesTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            classesTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            classesTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
//    func fixGPA(classes: ([Class])) -> CGFloat) {
//        var sumCredits = 0
//        var sum
//        return 3
//    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTable.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ClassTableViewCell
        let class1 = classes[indexPath.row]
        cell.configure(for: class1)
        cell.selectionStyle = .none
        return cell
    }
}

//extension ViewController: UITableViewDelegate {
//    func classesTable(_ classesTable: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return cellHeight
//    }
//
//    func classesTable(_ classesTable: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let class1 = classes[indexPath.row]
//        let cell = classesTable.cellForRow(at: indexPath) as! ClassTableViewCell
//    }
//}
