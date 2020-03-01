//
//  Event.swift
//  Volon1
//
//  Created by Bryant Bettencourt on 2/29/20.
//  Copyright © 2020 Bryant Bettencourt. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Event {
    var key: String?
    let title: String
    let description: String
    let tags: Array<String>
    let date: NSDate
    let org: String
    let link: String
    let imageURL: String
    let attendees: Array<String>
//    init(title: String, description: String, date: NSDate, org: String,imageURL: String, tags: Array<String>) {
//
//
//
//        self.title = title
//        self.date = date
//        self.imageURL = imageURL
//        self.org = org
//        self.description = description
//        self.tags = tags
//        self.creationDate = Date()
//        self.link = link
//    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let attendees = dict["attendees"] as? Array<String>,
            let tags = dict["tags"] as? Array<String>,
            let imageURL = dict["image_url"] as? String,
            let date = dict["datetime"] as? NSDate,
            let title = dict["title"] as? String,
            let org = dict["organization"] as? String,
            let description = dict["description"] as? String,
            let link = dict["link"] as? String
            else { return nil }

        self.key = snapshot.key
        self.imageURL = imageURL
        self.attendees = attendees
        self.title = title
        self.date = date
        self.link = link
        self.org = org
        self.description = description
        self.tags = tags
        
    }
    
    
}
