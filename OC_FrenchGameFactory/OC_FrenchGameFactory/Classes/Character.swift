//
//  Character.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

class Character{
    var name : String
    var health: Int
    var weapon: Weapon
    var chestAvailable: Bool?
    init(name : String, health: Int, weapon: Weapon){
        self.name = name
        self.health = health
        self.weapon = weapon
    }
}
