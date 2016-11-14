//
//  ManageBowViewController.swift
//  sight-marker
//
//  Created by Ian Gristock on 12/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import XLForm

class ManageBowViewController: XLFormViewController {

    fileprivate struct Tags {
        static let Name = "Name"
        static let BowType = "Bow Type"
        static let DrawWeight = "Draw Weight"
        static let Number = "number"
        static let Integer = "integer"
        static let Decimal = "decimal"
        static let Password = "password"
        static let Phone = "phone"
        static let Url = "url"
        static let ZipCode = "zipCode"
        static let TextView = "textView"
        static let Notes = "notes"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("BEING CALLED")
        initializeForm()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
                print("BEING CALLED REQUIRED")
        initializeForm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ManageBowViewController.savePressed(_:)))
    }

    override func viewDidLayoutSubviews() {
        self.view.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initializeForm() {
            
            let form : XLFormDescriptor
            var section : XLFormSectionDescriptor
            var row : XLFormRowDescriptor
            
            form = XLFormDescriptor(title: "Add A Bow")
            form.assignFirstResponderOnShow = true
            
            section = XLFormSectionDescriptor.formSection(withTitle: "Bow Setup")
            form.addFormSection(section)
            
            
            // Name
            row = XLFormRowDescriptor(tag: Tags.Name, rowType: XLFormRowDescriptorTypeText, title: "Name")
            row.isRequired = true
            section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.BowType, rowType:XLFormRowDescriptorTypeSelectorPush, title:"Bow Type")
        row.selectorOptions = [XLFormOptionsObject(value: 0, displayText: "Barebow"),
                               XLFormOptionsObject(value: 1, displayText:"Compound"),
                               XLFormOptionsObject(value: 2, displayText:"Longbow"),
                               XLFormOptionsObject(value: 3, displayText:"Recurve")
        ]
        row.value = XLFormOptionsObject(value: 3, displayText:"Recurve")
        section.addFormRow(row)
        
        
        // Slider
        row = XLFormRowDescriptor(tag: Tags.DrawWeight, rowType: XLFormRowDescriptorTypeSlider, title: "Draw Weight (lbs)")
        row.value = 20
        row.cellConfigAtConfigure["slider.maximumValue"] = 100
        row.cellConfigAtConfigure["slider.minimumValue"] = 10
        row.cellConfigAtConfigure["steps"] = 100
        section.addFormRow(row)
        // Twitter
            row = XLFormRowDescriptor(tag: Tags.Name, rowType: XLFormRowDescriptorTypeTwitter, title: "Twitter")
            row.disabled = NSNumber(value: true as Bool)
            row.value = "@no_editable"
            section.addFormRow(row)
            
            // Zip Code
            row = XLFormRowDescriptor(tag: Tags.ZipCode, rowType: XLFormRowDescriptorTypeZipCode, title: "Zip Code")
            section.addFormRow(row)
            
            // Number
            row = XLFormRowDescriptor(tag: Tags.Number, rowType: XLFormRowDescriptorTypeNumber, title: "Number")
            section.addFormRow(row)
            
            // Integer
            row = XLFormRowDescriptor(tag: Tags.Integer, rowType: XLFormRowDescriptorTypeInteger, title: "Integer")
            section.addFormRow(row)
            
            // Decimal
            row = XLFormRowDescriptor(tag: Tags.Decimal, rowType: XLFormRowDescriptorTypeDecimal, title: "Decimal")
            section.addFormRow(row)
            
            // Password
            row = XLFormRowDescriptor(tag: Tags.Password, rowType: XLFormRowDescriptorTypePassword, title: "Password")
            section.addFormRow(row)
            
            // Phone
            row = XLFormRowDescriptor(tag: Tags.Phone, rowType: XLFormRowDescriptorTypePhone, title: "Phone")
            section.addFormRow(row)
            
            // Url
            row = XLFormRowDescriptor(tag: Tags.Url, rowType: XLFormRowDescriptorTypeURL, title: "Url")
            section.addFormRow(row)
            
            
            section = XLFormSectionDescriptor.formSection()
            form.addFormSection(section)
            
            
            // TextView
            row = XLFormRowDescriptor(tag: Tags.TextView, rowType: XLFormRowDescriptorTypeTextView)
            row.cellConfigAtConfigure["textView.placeholder"] = "TEXT VIEW EXAMPLE"
            section.addFormRow(row)
            
            
            section = XLFormSectionDescriptor.formSection(withTitle: "TextView With Label Example")
            form.addFormSection(section)
            
            row = XLFormRowDescriptor(tag: Tags.Number, rowType: XLFormRowDescriptorTypeTextView, title: "Notes")
            section.addFormRow(row)
            
            self.form = form
            
        }
        
        
        func savePressed(_ button: UIBarButtonItem)
        {
            let validationErrors : Array<NSError> = self.formValidationErrors() as! Array<NSError>
            if (validationErrors.count > 0){
                self.showFormValidationError(validationErrors.first)
                return
            }
            self.tableView.endEditing(true)
           // let alertView = UIAlertView(title: "Valid Form", message: "No errors found", delegate: self, cancelButtonTitle: "OK")
            //alertView.show()
        }
}

