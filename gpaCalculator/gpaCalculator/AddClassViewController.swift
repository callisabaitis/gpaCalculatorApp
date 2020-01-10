//
//  AddClassViewController.swift
//  gpaCalculator
//
//  Created by Calli Sabaitis on 1/4/20.
//  Copyright © 2020 Calli Sabaitis. All rights reserved.
//

import UIKit

//protocol AddClassViewControllerDelegate: class {
//    func willBeDismissed()
//    //func
//}

class AddClassViewController: UIViewController {
    
    var addLabel: UILabel!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var creditsLabel: UILabel!
    var creditsTextField: UITextField!
    var gradeLabel: UILabel!
    var gradeTextField: UITextField!
    var semesterTakenLabel: UILabel!
    var semesterTakenTextField: UITextField!
    var addButton: UIButton!
    
    let horizontalPadding: CGFloat = 10
    let verticalPadding: CGFloat = 20
    let border: CGFloat = 2
    weak var delegate: ChangeButtonPressed?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addLabel = UILabel()
        addLabel.text = "Add a New Class"
        addLabel.textColor = .black
        addLabel.font = addLabel.font.withSize(20)
        addLabel.textAlignment = .center
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addLabel)

        nameLabel = UILabel()
        nameLabel.text = "Name of Class: "
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(16)
        nameLabel.textAlignment = .right
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        creditsLabel = UILabel()
        creditsLabel.text = "Number of Credits: "
        creditsLabel.textColor = .black
        creditsLabel.font = nameLabel.font.withSize(16)
        creditsLabel.textAlignment = .right
        creditsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditsLabel)
        
        gradeLabel = UILabel()
        gradeLabel.text = "Grade: "
        gradeLabel.textColor = .black
        gradeLabel.font = nameLabel.font.withSize(16)
        gradeLabel.textAlignment = .right
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradeLabel)
        
        semesterTakenLabel = UILabel()
        semesterTakenLabel.text = "Semester Taken: "
        semesterTakenLabel.textColor = .black
        semesterTakenLabel.font = nameLabel.font.withSize(16)
        semesterTakenLabel.textAlignment = .right
        semesterTakenLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(semesterTakenLabel)
        
        nameTextField = UITextField()
        nameTextField.textColor = .black
        nameTextField.text = "[name]"
        nameTextField.clearsOnBeginEditing = true
        nameTextField.font = nameLabel.font.withSize(16)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        creditsTextField = UITextField()
        creditsTextField.textColor = .black
        creditsTextField.text = "[credits]"
        creditsTextField.clearsOnBeginEditing = true
        creditsTextField.font = nameLabel.font.withSize(16)
        creditsTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditsTextField)
        
        gradeTextField = UITextField()
        gradeTextField.textColor = .black
        gradeTextField.text = "[grade]"
        gradeTextField.clearsOnBeginEditing = true
        gradeTextField.font = nameLabel.font.withSize(16)
        gradeTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradeTextField)
        
        semesterTakenTextField = UITextField()
        semesterTakenTextField.textColor = .black
        semesterTakenTextField.text = "[semester]"
        semesterTakenTextField.clearsOnBeginEditing = true
        semesterTakenTextField.font = nameLabel.font.withSize(16)
        semesterTakenTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(semesterTakenTextField)
        
        addButton = UIButton()
        addButton.setTitle("Add Class", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.layer.borderWidth = border
        addButton.layer.cornerRadius = 10;
        view.addSubview(addButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            addLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding),
            addLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalPadding)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: addLabel.bottomAnchor, constant: verticalPadding*2),
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
            nameTextField.topAnchor.constraint(equalTo: addLabel.bottomAnchor, constant: verticalPadding*2),
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
            addButton.topAnchor.constraint(equalTo: semesterTakenLabel.bottomAnchor, constant: verticalPadding*2),
            addButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalPadding)
        ])
    }
    
    @objc func addButtonPressed() {
//        NetworkManager.createClass(name: nameTextField.text!, completion: { (classes) in
        //self.delegate?.willBeDismissed()
        let credits1 : String = creditsTextField.text!
        let credits2 : Int? = Int(credits1)
        let class1 = Classes(name: nameTextField.text!, credits: credits2!, grade: gradeTextField.text!.uppercased(), semester: semesterTakenTextField.text!)
        delegate?.addButtonPressed(to: class1)
        self.dismiss(animated: true)
    
//        })
    }

}
//
//extension ViewController: AddClassViewControllerDelegate {
//    func addButtonPressed(name: name)
//}
