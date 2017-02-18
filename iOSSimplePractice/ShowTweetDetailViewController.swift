//
//  ShowTweetDetailViewController
//  iOSSimplePractice
//
//  Created by Syun on 2016/09/17.
//  Copyright © 2016年 Syun. All rights reserved.
//

import UIKit
import SVProgressHUD

class ShowTweetDetailViewController: UIViewController, UIWebViewDelegate {
  @IBOutlet weak var webView: UIWebView!

  
  var tweet :Tweet = Tweet(name: "", description: "", icon: "", url: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.delegate = self
    SVProgressHUD.show()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func webViewDidFinishLoad(_ webView: UIWebView) {
    SVProgressHUD.dismiss()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let url = tweet.url {
      webView.loadRequest(URLRequest(url: url))
    }
    else {
      SVProgressHUD.dismiss()
      let alert: UIAlertController = UIAlertController(title: "エラー", message: "urlが見つかりません", preferredStyle: UIAlertControllerStyle.alert)
      let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
        (action: UIAlertAction!) in self.performSegue(withIdentifier: "closeModalManually", sender: self)
      })
      alert.addAction(defaultAction)
      present(alert, animated: true, completion: nil)
    }
  }
}
