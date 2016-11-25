//
//  OnBoardingViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 24/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift

class OnBoardingViewController: UIViewController {

    let realm = try! Realm()
    
    @IBOutlet weak var addBowButton: UIButton!
    @IBAction func addBowButtonClicked(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBowButton.backgroundColor = UIColor.clear
        addBowButton.layer.cornerRadius = 5
        addBowButton.layer.borderWidth = 1
        addBowButton.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addBowSegue" {
            let navController: UINavigationController = segue.destination as! UINavigationController
            let nameBowController: ManageBowViewController = navController.viewControllers.first as! ManageBowViewController
            nameBowController.delegate = self
        }
    }
}

extension OnBoardingViewController: ManageBowDelegate {
    
    func didSaveBow(sender: ManageBowViewController, bow: Bow) {
        
        
        if (realm.objects(Bow.self).isEmpty) {
            bow.isDefault = true
        }
        try! realm.write {
            realm.add(bow)
        }
        UserDefaults.standard.set(true, forKey: "onboarded")
        sender.performSegue(withIdentifier: "segueToMain", sender: sender)
    }
}
