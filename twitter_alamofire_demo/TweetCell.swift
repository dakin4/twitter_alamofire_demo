//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var CreatedAtLabel: UILabel!
    @IBOutlet weak var ScreennameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBAction func ReplyClicked(_ sender: AnyObject) {
    }
    
    
    @IBAction func RetweetClicked(_ sender: AnyObject) {
    }
    
    
    @IBAction func FavoriteClicked(_ sender: AnyObject) {
    }
    
    @IBAction func DirectMessageClicked(_ sender: AnyObject) {
    }
    
    
    // taking the text of the tweet
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
        }
    }
    
    var username: Tweet!{
        didSet{
            UserNameLabel.text = username.user.name
        }
        
    }
  
    var screename : Tweet!{
        didSet{
            var screen = "@"
            var scr = screen + screename.user.screenName!
            ScreennameLabel.text = scr
        }
        
    }
    
    var date: Tweet!{
        
        didSet{
           CreatedAtLabel.text = date.createdAtString
            
        }
    }
    var retweet: Tweet!{
        didSet{
            var count = retweet.retweetCount
            
            retweetLabel.text = String(count)
            //print("Retweet label \(count)")
        }
    }
    
    var favorite: Tweet!{
    didSet{
    var count = favorite.favoriteCount!
    
   favoriteLabel.text = String(count)
    
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
