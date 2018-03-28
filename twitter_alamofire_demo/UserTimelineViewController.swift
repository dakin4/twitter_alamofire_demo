//
//  UserTimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by David King on 3/27/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class UserTimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var userTableView: UITableView!

    var UserTweets : [Tweet] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        userTableView.dataSource = self
        userTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return UserTweets.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTweetsTableViewCell", for: indexPath) as! UserTweetsTableViewCell

        cell.tweet = UserTweets[indexPath.row]
        if let pic = cell.tweet.user.profilepic {
            cell.ProfilePic.af_setImage(withURL: pic)
        }

        
        return cell
        
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
