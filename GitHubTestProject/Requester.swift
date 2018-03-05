//
//  Requester.swift
//  AlamofireTest
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class Requester {
    static let baseURL = "https://api.github.com/users/cocoapods/"
    static  private func reposURL(_ page: Int) -> String {
        return Requester.baseURL + "repos?page=\(page)"
    }
    
    static func getRepos(page: Int, completion: @escaping ([Repo]) -> ()) {
        let reposURl = Requester.reposURL(page)
        Alamofire.request(reposURl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let reposList = json.array {
                        var reposArray: [Repo] = []
                        for item in reposList {
                            var repo = Repo()
                            repo.updateWithData(item)
                            reposArray.append(repo)
                        }
                        
                        completion(reposArray)
                    }
                case .failure(let error):
                    print(error)
                }
        }
        
    }

}
