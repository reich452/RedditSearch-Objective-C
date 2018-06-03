//
//  PostListTableViewController.swift
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SearchPostsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [DVMPost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        guard let searchTerm = searchBar.text else { return }
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        PostController.shared().searchForPosts(withSearchTerm: searchTerm) {posts,error in
            
            self.posts = posts

            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.title = "\(searchTerm)"
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = self.posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
}

