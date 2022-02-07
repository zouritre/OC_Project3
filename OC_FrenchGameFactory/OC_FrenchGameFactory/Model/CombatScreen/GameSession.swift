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
    
    var chestAvailable: Bool = false
    
    var uiElements: GameSessionUIelements! {
        
        willSet {
            
            newValue.actualRound.text = "Round: \(actualRound)"
            newValue.chestAvailable.isEnabled = false
            
        }
    }

}
