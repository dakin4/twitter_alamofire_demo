//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by David King on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    var tweet: Tweet!
    
    @IBOutlet weak var ScreenNameLabel: UILabel!
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var TweetLabelView: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var CreatedAtLabel: UILabel!
    
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    
    @IBAction func DMClicked(_ sender: AnyObject) {
        
    }
   
    @IBAction func favoriteClicked(_ sender: AnyObject) {
        
    }
    
   
    @IBAction func RetweetClicked(_ sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        TweetLabelView.text = tweet.text
        
        userNameLabel.text = tweet.user.name
        
        var str = "@"
        str = str + tweet.user.screenName!
        ScreenNameLabel.text = str
        CreatedAtLabel.text = tweet.createdAtString
       if let  count = tweet.favoriteCount
       {
        favoriteCountLabel.text = String(count)
        
        }
       else{
        favoriteCountLabel.text = String(0)
        
        }
        
       
            ProfileImageView.af_setImage(withURL: tweet.user.profilepic!)
          retweetCountLabel.text  = String(tweet.retweetCount)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
