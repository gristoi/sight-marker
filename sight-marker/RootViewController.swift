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
        let predicate = NSPredicate(format: "isDefault = %ld", 1)
        bow = realm.objects(Bow.self).filter(predicate).first
        bowNameLabel.text = bow?.riser
        bowTypeLabel.text = bow?.bow
        bowDrawWeightLabel.text = "Draw Weight : \(bow!.drawWeight) lbs"
        try! realm.write{
            let sighting  = Sighting()
            sighting.distance = 10
            sighting.marking = 1.9
            sighting.hole = 0
            bow?.sightings.append(sighting)
            bow?.riser = "SF Forged Pro"
        }
                tableView.reloadData()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bow?.sightings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        let element = bow?.sightings[indexPath.row]
        
        // Instantiate a cell
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        // Adding the right informations
        //cell.textLabel?.text = String(describing: element?.distance)
       // cell.detailTextLabel?.text = String(describing: element?.marking)
        
        // Returning the cell
        return cell
    }

}




