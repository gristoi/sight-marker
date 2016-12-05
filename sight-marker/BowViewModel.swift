//
//  BowViewModel.swift
//  sight-marker
//
//  Created by Ian Gristock on 04/12/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import Foundation
import RealmSwift

class BowViewModel {
    
    let bow: Bow
    
    var selectedSighting: Sighting?
    
    // MARK - Initialization
    
    init(withBow bow: Bow) {
        self.bow = bow
        print(bow.sightings)
    }
    
    public var inWrite: Bool { return realm.isInWriteTransaction }
    
    /// Specific instance of realm just for this
    /// ViewModel. Use on main thread only.
    public let realm = try! Realm()
    
    public func beginWrite() {
        if !inWrite { realm.beginWrite() }
    }
    
    public func commitWrite() {
        // Not wrapped in `inWrite`, because if this
        // ever happens, then something is wrong.
        try! realm.commitWrite()
    }
    
    public func cancelWrite() {
        if inWrite { realm.cancelWrite() }
    }
    
    public func addToRealm(update: Bool = true) {
        realm.add(bow, update: true)
    }
    
    public func deleteFromRealm() {
        realm.delete(bow)
    }
    
    public func setSelectedSighting(sighting: Sighting) {
        self.selectedSighting = sighting
    }
    
    public func saveSighting(withSighting sighting: Sighting) -> Void {
        beginWrite()
        bow.sightings.append(sighting)
        commitWrite()
    }
    
    public func totalSightings() -> Int {
        return bow.sightings.count
    }
    
    public func getSightingAtIndex(index: Int) -> Sighting {
        return bow.sightings[index]
    }
}
