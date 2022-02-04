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
        characterList.append(Character(originalName: "Raisin", customName: "", health: 20, weapon: Weapon(damage: 5), chestAvailable: false, owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Kiwi", customName: "", health: 21, weapon: Weapon(damage: 6), chestAvailable: false, owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Orange", customName: "", health: 22, weapon: Weapon(damage: 7), chestAvailable: false, owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Citron", customName: "", health: 23, weapon: Weapon(damage: 8), chestAvailable: false, owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        return characterList
    }
}
