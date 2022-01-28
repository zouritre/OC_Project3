//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    //MARK: - IBOutlets
    
    
    
    @IBAction func confirmPlayer1(_ sender: UIButton) {
        
        
        
        let player1 = confirmPlayerChoice(playerName: "Player 1", charactersList: player1CharacterList)
        print("\(player1.name): \(player1.characters)")
        
        
        
    }
    
    
    
    @IBAction func confirmPlayer2(_ sender: UIButton) {
        
        
        
        let player2 = confirmPlayerChoice(playerName: "Player 2", charactersList: player2CharacterList)
        print("\(player2.name): \(player2.characters)")
        
        
        
    }
    
    
    
    @IBOutlet weak var player2CharacterList: CharacterListTextView!
    
    
    
    @IBOutlet weak var player1CharacterList: CharacterListTextView!
    
    
    
    
    
    //MARK: - Dismiss Keyboard Outside TextViews
    
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        
        
        
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
        
        
    }
    
    
    
    /// When editing textView and trying to interact with other buttons
    func dismissKeyboardOutsideTextView(){
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not to interfere and cancel other interactions.
            tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
        
        
    }
    
    
    
    
    
    //MARK: - Confirm Players Choices
    
    
    
    func confirmPlayerChoice(playerName: String, charactersList: CharacterListTextView) -> Player {
        
        
        
        var player = Player(name: playerName, characters: [])
        
        for (customName, character) in charactersList.chosenCharacters{
            var character = character
            character.customName = customName.text
            player.characters.append(character)
        }
        
        return player
        
        
        
    }
    
    
    
    
    
    //MARK: - viewDidLoad
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dismissKeyboardOutsideTextView()
        
        
//        Populate the empty character list for each players when the app starts
        player1CharacterList.displayAvailableCharacters(with: CharactersList())
        
        player2CharacterList.displayAvailableCharacters(with: CharactersList())

        
        
    }
    
    
    
}
