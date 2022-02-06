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
            
//                If this character is dead, does not create an action button for him
                if character.health == 0 {
                    continue
                }
                
                else  {
                    
                    
                    let characterButton = CharactersButton()
                    
                    characterButton.correspondingCharacter = character
                    characterButton.backgroundColor = .cyan
                    characterButton.setTitleColor(.red, for: .normal)
                    characterButton.addTarget(self, action: #selector(actionToTargettedCharacter(_:)), for: .touchUpInside)
                    
                    addArrangedSubview(characterButton)
                    
                }
                
                
                
            }
            
            
        }
            
            
    }
    
    
    
    ///     Send the targetted character CharactersButton() to CombatScreenVC using Notification when an action has been chosen
    @objc func actionToTargettedCharacter (_ sender: CharactersButton){

        
        var target: [String:Character] = [:]

        target["target"] = sender.correspondingCharacter

        let name = Notification.Name(rawValue: "targettedCharacter")

        let notification = Notification(name: name, userInfo: target)

        NotificationCenter.default.post(notification)


    }
    

}
