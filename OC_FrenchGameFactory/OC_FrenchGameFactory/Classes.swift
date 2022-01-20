//
//  classes.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 20/01/2022.
//

import Foundation

class GameSession{
    var players: [Player]
    var isFinished: Bool
    var actualRound: Int
    var winner: String?
    init(){
        players = []
        isFinished = false
        actualRound = 0
    }
}
class Player{
    var characters: [Character]
    init(){
        characters = []
    }
}
class Character{
    var name : String
    var health: Int
    var weapon: Weapon
    var chestAvailable: Bool
    init(name : String, health: Int, weapon: Weapon){
        self.name = name
        self.health = health
        self.weapon = weapon
        chestAvailable = false
    }
}
class Weapon{
    var damage: Int
    init(damage: Int){
        self.damage = damage
    }
}
