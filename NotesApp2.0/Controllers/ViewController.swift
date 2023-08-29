//
//  ViewController.swift
//  NotesApp2.0
//
//  Created by Reuben Simphiwe Kuse on 2023/08/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sharedNotesArray: [Notes] = [
        Notes(folderImage: UIImage(named: "userProfile_icon")!,title: "Shared"),
    ]
    var folderTitleArray: [Notes] = [
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Pick Up Ndalo"),
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Coding Tutorial"),
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Mellow's Dental Appointment"),
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Car Wash"),
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Pick Up Asa"),
        Notes(folderImage: UIImage(named: "folder_icon3")!,title: "Call Radie"),
    ]
    
    lazy var foldersTableView: UITableView = {
        let foldersTableView = UITableView(frame: .zero, style: .insetGrouped)
        foldersTableView.delegate = self
        foldersTableView.dataSource = self
        foldersTableView.translatesAutoresizingMaskIntoConstraints = false
        return foldersTableView
    }()
    
    lazy var addFolderNoteImageButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "add_folder_icon")
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addFolderButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var composeNoteImageButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "compose_icon")
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(composeNoteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        title = "Folders"
        let addFolderButton = UIBarButtonItem(customView: addFolderNoteImageButton)
        let composeNoteButton = UIBarButtonItem(customView: composeNoteImageButton)
        navigationItem.leftBarButtonItem = addFolderButton
        navigationItem.rightBarButtonItem = composeNoteButton
        
    }
    
    func setupUI() {
        view.addSubview(foldersTableView)
        view.addSubview(addFolderNoteImageButton)
        view.addSubview(composeNoteImageButton)
        
        
        foldersTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        foldersTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        foldersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        foldersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addFolderNoteImageButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        addFolderNoteImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49).isActive = true
        
        composeNoteImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        composeNoteImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49).isActive = true
        
    }
    
    func registerCells() {
        foldersTableView.register(NotesTableViewCell.self, forCellReuseIdentifier: "NotesTableViewCellID")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sharedNotesArray.count
        } else {
            return folderTitleArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCellID", for: indexPath) as! NotesTableViewCell
        if indexPath.section == 0 {
            noteCell.folderImageView.image = sharedNotesArray[indexPath.row].folderImage
            noteCell.titleLabel.text = sharedNotesArray[indexPath.row].title
        } else {
            noteCell.folderImageView.image = folderTitleArray[indexPath.row].folderImage
            noteCell.titleLabel.text = folderTitleArray[indexPath.row].title
        }
        return noteCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let notesViewController = NotesDetailViewController()
        
        if indexPath.section == 0 {
            notesViewController.note = sharedNotesArray[indexPath.row]
        } else {
            notesViewController.note = folderTitleArray[indexPath.row]
        }
        
        if indexPath.section == 0 {
            notesViewController.deleteNotes = {
                self.sharedNotesArray.remove(at: indexPath.row)
                self.foldersTableView.reloadData()
            }
        } else {
            notesViewController.deleteNotes = {
                self.folderTitleArray.remove(at: indexPath.row)
                self.foldersTableView.reloadData()
            }
                self.navigationController?.pushViewController(notesViewController, animated: true)
            }
            
            @objc func addFolderButtonPressed() {
                let newNoteViewController = NewNoteViewController()

                newNoteViewController.createdNote = { (createdNoteValue) in
                    self.folderTitleArray.append(createdNoteValue)
                    self.foldersTableView.reloadData()
                    
                }
                
                let newNoteVC = UINavigationController(rootViewController: newNoteViewController)
                newNoteVC.modalPresentationStyle = .fullScreen
                present(newNoteVC, animated: true, completion: nil)
                
                
                
                //        @objc func composeNoteButtonPressed() {
                //
                //        }
                
                
            }
            
        }
    }

