//
//  ViewController.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
      
    }


}

