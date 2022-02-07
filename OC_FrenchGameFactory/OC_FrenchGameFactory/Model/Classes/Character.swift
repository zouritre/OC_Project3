//
//  Character.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

class Character {
    var originalName : String
    
    
    var customName: String
    
    var health: Int {
        
        willSet{
            
            if let UIelements = UIelements{
                
                UIelements.characterHPLabel.hp = newValue
                
            }
        }
    }
    
    var weapon: Weapon {
        
        willSet{
            
            if let UIelements = UIelements{
                
                UIelements.characterWeaponDamageLabel.weaponDamage = newValue.damage
                
            }
        }
    }
    
    var chestAvailable: Bool
    
    var owningPlayer: Player
    
    var opponent: Player
    
    var UIelements : charactersStatsUIElements! {
        
        willSet{
            
            newValue.characterButton.setTitle(customName, for: .normal)
            newValue.characterHPLabel.hp = health
            newValue.characterWeaponDamageLabel.weaponDamage = weapon.damage
        
        }
        
    }
    
    init(originalName: String, customName: String, health: Int, weapon: Weapon, chestAvailable: Bool, owningPlayer: Player, opponent: Player){
        
        self.originalName = originalName
        self.customName = customName
        self.health = health
        self.weapon = weapon
        self.chestAvailable = chestAvailable
        self.owningPlayer = owningPlayer
        self.opponent = opponent
    
    }
    
    convenience init() {
        self.init(originalName: "", customName: "", health: 0, weapon: Weapon(damage: 0), chestAvailable: false, owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: []))
    }
}
