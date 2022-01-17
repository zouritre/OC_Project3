//
//  Characters.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import Foundation

class CharacterList{
    var characterList : [String:AnyObject] = [:]
    init(){
        characterList["Dps1"] = Dps1()
        characterList["Dps2"] = Dps2()
        characterList["Dps3"] = Dps3()
        characterList["Healer"] = Healer()
    }
}

class Dps1: ViewController.Characters{
    init(){
        super.init(name: "Raisin", health: 20, weapon: ViewController.Weapon(), ability: "Foudre")
    }
}
class Dps2: ViewController.Characters{
    init(){
        super.init(name: "Kiwi", health: 21, weapon: ViewController.Weapon(), ability: "Foudre")
    }
}
class Dps3: ViewController.Characters{
    init(){
        super.init(name: "Orange", health: 22, weapon: ViewController.Weapon(), ability: "Foudre")
    }
}
class Healer: ViewController.Characters{
    init(){
        super.init(name: "Noix", health: 15, weapon: ViewController.Weapon(), ability: "Foudre")
    }
}
