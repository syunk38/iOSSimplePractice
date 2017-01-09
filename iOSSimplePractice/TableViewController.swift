//
//  TableViewController.swift
//  iOSSimplePractice
//
//  Created by Syun on 2016/09/17.
//  Copyright © 2016年 Syun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let tweets : Array<Tweet> = Tweet.getTweets()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        
        cell.imageView?.image = UIImage( named: tweets[indexPath.row].icon)
        if let url = tweets[indexPath.row].url {
            cell.textLabel?.text = url.absoluteString
        } else {
            cell.textLabel?.text = "urlなし"
        }
        cell.detailTextLabel?.text = tweets[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "TweetDetailSeque", sender: tweets[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ShowTweetDetailViewController
        destination.tweet = sender as! Tweet
    }
    
    @IBAction func closeModal(segue: UIStoryboardSegue){}
    @IBAction func closeModalManually(segue: UIStoryboardSegue){}
}

