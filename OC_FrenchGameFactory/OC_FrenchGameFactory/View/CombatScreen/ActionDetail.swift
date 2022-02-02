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
            print("heal")
            addButtonsToDetailPanel(for: "Ally")

        }
        if action == "Attack" {
            print("attack")
            addButtonsToDetailPanel(for: "Foe")
        }
        
        func addButtonsToDetailPanel (for targettedPlayer: String) {
            
            if let allyCharacters = alliesAndFoes[targettedPlayer]?.characters {
                for character in allyCharacters{
                    let characterButton = UIButton()
                    characterButton.setTitle(character.customName, for: .normal)
                    characterButton.backgroundColor = .orange
                    addArrangedSubview(characterButton)
                }
            }
        }
        

    }

}
