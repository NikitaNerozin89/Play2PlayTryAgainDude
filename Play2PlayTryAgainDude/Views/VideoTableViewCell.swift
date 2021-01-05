//
//  VideoTableViewCell.swift
//  Play2PlayTryAgainDude
//
//  Created by user190393 on 1/4/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ThumbnailImageView: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video)
    {
        self.video = v
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        
        if let cachedData = Organisation.getVideoCache(self.video!.thumbnail)
        {
            self.ThumbnailImageView.image = UIImage (data: cachedData)
            return
        }
        
        self.Title.text = video?.title
    
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.Date.text = df.string(from: video!.published)
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {(data, response, error)
            in
            
            if error == nil && data != nil {
                
                Organisation.setVideoCache(url!.absoluteString, data!)
                
                
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.ThumbnailImageView.image = image
                }
            }
    }
        dataTask.resume()
    }
}
