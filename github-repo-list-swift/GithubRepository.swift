//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String?
    
    let htmlUrl: NSURL?
    
    var repositoryID: String?
    
    
  
    
    
    
    init(dictionary: NSDictionary){
     
        fullName = dictionary["full_name"] as? String
        
        htmlUrl = NSURL(string: dictionary["html_url"]! as! String)
     
        repositoryID = dictionary["id"] as? String
        
    }
    
}
