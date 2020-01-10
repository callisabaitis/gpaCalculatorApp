//
//  ViewController.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 12/30/19.
//  Copyright © 2019 Calli Sabaitis. All rights reserved.
//

import UIKit

protocol ChangeButtonPressed: class {
    func addButtonPressed(to newClass: Classes)
    func deleteButtonPressed(to newClass: Classes)
}

class ViewController: UIViewController {
    
    let padding: CGFloat = 8
    let border: CGFloat = 4
    var classes: [Classes]!
    var gpa: String!
    let reuseIdentifier = "gpaCellReuse"
    let cellHeight: CGFloat = 50
    
    var addButton: UIButton!
    var currentGPALabel: UILabel!
    var currentGPANumber: UILabel!
    var classesListLabel: UILabel!
    var classesTable: UITableView!
    var refreshButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "GPA Calculator"
        
        let cs1110 = Classes(name: "CS 1110", credits: 4, grade: "A", semester: "Fall 2018")
        let psych = Classes(name: "Psych 1101", credits: 3, grade: "A", semester: "Fall 2018")
        let french1220 = Classes(name: "French 1220", credits: 4, grade: "A-", semester: "Fall 2018")
        classes = [cs1110, psych, french1220]
        //gpa = fixGPA(classes: classes)
        
        addButton = UIButton()
        addButton.setTitle("Add New Class", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.borderWidth = border
        addButton.layer.cornerRadius = 10;
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        view.addSubview(addButton)
        
        currentGPALabel = UILabel()
        currentGPALabel.text = "Current GPA:"
        currentGPALabel.textColor = .black
        currentGPALabel.translatesAutoresizingMaskIntoConstraints = false
        currentGPALabel.textAlignment = .right
        view.addSubview(currentGPALabel)
        
        currentGPANumber = UILabel()
        fixGPA()
        //currentGPANumber.text = gpa
        //currentGPANumber.text = String(gpa)
        currentGPANumber.textColor = .black
        currentGPANumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentGPANumber)
        
        classesListLabel = UILabel()
        classesListLabel.text = "Current Classes:"
        classesListLabel.textColor = .black
        classesListLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(classesListLabel)
        
        refreshButton = UIButton()
        refreshButton.setTitle("Refresh GPA", for: .normal)
        refreshButton.setTitleColor(.black, for: .normal)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.layer.borderWidth = border
        refreshButton.layer.cornerRadius = 10;
        refreshButton.addTarget(self, action: #selector(fixGPA), for: .touchUpInside)
        view.addSubview(refreshButton)
        
        classesTable = UITableView()
        classesTable.dataSource = self
        classesTable.delegate = self
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
    
    @objc func fixGPA() {
        var sumGradePoints: CGFloat = 0
        var sumCredits: CGFloat = 0
        for x in classes {
            sumGradePoints = sumGradePoints + x.gradeToInt(grade: x.grade, credits: x.credits)
            sumCredits = sumCredits + CGFloat(x.credits)
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        let value = formatter.string(from: (sumGradePoints/sumCredits) as NSNumber)!
        gpa = value
        currentGPANumber.text = gpa
    }
    
    @objc func addButtonAction() {
        let viewContrtoller = AddClassViewController()
        viewContrtoller.delegate = self
        present(viewContrtoller, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTable.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ClassTableViewCell
        let class1 = classes[indexPath.row]
        cell.configure(for: class1)
        //cell.selectionStyle = .none
        return cell
    }
}

//extension ViewController: UITableViewDelegateFlowLayout {
//    func classesTable(_ classesTable: UITableView, layout tableViewLayout: UITableView, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = ()
//    }
//}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = IndClassViewController(classes: classes[indexPath.row])
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}

extension ViewController: ChangeButtonPressed {
    func deleteButtonPressed(to newClass: Classes) {
        classes = classes.filter({$0.name != newClass.name})
        classesTable.reloadData()
        fixGPA()
    }
    
    func addButtonPressed(to newClass: Classes) {
        classes.append(newClass)
        classesTable.reloadData()
        fixGPA()
    }
}
