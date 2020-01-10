//
//  IndClassViewController.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 1/5/20.
//  Copyright © 2020 Calli Sabaitis. All rights reserved.
//

import UIKit

//protocol DeleteClassViewControllerDelegate: class {
//    func willBeDismissed()
//}

class IndClassViewController: UIViewController {
    
    var classLabel: UILabel!
    var nameLabel: UILabel!
    var nameTextField: UILabel!
    var nameText: String
    var creditsLabel: UILabel!
    var creditsTextField: UILabel!
    var creditsText: String
    var gradeLabel: UILabel!
    var gradeTextField: UILabel!
    var gradeText: String
    var semesterTakenLabel: UILabel!
    var semesterTakenTextField: UILabel!
    var semesterTakenText: String
    var deleteButton: UIButton!
    
    var thisClass: Classes!
    
    let horizontalPadding: CGFloat = 10
    let verticalPadding: CGFloat = 20
    let border: CGFloat = 2
    weak var delegate: ChangeButtonPressed?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        classLabel = UILabel()
        classLabel.text = "Class View"
        classLabel.textColor = .black
        classLabel.font = classLabel.font.withSize(20)
        classLabel.textAlignment = .center
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(classLabel)
        
        nameLabel = UILabel()
        nameLabel.text = "Name of Class: "
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(16)
        nameLabel.textAlignment = .right
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameTextField = UILabel()
        nameTextField.text = nameText
        nameTextField.textColor = .black
        nameTextField.font = nameTextField.font.withSize(16)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        creditsLabel = UILabel()
        creditsLabel.text = "Number of Credits: "
        creditsLabel.textColor = .black
        creditsLabel.font = nameLabel.font.withSize(16)
        creditsLabel.textAlignment = .right
        creditsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditsLabel)
        
        creditsTextField = UILabel()
        creditsTextField.text = creditsText
        creditsTextField.textColor = .black
        creditsTextField.font = creditsTextField.font.withSize(16)
        creditsTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditsTextField)
        
        gradeLabel = UILabel()
        gradeLabel.text = "Grade: "
        gradeLabel.textColor = .black
        gradeLabel.font = nameLabel.font.withSize(16)
        gradeLabel.textAlignment = .right
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradeLabel)
        
        gradeTextField = UILabel()
        gradeTextField.text = gradeText
        gradeTextField.textColor = .black
        gradeTextField.font = gradeTextField.font.withSize(16)
        gradeTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradeTextField)
        
        semesterTakenLabel = UILabel()
        semesterTakenLabel.text = "Semester Taken: "
        semesterTakenLabel.textColor = .black
        semesterTakenLabel.font = nameLabel.font.withSize(16)
        semesterTakenLabel.textAlignment = .right
        semesterTakenLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(semesterTakenLabel)
        
        semesterTakenTextField = UILabel()
        semesterTakenTextField.text = semesterTakenText
        semesterTakenTextField.textColor = .black
        semesterTakenTextField.font = semesterTakenTextField.font.withSize(16)
        semesterTakenTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(semesterTakenTextField)
        
        deleteButton = UIButton()
        deleteButton.setTitle("Delete Class", for: .normal)
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        deleteButton.layer.borderWidth = border
        deleteButton.layer.cornerRadius = 10;
        view.addSubview(deleteButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            classLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            classLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            classLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding),
            classLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: verticalPadding*2),
            nameLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -horizontalPadding),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            creditsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: verticalPadding),
            creditsLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -horizontalPadding),
            creditsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            gradeLabel.topAnchor.constraint(equalTo: creditsLabel.bottomAnchor, constant: verticalPadding),
            gradeLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -horizontalPadding),
            gradeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            semesterTakenLabel.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor, constant: verticalPadding),
            semesterTakenLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -horizontalPadding),
            semesterTakenLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: verticalPadding*2),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: horizontalPadding),
            nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            creditsTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: verticalPadding),
            creditsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: horizontalPadding),
            creditsTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            gradeTextField.topAnchor.constraint(equalTo: creditsTextField.bottomAnchor, constant: verticalPadding),
            gradeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: horizontalPadding),
            gradeTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            semesterTakenTextField.topAnchor.constraint(equalTo: gradeTextField.bottomAnchor, constant: verticalPadding),
            semesterTakenTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: horizontalPadding),
            semesterTakenTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: semesterTakenLabel.bottomAnchor, constant: verticalPadding*2),
            deleteButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding),
            deleteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalPadding)
        ])
    }
    
    init(classes: Classes) {
        self.thisClass = classes
        self.nameText = classes.name
        self.creditsText = classes.credits.description
        self.gradeText = classes.grade
        self.semesterTakenText = classes.semesterTaken
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteButtonPressed() {
        delegate?.deleteButtonPressed(to: thisClass)
        self.dismiss(animated: true)
    }
    
}
