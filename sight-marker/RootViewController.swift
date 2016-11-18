//
//  ViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 03/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift

class RootViewController: UIViewController {

    let realm = try! Realm()
    var bow: Bow?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let predicate = NSPredicate(format: "isDefault = %@", 1)
        bow = realm.objects(Bow.self).filter(predicate).first
        print(bow)
        //view.backgroundColor = Color.grey.lighten5

    }

    

}




