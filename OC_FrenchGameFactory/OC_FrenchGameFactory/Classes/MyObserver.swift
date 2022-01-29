//
//  MyObserver.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 28/01/2022.
//

import UIKit

class MyObserver: NSObject {
    @objc var objectToObserve: CharacterListTextView
    var observation: NSKeyValueObservation?
    
    init(object: CharacterListTextView) {
        objectToObserve = object
        super.init()
        
        observation = observe(
            \.objectToObserve.playerIsReady,
            options: [.old, .new]
        ) { object, change in
            print("Player was: \(change.oldValue!), but now:  \(change.newValue!)")
        }
    }
}
