//
//  Model.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/4/21.
//

import Foundation

class Model {
    
    func getVideos() {
    
    // create a URL object
    
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
    
    // Get a URL Session object
    let session = URLSession.shared
    // Get a data task from the URL Session
    let dataTask = session.dataTask(with: url!) { (data, response, error)
            in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
        }
            // Parsing the data into video
            
    // Kick off task
        dataTask.resume
    }
}
