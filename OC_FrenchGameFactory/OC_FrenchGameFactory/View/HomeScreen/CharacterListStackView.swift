//
//  CharacterList.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation
import UIKit


class CharacterListStackView: UIStackView{
    
    
    
    
    
    //MARK: - Variables
    
    
///     When a character button is tapped, append this dictionnary with  his corresponding character custom name TextView along with his character object
    var chosenCharacters: [UITextView:Character] = [:]
    
///     Match this StackView instance with a player who owns it.
    var viewOwningPlayer: String?
    
///     This variable is sent to the main VC with viewOwningPlayer var as key and a bool to tell if this player is ready or not
    var notifyPlayerIsReady: [String:Bool] = [:]
    
    
    
    
    
    //MARK: - Display Available Characters
    
    
    
    /// Create as much buttons and custom name text fields as there are playable characters in the CharacterList class  and set their default names on the buttons
    /// - Parameter characters: An object wich store a list of all playable characters in the game
    func displayAvailableCharacters(with characters: CharactersList){
        
        
        for character in characters.list{
            
            
            // Create a custom  horizontal StackView
            let row = self.createStackView(axis: NSLayoutConstraint.Axis.horizontal, distribution: UIStackView.Distribution.fillEqually, spacing: 2)
            
            let customName = createTextView()
            
            let customButton = customButton(for: character, customName: customName)
            
            // Add a unique custom Button to that StackView corresponding to a specific character
            row.addArrangedSubview(customButton)
            
            // Add a TextView next to the button
            row.addArrangedSubview(customName)
            
            // Add the custom horizontal StackView to CharacterList vertical StackView as a row
            addArrangedSubview(row)
            
            
        }
        
                    
    }
    
    
    
    
    //MARK: - Create Stack View
    
    
    
    
    /// Create a customizable stackView
    /// - Parameters:
    ///   - axis: Axis along wich to align the elements : vertical or horizontal
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    ///   - spacing: The distance between each elements of the stack
    /// - Returns: A custom StackView
        private func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView{
            
            
            let stackView = UIStackView()
            
            stackView.axis = axis
            stackView.distribution = distribution
            stackView.spacing = spacing
            
            return stackView
            
            
        }
    
    
    
    
    //MARK: - Create Text View
    
    
    
    
    /// Create a simple textView
    /// - Returns: A hidden and empty  TextView
        private func createTextView() -> UITextView {
            
            
            let textView = UITextView()
            
            textView.isHidden = true
            textView.text = ""
            
            return textView
            
            
        }
    
    
    
 
    //MARK: - Custom Button Setup
    
    
    
    
    /// Create a customized button
    /// - Parameters:
    ///   - character: A Character object
    ///   - customName: A textView containg the character custom name
    /// - Returns: A custom button in wich is stored his corresponding character and his cusotm name StackView
    func customButton(for character: Character, customName: UITextView) -> UIButton{
        
        
        let button = CreateButton()
        
        button.correspondingCharacter = character
        button.customNameTextView = customName
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(character.originalName, for: .normal)
        button.backgroundColor = UIColor.green
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        
        return button
        
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Check If Player Is Ready
    
    /// Send a notification telling the main VC if the player who own this view is ready or not
    func checkSelectedCharactersCount(){
        
        
        if chosenCharacters.count == 3 {
            
            
            notifyPlayerIsReady = [viewOwningPlayer!:true]

            
        }
        
        
        else {
            
            
            notifyPlayerIsReady = [viewOwningPlayer!:false]
            
            
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayerIsReady"), object: nil, userInfo: notifyPlayerIsReady)
        
        
    }
    
    
    
    
   
    
    
    
    
    //MARK: - Action on button pressed
    
    
    
    
    
    /// Set button backgorund color to grey if a  button is pressed or green if not pressed - Default: Green
    /// - Parameter sender: The button wich has been clicked
    @objc func buttonPressed(_ sender: CreateButton) {
        
        
        //  if button state goes from pressed to unpressed (is now unselected) set his background color to green and delete the character info corresponding to that button form the array of selected characters
        if sender.pressed{
            
            
            sender.pressed = !sender.pressed
            sender.backgroundColor = .green
            sender.customNameTextView?.isHidden = true
            sender.customNameTextView?.backgroundColor = .white
            
            //    Reset the text if button is unselected
            sender.customNameTextView?.text = ""
            
            // Delete the character corresponding to that button from the array of selected characters
            chosenCharacters[sender.customNameTextView!] = nil
            
//            if selected characters count is = 3 the player who own this view is ready, if <3 he's not
            checkSelectedCharactersCount()
            
            
        }
        
        
        //  if button is selected set his background color to grey and append the character informations store in the button to the array of selected characters
        else{
            
            
            sender.pressed = !sender.pressed
            sender.backgroundColor = .gray
            sender.customNameTextView?.isHidden = false
            
//            add the characters info corresponding to that button to the array of characters selected
            chosenCharacters[sender.customNameTextView!] = sender.correspondingCharacter!
            
            
//            if selected characters count is = 3 the player who own this view is ready, if <3 he's not
            checkSelectedCharactersCount()
        
            
        }
        
        
    }
    
    
}
