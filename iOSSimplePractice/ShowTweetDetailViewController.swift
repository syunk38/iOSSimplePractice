//
//  ShowTweetDetailViewController
//  iOSSimplePractice
//
//  Created by Syun on 2016/09/17.
//  Copyright © 2016年 Syun. All rights reserved.
//

import UIKit

class ShowTweetDetailViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var webView: UIWebView!

    
    var tweet :Tweet = Tweet(name: "", description: "", icon: "", url: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: tweet.url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
