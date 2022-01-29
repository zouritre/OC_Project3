//
//  CharacterList.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation
import UIKit




///  Populate each players character list view
class CharacterListTextView: UIStackView{
    
    
    
    
    
    //MARK: - Variables
    
    
    
    var chosenCharacters: [UITextView:Character] = [:]
    
    var viewOwningPlayer: String?
    
    var notifyPlayerIsReady: [String:Bool] = [:]
    
    
    
    
    
    //MARK: - Display Available Characters
    
    
    
///       Create as much buttons and custom name text fields as there are playable characters in the game and set their default names on the buttons
    func displayAvailableCharacters(with characters: CharactersList){
        
        
        
        for character in characters.list{
            
            
            // Create a custom  horizontal StackView
            let row = self.createStackView(axis: NSLayoutConstraint.Axis.horizontal, alignement: UIStackView.Alignment.fill, distribution: UIStackView.Distribution.fillEqually, spacing: 2, baselineRelative: false)
            
            let customName = createTextView()
            
            let customButton = customButton(for: character, customName: customName)
            
            // Add a unique custom Button to that StackView corresponding to a specific character
            row.addArrangedSubview(customButton)
            
            // Add a TextView next to the button
            row.addArrangedSubview(customName)
            
            // Add the customly filled horizontal StackView to CharacterList vertical StackView as a row
            addArrangedSubview(row)
            
            
            
        }
        
        
                    
    }
    
    
    
    
    
    //MARK: - Create Stack View
    
    
    
    ///    Create a customizable stackView
        private func createStackView(axis: NSLayoutConstraint.Axis, alignement: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat, baselineRelative: Bool) -> UIStackView{
            
            
            
            let stackView = UIStackView()
            
            stackView.axis = axis
            stackView.alignment = alignement
            stackView.distribution = distribution
            stackView.spacing = spacing
            stackView.isBaselineRelativeArrangement = baselineRelative
            
            return stackView
            
            
            
        }
    
    
    
    
    
    //MARK: - Create Text View
    
    
    
    ///    Create a simple textView
        private func createTextView() -> UITextView {
            
            
            
            let textView = UITextView()
            
            textView.isHidden = true
            textView.text = ""
            
            return textView
            
            
            
        }
    
    
    
    
    
    //MARK: - Check If Player Is Ready
    
    
    
    func checkSelectedCharactersCount(){
        if chosenCharacters.count == 3 {
            notifyPlayerIsReady = [viewOwningPlayer!:true]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayerIsReady"), object: nil, userInfo: notifyPlayerIsReady)

        }
        else {
            notifyPlayerIsReady = [viewOwningPlayer!:false]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayerIsReady"), object: nil, userInfo: notifyPlayerIsReady)
        }
    }
    
    
    
    
    
    //MARK: - Custom Button Setup
    
    
    
    /// Create a customized button
    func customButton(for character: Character, customName: UITextView) -> UIButton{
        
        
        
        let button = CreateButton()
        
        button.correspondingCharacter = character
        button.customNameTextView = customName
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(character.originalName, for: .normal)
        button.backgroundColor = UIColor.green
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(self.pressed(_:)), for: .touchUpInside)
        
        return button
        
        
        
    }
    
    
    
    ///    Set button backgorund color to grey if pressed or green if not pressed - Default: Green
    @objc func pressed(_ sender: CreateButton) {
        
        
        
        //  if button state goes from pressed to unpressed (is now unselected)
        if sender.pressed{
            
            
            
            sender.pressed = !sender.pressed
            sender.backgroundColor = .green
            sender.customNameTextView?.isHidden = true
            sender.customNameTextView?.backgroundColor = .white
            //    Reset the text if button is unselected
            sender.customNameTextView?.text = ""
            
            // Delete the unselected character corresponding to that button from the array of selected characters
            self.chosenCharacters[sender.customNameTextView!] = nil
            
            checkSelectedCharactersCount()
            
            
            
        }
        
        
        
        //  if button is being selected
        else{
            
            
            
            sender.pressed = !sender.pressed
            sender.backgroundColor = .gray
            sender.customNameTextView?.isHidden = false
            
            self.chosenCharacters[sender.customNameTextView!] = sender.correspondingCharacter!
            
            checkSelectedCharactersCount()
        
            
        
        }
        
        
        
    }
    
    
    
}
