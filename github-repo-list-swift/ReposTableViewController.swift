//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
   // var repos: NSArray = []
     let store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.accessibilityLabel = "tableView"
        store.getRepositoriesWithCompletion {
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.tableView.reloadData()
            })
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        let repository:GithubRepository = self.store.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName
    
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.store.repositories.count
        
    }
    
    // MARK: - Table view data source
 

}
