//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var screenName: String?
    //banner
    //dictionary of tweets
    //basic profile info
   var profilepic: URL?
    var friendcount: Int?
    var userid: Int64?
    var favoritecount: Int?

    
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        
        if let profile: String = dictionary["profile_image_url_https"] as? String{
       print(profile)
            
        profilepic = URL(string: profile)!
        }
        
        if let screen = dictionary["screen_name"] {
            var nam: String = screen as! String
            self.screenName = nam
            
        }
        
        friendcount = dictionary["friends_count"] as! Int
       guard let twitid: NSNumber = dictionary["id"] as? NSNumber else {
            print("twitter id error")
            return
        }
      userid = twitid.int64Value
        //userid = dictionary["id"] as! Int64
        favoritecount = dictionary["favourites_count"] as! Int
        print("frineds \(friendcount)")
        
        
        

    }
}
