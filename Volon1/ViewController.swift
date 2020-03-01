//
//  ViewController.swift
//  Volon1
//
//  Created by Bryant Bettencourt on 2/29/20.
//  Copyright © 2020 Bryant Bettencourt. All rights reserved.
//

import UIKit
import FirebaseDatabase
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ref = Database.database().reference()
    }
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
//                print("did not work")
//                return             }

//            let events = snapshot.reversed().compactMap(Event.init)
//            print(events[0].title)
//        ref.child("events").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//          // Get user value
//          let value = snapshot.value as? NSDictionary
//          let username = value?["username"] as? String ?? ""
//          let user = User(username: username)
//
//          // ...
//          }) { (error) in
//            print(error.localizedDescription)
//        }
//            }
//        )
//    }

}
