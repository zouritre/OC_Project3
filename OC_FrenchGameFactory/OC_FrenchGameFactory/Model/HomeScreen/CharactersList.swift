//
//  Characters.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 27/01/2022.
//

import Foundation


class CharactersList {
    
    
//    Create and store all playable characters in an array
    var list: [Character] {
        
        
        var characterList : [Character] = []
        
        characterList.append(Character(originalName: "Raisin", customName: "", health: 10, weapon: Weapon(damage: 5), owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Kiwi", customName: "", health: 11, weapon: Weapon(damage: 6), owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Orange", customName: "", health: 12, weapon: Weapon(damage: 7), owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        characterList.append(Character(originalName: "Citron", customName: "", health: 13, weapon: Weapon(damage: 8), owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: [])))
        
        return characterList
        
        
    }
    
    
}
