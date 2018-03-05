//
//  DetailsViewController.swift
//  AlamofireTest
//
//  Created by Admin on 02.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var url: UITextView!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var tags: UILabel!
    
    var repo = Repo()
    var repoTags = [Tag]() {
        didSet {
            let tagNamesArray = repoTags.map { $0.name }
            let tagString = "Tags: " + tagNamesArray.joined(separator: ", ")
            tags.text = tagString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.repo.name
        self.url.text = self.repo.url
        self.url.sizeToFit()
        self.stars.text = String(self.repo.stars)
        self.forks.text = String(self.repo.forks)
        self.descr.text = self.repo.descr
        
        DispatchQueue.main.async {
            Requester.getTags(repo: self.repo) { response in
                if !response.isEmpty {
                    self.repoTags = response
                }
            }
        }
    }
}
