//
//  Extensions.swift
//  AlamofireTest
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
