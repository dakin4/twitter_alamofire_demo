//
//  UserTweetsTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by David King on 3/27/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class UserTweetsTableViewCell: UITableViewCell {
   
    @IBOutlet weak var CreatedAtLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!

    @IBOutlet weak var ScreennameLabel: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBAction func ReplyClicked(_ sender: AnyObject) {
    }
    
    
    @IBAction func RetweetClicked(_ sender: AnyObject) {
        APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
                var count = tweet.favoriteCount! + 1
                self.favoriteLabel.text = String(count)
            }
        }
        

    }
    
    @IBAction func FavoriteClicked(_ sender: AnyObject) {
        APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
                var count = tweet.favoriteCount! + 1
                self.favoriteLabel.text = String(count)
            }
        }

    }
    
    @IBAction func DirectMessageClicked(_ sender: AnyObject) {
    }
    
    
    
    var tweet: Tweet!{
        
        didSet{
            tweetTextLabel.text = tweet.text
            UserNameLabel.text = tweet.user.name
            var screen = "@"
            var scr = screen + tweet.user.screenName!
            ScreennameLabel.text = scr
            
            CreatedAtLabel.text = tweet.createdAtString
            var count = tweet.retweetCount
            retweetLabel.text = String(count)
            if let cnt = tweet.favoriteCount{
                
                favoriteLabel.text = String(cnt)
            }
            else
            {
                favoriteLabel.text = String(0)
                
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var replyLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
