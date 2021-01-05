//
//  Organisation.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/5/21.
//

import Foundation

class Organisation {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data: Data ) {
        
        cache[url] = data

    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        return cache[url]
    }
    
}
