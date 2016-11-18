//
//  Sighting.swift
//  sight-marker
//
//  Created by Ian Gristock on 16/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import RealmSwift

class Sighting: Object {
    
    dynamic var distance: Int = 0
    dynamic var measurement: String = "meters"
    dynamic var marking: Double = 0.0
    dynamic var hole: Int = 0
}
