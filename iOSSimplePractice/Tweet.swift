//
//  Tweet.swift
//  iOSSimplePractice
//
//  Created by Syun on 2016/11/12.
//  Copyright © 2016年 Syun. All rights reserved.
//

import Foundation

struct Tweet {
    init(name:String, description:String, icon:String, url:URL?) {
        self.name = name
        self.description = description
        self.icon = icon
        self.url = url
    }
    var name :String
    var description :String
    var icon :String
    var url :URL?
    
    static func getTweets() -> [Tweet] {
        return (1...10).map {
            if $0 % 2 == 0 {
                return Tweet(name: "Google", description: "検索サイト", icon: "Google", url: URL(string: "https://www.google.co.jp"))
            }
            if $0 % 3 == 0 {
                return Tweet(name: "nil", description: "空のデータ", icon: "Google", url: nil)
            }
            return Tweet(name: "Apple", description: "世界を変える果実", icon: "Apple", url: URL(string: "http://www.apple.com/jp/"))
        }
    }
}
