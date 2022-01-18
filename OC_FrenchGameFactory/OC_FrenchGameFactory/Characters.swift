//
//  Characters.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//
//  This file contain all classes wich define every character that can be played

import Foundation

class CharacterList{    //Store a list of every character existing in the game for easy retrieve
    static func characterList() -> [String:AnyObject] {
        var characterList : [String:AnyObject] = [:]
            characterList["Dps1"] = Dps1()
            characterList["Dps2"] = Dps2()
            characterList["Dps3"] = Dps3()
            characterList["Healer"] = Healer()
//
//            var characterList : [String:Int] = [:]
//                characterList["Dps1"] = 1
//                characterList["Dps2"] = 2
//                characterList["Dps3"] = 3
//                characterList["Healer"] = 4
        return characterList
    }
    init(){
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
