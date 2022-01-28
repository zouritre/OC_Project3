//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func confirmPlayer1(_ sender: UIButton) {
        for (customName, character) in player1CharacterList.chosenCharacters{
            var custChar = character
            custChar.customName = customName.text
            player1.characters.append(custChar)
        }
        print("\(player1.name): \(player1.characters)")
    }
    @IBAction func confirmPlayer2(_ sender: UIButton) {
        for (customName, character) in player2CharacterList.chosenCharacters{
            var custChar = character
            custChar.customName = customName.text
            player2.characters.append(custChar)
        }
        print("\(player2.name): \(player2.characters)")
    }
    @IBOutlet weak var player2CharacterList: CharacterList!
    @IBOutlet weak var player1CharacterList: CharacterList!
    
    var player1 = Player(name: "Player 1",characters: [])

    var player2 = Player(name: "Player 2", characters: [])
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)}
    
    func avoidButtonsFreeze(){    // When editing textview and trying to interact with other buttons
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not to interfere and cancel other interactions.
            tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avoidButtonsFreeze()
        
        
//        Populate the empty character list for each players when the app starts
        player1CharacterList.displayAvailableCharacters(with: CharactersList())
        player2CharacterList.displayAvailableCharacters(with: CharactersList())

    }
}
