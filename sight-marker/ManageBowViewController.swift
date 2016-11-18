//
//  ManageBowViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 12/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import Eureka
import RealmSwift

public final class ImageCheckRow<T: Equatable>: Row<ImageCheckCell<T>>, SelectableRowType, RowType {
    public var selectableValue: T?
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public class ImageCheckCell<T: Equatable> : Cell<T>, CellType {
    
    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy public var trueImage: UIImage = {
        return UIImage(named: "selected")!
    }()
    
    lazy public var falseImage: UIImage = {
        return UIImage(named: "unselected")!
    }()
    
    public override func update() {
        super.update()
        accessoryType = .none
        imageView?.image = row.value != nil ? trueImage : falseImage
    }
    
    public override func setup() {
        super.setup()
    }
    
    public override func didSelect() {
        row.reload()
        row.select()
        row.deselect()
    }
    
}

class ManageBowViewController: FormViewController {

    @IBAction func saveBow(_ sender: Any) {
        let valuesDictionary = form.values()
        guard let riser = valuesDictionary["riser"] as? String else {
            return
        }
        let bow = (form[1] as! SelectableSection<ImageCheckRow<String>>).selectedRow()!.value
        let drawWeight = valuesDictionary["drawWeight"] as! String
        
        let newBow = Bow()
        newBow.riser = riser
        newBow.bow = bow!
        newBow.drawWeight = drawWeight
        // Get the default Realm
        let realm = try! Realm()
        
        if (realm.objects(Bow.self).isEmpty) {
            newBow.isDefault = true
        }
        

        try! realm.write {
            realm.add(newBow)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let weights = stride(from: 18, through: 70, by: 2)
        print(weights)
        
        let bows = ["Barebow", "Compound", "Longbow", "Recurve"]
        
        form +++ Section("Riser ( i.e SF Forged Plus)")
            <<< TextRow(){ row in
                row.title = "Riser"
                row.placeholder = "Enter Riser"
                row.tag = "riser"
        }
        
        form +++ SelectableSection<ImageCheckRow<String>>() { section in
            section.header = HeaderFooterView(title: "Type of bow")
        }
        
        for option in bows {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                lrow.title = option
                lrow.selectableValue = option
                if (option == "Barebow") {
                    lrow.value = "Barebow"
                } else {
                    lrow.value = nil
                }
                
            }
        }
        
        form +++ Section("Draw Weight")
            <<< PushRow<String>() {
                $0.title = "Weight (lbs)"
                $0.selectorTitle = "Select weight"
                $0.options = weights.map{ String($0) }
                $0.value = "18"    // initially selected
                $0.tag = "drawWeight"
                }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
