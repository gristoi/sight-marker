//
//  Bow.swift
//  sight-marker
//
//  Created by Ian Gristock on 16/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import RealmSwift

class Bow: Object {
    
    dynamic var isDefault: Bool = false
    dynamic var riser: String = ""
    dynamic var bow: String = ""
    dynamic var drawWeight: String = ""
    let sightings = List<Sighting>()
}
