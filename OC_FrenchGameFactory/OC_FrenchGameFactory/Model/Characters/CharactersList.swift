//
//  Characters.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 27/01/2022.
//

import Foundation

/// Return a list of all playable characters
class CharactersList {
    
    var list: [Character] {
        var characterList : [Character] = []
        characterList.append(Character.init(originalName: "Raisin", customName: "", health: 20, weapon: Weapon(damage: 5)))
        characterList.append(Character.init(originalName: "Kiwi", customName: "", health: 21, weapon: Weapon(damage: 6)))
        characterList.append(Character.init(originalName: "Orange", customName: "", health: 22, weapon: Weapon(damage: 7)))
        characterList.append(Character.init(originalName: "Citron", customName: "", health: 23, weapon: Weapon(damage: 8)))
        return characterList
    }
}
