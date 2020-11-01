//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by arash arjmand on 11/1/20.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Create a URLSession object
        let session = URLSession.shared
        
        // Get the data task from the URLSession
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects
            
        }
        
        // Kick off the data task
        dataTask.resume()
        
    }
    
}
