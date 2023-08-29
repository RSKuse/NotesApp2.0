//
//  TableViewCell.swift
//  NotesApp2.0
//
//  Created by Reuben Simphiwe Kuse on 2023/08/27.
//

import Foundation
import UIKit

class NotesTableViewCell: UITableViewCell {
    
    lazy var folderImageView: UIImageView = {
        
        let folderImageView = UIImageView()
        folderImageView.image = UIImage(named: "folder_icon3")
        folderImageView.contentMode = .scaleAspectFill
        folderImageView.clipsToBounds = true
        folderImageView.translatesAutoresizingMaskIntoConstraints = false
        return folderImageView
    }()
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        titleLabel.textColor = UIColor.black
        titleLabel.text = "Pickup Ndalo"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "62"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var foldersLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, numberOfItemsLabel,])
        stackView.distribution = .equalCentering
        stackView.spacing = 5.0
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupUI()
    }
    
    func setupUI() {
        addSubview(folderImageView)
        addSubview(foldersLabelStackView)
        
        folderImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        folderImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        folderImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        folderImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        foldersLabelStackView.leftAnchor.constraint(equalTo: folderImageView.rightAnchor, constant: 16).isActive = true
        foldersLabelStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        foldersLabelStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}
