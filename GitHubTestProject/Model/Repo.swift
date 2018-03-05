//
//  Repo.swift
//  AlamofireTest
//
//  Created by Admin on 02.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Repo {
    var name = ""
    var descr = ""
    var url = ""
    var stars = 0
    var forks = 0
    var tags: URL?
    
    mutating func updateWith(data: JSON) {
        self.name = data["name"].string ?? ""
        self.descr = data["description"].string ?? ""
        self.forks = data["forks_count"].int ?? 0
        self.stars = data["stargazers_count"].int ?? 0
        self.url = data["html_url"].string ?? ""
        if let url = data["tags_url"].url {
            self.tags = url
        }
    }
}
