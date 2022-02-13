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
    
    
//    Create an observable to update hp UI dynamically
    var health: Int {
        
        
        willSet{
            
            if let UIelements = UIelements{
             
                
                UIelements.characterHPLabel.hp = newValue
                
                
            }
            
            
        }
        
        
    }
    
    var maxHealth: Int
    
    
//    Create an observable to update weapon damage UI dynamically
    var weapon: Weapon {
        
        
        willSet{
            
            
            if let UIelements = UIelements{
            
                
                UIelements.characterWeaponDamageLabel.weaponDamage = newValue.damage
                
                
            }
            
            
        }
        
        
    }
    
    
    var owningPlayer: Player
    
    var opponent: Player
    
    
//    Store all UI elements corresponding to that character instance
    var UIelements : charactersStatsUIElements! {
        
        
        willSet{
            
            
            newValue.characterButton.setTitle(customName, for: .normal)
            newValue.characterHPLabel.hp = health
            newValue.characterWeaponDamageLabel.weaponDamage = weapon.damage
        
            
        }
        
        
    }
    
    
    init(originalName: String, customName: String, health: Int, maxHealth: Int, weapon: Weapon, owningPlayer: Player, opponent: Player){
        
        
        self.originalName = originalName
        self.customName = customName
        self.health = health
        self.maxHealth = maxHealth
        self.weapon = weapon
        self.owningPlayer = owningPlayer
        self.opponent = opponent
    
        
    }
    
    
//    Used to instanciate a character object without having to initialize all variables
    convenience init() {
    
        
        self.init(originalName: "", customName: "", health: 0, maxHealth: 0, weapon: Weapon(damage: 0), owningPlayer: Player(name: "", characters: []), opponent: Player(name: "", characters: []))
    
    
    }


}
