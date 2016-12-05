//
//  ViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 03/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var bowViewModel: BowViewModel?
    let realm = try! Realm()
    var bow: Bow?
    
    @IBOutlet weak var switchBowsButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bowNameLabel: UILabel!
    @IBOutlet weak var bowTypeLabel: UILabel!
    @IBOutlet weak var bowDrawWeightLabel: UILabel!
    open override func viewDidLoad() {
        super.viewDidLoad()
        switchBowsButton.imageView?.contentMode = UIViewContentMode.center
                tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowViewModel?.totalSightings() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        _ = bowViewModel?.getSightingAtIndex(index: indexPath.row)
        
        // Instantiate a cell
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write {
                bow?.sightings.remove(objectAtIndex: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

}




