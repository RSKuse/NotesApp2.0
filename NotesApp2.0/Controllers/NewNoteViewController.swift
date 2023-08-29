//
//  NewNoteViewController.swift
//  NotesApp2.0
//
//  Created by Reuben Simphiwe Kuse on 2023/08/27.
//

import Foundation
import UIKit

class NewNoteViewController: UIViewController, UITextFieldDelegate {
    
    var createdNote: ((Notes) -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.text = "Enter Note"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var noteTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Note Title"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var noteDetailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Notes"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Note"
        setupUI()
        addNavigationButtons()
        noteTitleTextField.becomeFirstResponder()
        
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(noteTitleTextField)
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: noteTitleTextField.topAnchor, constant: -8).isActive = true
        
        noteTitleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        noteTitleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        noteTitleTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true

    }
    
    func addNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .done,
            target: self,
            action: #selector(addNote))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(handleDismiss))
    }

    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    
    @objc func addNote() {
        
        let noteString = noteTitleTextField.text
        
        let note = Notes(folderImage: UIImage(named: "folder_icon3")!, title: noteString!)
        createdNote?(note)
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
