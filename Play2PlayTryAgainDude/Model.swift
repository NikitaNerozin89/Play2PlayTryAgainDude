//
//  Model.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/4/21.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
}


class Model {
    
    var delegate:ModelDelegate?
    
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
        
        do {
            // Parsing the data into video
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Response.self, from: data!)
            
            // fetch the videos
            
            if response.items != nil {
                self.delegate?.videosFetched(response.items!)
            }
            dump(response)
        }
        catch {
            
        }
    }
        
        
    // Kick off task
        dataTask.resume()
    }
}

