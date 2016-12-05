//
//  Sighting.swift
//  sight-marker
//
//  Created by Ian Gristock on 16/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import RealmSwift

class Sighting: Object {
    
    dynamic var distance: Int = 0 {
        didSet {
            compoundKey = compoundKeyValue()
        }
    }
    
    dynamic var measurement: String = "meters" {
        didSet {
            compoundKey = compoundKeyValue()
        }
    }
    
    dynamic var marking: Double = 0.0
    dynamic var hole: Int = 0 {
        didSet {
            compoundKey = compoundKeyValue()
        }
    }
    
    dynamic var compoundKey: String = "0-"
    
    public override static func primaryKey() -> String? {
        return "compoundKey"
    }
    
    private func compoundKeyValue() -> String {
        return "\(distance)-\(measurement)-\(hole)"
    }
}
