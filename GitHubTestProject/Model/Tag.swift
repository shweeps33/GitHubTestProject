//
//  Tag.swift
//  GitHubTestProject
//
//  Created by Admin on 05.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tag {
    var name = ""
    
    mutating func updateWith(data: JSON) {
        self.name = data["name"].stringValue
    }
}
