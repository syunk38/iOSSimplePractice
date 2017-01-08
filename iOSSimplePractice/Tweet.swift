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
}
