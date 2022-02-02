//
//  ActionDetail.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 02/02/2022.
//

import UIKit

class ActionDetail: UIStackView {
    
    
    
    
    var alliesAndFoes: [String:Player] = [:]

    
    
    func displayAvailableTargetCharacters (action: String) {
        
        
        
        if action == "Heal" {
            
            
            
            addButtonsToDetailPanel(for: "Ally")

            
            
        }
        
        
        
        if action == "Attack" {
            
            
            
            addButtonsToDetailPanel(for: "Foe")
            
            
            
        }
        
        
///         Create the corresponding buttons for each character in the selected character team if "Heal" is pressed or for each in ennemy team if "Attack" is pressed
        func addButtonsToDetailPanel (for targettedPlayer: String) {
            
            
            
            if let playerCharacters = alliesAndFoes[targettedPlayer]?.characters {
                
                
                
                for character in playerCharacters{
                
                    
                    
                    let characterButton = UIButton()
                    
                    characterButton.setTitle(character.customName, for: .normal)
                    characterButton.backgroundColor = .orange
                    characterButton.addTarget(self, action: #selector(self.actionToTargettedCharacter(_:)), for: .touchUpInside)
                    
                    addArrangedSubview(characterButton)
                    
                    
                    
                }
                
                
                
            }
        
        
        
        }
        
        

    }
    
    
    
    @objc func actionToTargettedCharacter (_ sender: UIButton){
        
        
        
        print(sender.currentTitle!)
        
        
        
    }

}
