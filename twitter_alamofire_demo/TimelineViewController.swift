//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets: [Tweet] = []
    var UserTweets: [Tweet] = []
    var curUser: User?{
        didSet{
            
            print("cusar user set")
            APIManager.shared.getUserTweets(user: curUser!) { (tweets, error) in
                print("get user tweets apimanager")
              //  guard let tweets = tweets else{
                 //   print("no user tweets \(error?.localizedDescription)")
                //    return
               // }
                //print("user tweets \(tweets[1].createdAtString)")
            }
           
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
         refreshControl = UIRefreshControl ()
        //tableView.rowHeight = UITableViewAutomaticDimension
       // tableView.estimatedRowHeight = 200
     
        refreshControl.addTarget(self, action: #selector(TimelineViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
    

        hometimeline()
        
        APIManager.shared.getCurrentAccount { (currentuser, error) in
            
            guard let currentuser = currentuser else {
                print("cant find current user error: (error?.localizedDescription)")
               return
            }
            
            
            self.curUser = currentuser
            print("current user profile \(self.curUser!.screenName)")
           
            APIManager.shared.getUserTweets(user: self.curUser!) { (tweets, error) in
                print("get user tweets apimanager")
                 guard let tweets = tweets else{
                    
                   print("no user tweets \(error?.localizedDescription)")
                    return
                 }
                self.UserTweets = tweets
                print("user tweets \(tweets[1].createdAtString)")
            }

 
            
        }

        
    }
    
    
    func didPullToRefresh (_ refreshController: UIRefreshControl){
       
       
        print("pull")
        hometimeline()
       refreshControl.endRefreshing()

        
    }
    
    
    
    @IBAction func ComposeButtonClicked(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "composeSegue", sender: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func hometimeline (){
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
               
            } else if let error = error {
                print("Error getting home timeline: " + error.localizedDescription)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
    
        if let pic = tweets[indexPath.row].user.profilepic {
            cell.ProfilePic.af_setImage(withURL: pic) 
        }
        
        return cell
    }
    
    
    // what does this function do
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailsegue"){
            
        
        //sender is person or object that inisiated the segue
        let cell = sender as! UITableViewCell
        
        if let indexPath = tableView.indexPath(for: cell){
            
            let tweet = tweets[indexPath.row]
            
            
            let detail = segue.destination as! DetailViewController
        
            detail.tweet = tweet
            
        }
        }
    
        else if (segue.identifier == "composeSegue"){
            let compose = segue.destination as! ComposeViewController
            
            compose.curuser = curUser
            
            print("composing")
        }
        
        else if (segue.identifier == "UserProfile"){
          
            let userprofile = segue.destination as! UserTimelineViewController
            
            userprofile.UserTweets = UserTweets
                        
            
        }
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
