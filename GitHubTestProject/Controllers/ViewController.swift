//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Admin on 02.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "RepositoryTableViewCell"
    let nib = "RepositoryTableViewCell"
    let listName = "CocoaPods Repo's"
    
    var isEnd = false
    var reposArray = [Repo]()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = listName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: cellID)
        getRepos(currentPage)
    }
    
    private func getRepos(_ page: Int) {
        Requester.getRepos(page: page) { response in
            self.reposArray.append(contentsOf: response)
            self.isEnd = response.isEmpty
            
            var indexPaths = [IndexPath]()
            let lastIndex = self.tableView.numberOfRows(inSection: 0)
            let newLastIndex = lastIndex + response.count
            
            for index in lastIndex..<newLastIndex {
                indexPaths.append(IndexPath(row: index, section: 0))
            }
            self.tableView.insertRows(at: indexPaths, with: .bottom)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposArray.count
    }
    
    private func loadMore() {
        currentPage += 1
        getRepos(currentPage)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? RepositoryTableViewCell else { return UITableViewCell() }
        guard let repo = reposArray[safe: indexPath.row] else { return cell}
        cell.configure(repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRepo = reposArray[indexPath.row]
        guard let detailsVC = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailsViewController.self)) as? DetailsViewController else {
            return
        }
        detailsVC.repo = selectedRepo
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == reposArray.count - 1, !self.isEnd {
            loadMore()
        }
    }
    
}

