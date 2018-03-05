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
    @IBOutlet weak var descr: UITextView!
    
    var repo = Repo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = repo.name
        url.text = repo.url
        stars.text = String(repo.stars)
        forks.text = String(repo.forks)
        descr.text = repo.descr
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
}
