//
//  GameSession.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

struct GameSession{
    
    var players: [Player] = []
    
    var isFinished: Bool = false
    
    var actualRound: Int = 0 {
        
        willSet {
            
            if let uiElement = uiElements.actualRound{
                
                uiElement.text = "Round: \(newValue)"
                
            }
        }
    }
    
    var winner: String?
    
    var chestAvailable: Bool = false {
        
        willSet{
            
            if let uiElement = uiElements.chestAvailable{
                
                uiElement.isEnabled = newValue
                uiElement.backgroundColor = newValue ? .systemBlue : .lightText
                print(newValue)
                
            }
        }
    }
    
    var uiElements: GameSessionUIelements! {
        
        willSet {
            
            newValue.actualRound.text = "Round: \(actualRound)"
            newValue.chestAvailable.isEnabled = chestAvailable
            
        }
    }

}
