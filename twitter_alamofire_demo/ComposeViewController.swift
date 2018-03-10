//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by David King on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController,ComposeViewControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var profilePicImage: UIImageView!
    
    @IBOutlet weak var CharacterCountLabel: UILabel!
  
    @IBOutlet weak var TweetText: UITextView!
    
    var editText: Int = 0
    var delegate: ComposeViewControllerDelegate?

    var count: Int?
    
    
    @IBAction func PostClicked(_ sender: AnyObject) {
        if let text = TweetText.text{
           APIManager.shared.composeTweet(with: text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                
            }
            
        }   
        }
        
      
        let TimelineViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimelineViewController") as! TimelineViewController
        self.navigationController?.pushViewController(TimelineViewController, animated: true)

    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        print("editing")
        if (editText == 0)
        {
        TweetText.text = ""
            editText = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TweetText.delegate = self
        // Do any additional setup after loading the view.
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
let characterLimit = 140

// Construct what the new text would be if we allowed the user's latest edit
let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)

// TODO: Update Character Count Label
print("text view typein")
// The new text should be allowed? True/False
        var textcnt = (characterLimit - newText.characters.count)
        CharacterCountLabel.text = String(textcnt)
        return newText.characters.count < characterLimit
        
    }

     func did(post: Tweet) {

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

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}


