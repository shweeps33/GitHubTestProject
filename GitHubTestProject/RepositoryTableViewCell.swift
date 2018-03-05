//
//  RepositoryTableViewCell.swift
//  AlamofireTest
//
//  Created by Admin on 02.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UITextView!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var forks: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ repo: Repo) {
        name.text = repo.name
        descr.text = repo.descr
        forks.text = String(describing: repo.forks)
        stars.text = String(describing: repo.stars)
    }
    
}
