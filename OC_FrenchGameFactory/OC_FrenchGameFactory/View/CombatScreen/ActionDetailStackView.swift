//
//  ActionDetail.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 02/02/2022.
//

import UIKit

class ActionDetailStackView: UIStackView {
    
    
    
/// Store a list of the selected character's allies and foes
    internal var alliesAndFoes: [String:Player] = [:]
    
    
    
    internal func displayAvailableTargetCharacters (action: String) {
        
        
        
        if action == "Heal" {
            
            
            
            addButtonsToDetailPanel(for: "Ally")

            
            
        }
        
        
        
        if action == "Attack" {
            
            
            
            addButtonsToDetailPanel(for: "Foe")
            
            
            
        }
        
        

    }
    
    
    
///         Create the corresponding buttons for each character in the selected character team if "Heal" is pressed or for each in ennemy team if "Attack" is pressed
    private func addButtonsToDetailPanel (for targettedPlayer: String) {
        
        
        
        if let playerCharacters = alliesAndFoes[targettedPlayer]?.characters {
            
            
            
            for character in playerCharacters{
            
                
                
                let characterButton = CharactersButton()
                
                characterButton.correspondingCharacter = character
                characterButton.backgroundColor = .cyan
                characterButton.setTitleColor(.red, for: .normal)
                characterButton.addTarget(self, action: #selector(actionToTargettedCharacter(_:)), for: .touchUpInside)
                
                addArrangedSubview(characterButton)
                
                
                
            }
            
            
            
        }
            
            
            
    }
    
    ///     Send the targetted character info to CombatScreenVC using Notification
    @objc func actionToTargettedCharacter (_ sender: CharactersButton){

        var target: [String:Character] = [:]

        target["target"] = sender.correspondingCharacter

        let name = Notification.Name(rawValue: "targettedCharacter")

        let notification = Notification(name: name, userInfo: target)

        NotificationCenter.default.post(notification)

        print(sender.correspondingCharacter.customName)


    }
    
    

}
