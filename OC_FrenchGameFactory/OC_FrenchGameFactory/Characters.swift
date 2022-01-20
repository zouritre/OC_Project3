//
//  Characters.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//
//  This file contain all classes wich define every character that can be played

import Foundation

class CharacterList{    //Store a list of every character existing in the game for easy retrieve
    static var characterList: [Character] {
        var characterList : [Character] = []
        characterList.append(Raisin()) 
        characterList.append(Kiwi())
        characterList.append(Orange())
        characterList.append(Citron())
        return characterList
    }
    init(){
    }
}

class Raisin: Character{
    init(){
        super.init(name: "Raisin", health: 20, weapon: Weapon(damage: 5))
    }
}
class Kiwi: Character{
    init(){
        super.init(name: "Kiwi", health: 21, weapon: Weapon(damage: 6))
    }
}
class Orange: Character{
    init(){
        super.init(name: "Orange", health: 22, weapon: Weapon(damage: 7))
    }
}
class Citron: Character{
    init(){
        super.init(name: "Citron", health: 23, weapon: Weapon(damage: 8))
    }
}
