//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by arash arjmand on 11/1/20.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
    
}

class Model {
    
    var delegate: ModelDelegate?
    
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
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the "videosFetched" method for the delegate
                        self.delegate?.videosFetched(response.items!)
                        
                    }
                }
                
                dump(response)
            }
            catch {
                
            }
            
        }
        
        // Kick off the data task
        dataTask.resume()
        
    }
    
}
