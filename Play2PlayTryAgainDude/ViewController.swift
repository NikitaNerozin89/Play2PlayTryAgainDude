//
//  ViewController.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {


    @IBOutlet weak var TableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.dataSource = self
        TableView.delegate = self
        
        // self video
        model.delegate = self
        model.getVideos()
  
    }
    
    // model delegate method
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
     // go again video
        
        TableView.reloadData()
    }
     
    // mention table views method
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        cell.textLabel?.text = title
        // Configure the cell with the data
        
        
        // Return the cell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

