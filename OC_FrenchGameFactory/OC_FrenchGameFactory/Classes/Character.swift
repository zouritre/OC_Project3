//
//  Character.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

class Character{
    var originalName : String
    var customName: String
    var health: Int
    var weapon: Weapon
    var chestAvailable: Bool?
    init(originalName : String, customName: String, health: Int, weapon: Weapon){
        self.originalName = originalName
        self.health = health
        self.weapon = weapon
        self.customName = customName
    }
}
