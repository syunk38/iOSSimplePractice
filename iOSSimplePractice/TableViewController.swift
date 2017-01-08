//
//  TableViewController.swift
//  iOSSimplePractice
//
//  Created by Syun on 2016/09/17.
//  Copyright © 2016年 Syun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTweets().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        let tweets = getTweets();
        
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
        self.performSegue(withIdentifier: "TweetDetailSeque", sender: getTweets()[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ShowTweetDetailViewController
        destination.tweet = sender as! Tweet
    }
    
    @IBAction func closeModal(segue: UIStoryboardSegue){}
    
    private func getTweets() -> [Tweet] {
        return (1...10).map {
            if $0 % 2 == 0 {
                return Tweet(name: "Google", description: "検索サイト", icon: "Google", url: URL(string: "https://www.google.co.jp"))
            }
            return Tweet(name: "Apple", description: "世界を変える果実", icon: "Apple", url: URL(string: "http://www.apple.com/jp/"))
        }
    }
}

