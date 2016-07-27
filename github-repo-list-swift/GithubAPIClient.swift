//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

let urlString = "https://api.github.com/repositories?client_id=" + clientId + "&client_secret=" + clientSecret

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completionHandler: (NSArray)->()) {
    
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    //convert URL to string
    if let githubUrl = NSURL(string: "https://api.github.com/repositories?client_id=997f8ccded3d82de453b&client_secret=eabccd400ba0c884e4b7ab44f75f35b9940e3988"){
        
        
        //use that session (type url into browser but havent pressed enter yet)
        let githubTask = session.dataTaskWithURL(githubUrl, completionHandler: {(data, response, error) in
            
            
            ////////// INSIDE COMPLETION HANDLER ///////////////
            
            ///// YOU ONLY HAVE THE DATA IN THE COMPLETION HANDLER /////
            
            //get data in big ass string format
            if let data = data {
                do{
                    let responseData = try NSJSONSerialization.JSONObjectWithData(data, options:
                        []) as! NSArray
                    
                    
                        NSOperationQueue.mainQueue().addOperationWithBlock({ 
                            completionHandler(responseData)
                            print(responseData)
                        })
                    
                        ////self.repos = response.repositoriesArray////
                    
                    
                } catch {
                    print("Fail!")
                }
            }
        })
        
        //press enter
        githubTask.resume()
        
    }
}
}