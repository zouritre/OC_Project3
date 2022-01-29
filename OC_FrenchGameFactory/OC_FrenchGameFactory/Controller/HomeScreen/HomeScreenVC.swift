//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    
    
    
    
    //MARK: - IBOutlets
    
    
    
//    @IBAction func confirmPlayer1(_ sender: UIButton) {
//
//
//
//        let player1 = confirmPlayerChoice(playerName: "Player 1", charactersList: player1CharacterList)
//        print("\(player1.name): \(player1.characters)")
//
//
//
//    }
//
//
//
//    @IBAction func confirmPlayer2(_ sender: UIButton) {
//
//
//
//        let player2 = confirmPlayerChoice(playerName: "Player 2", charactersList: player2CharacterList)
//        print("\(player2.name): \(player2.characters)")
//
//
//
//    }
    
    
    @IBOutlet weak var StartGameButton: UIButton!
    
    
    
    @IBOutlet weak var player2CharacterList: CharacterListTextView!
    
    
    
    @IBOutlet weak var player1CharacterList: CharacterListTextView!
    
    
    
    
    
    //MARK: - Variables
    
    
    
    var player1IsReady : Bool = false
    
    var player2IsReady : Bool = false
    
    
    
    
    
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
    
    
    
    @objc func setPlayersWhoAreReady (_ sender: Notification) {
        
        if let dict = sender.userInfo as NSDictionary? {
            if let id = dict["Player 1"] as? Bool{
                player1IsReady = id
            }
            if let id = dict["Player 2"] as? Bool{
                player2IsReady = id
            }
        }
        if player1IsReady && player2IsReady {
            StartGameButton.isEnabled = true
        }
        else {
            StartGameButton.isEnabled = false
        }
    }
    

    
    //MARK: - viewDidLoad
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dismissKeyboardOutsideTextView()
        
        
//        Populate the empty character list for each players when the app starts
        player1CharacterList.displayAvailableCharacters(with: CharactersList())
        player1CharacterList.viewOwningPlayer = "Player 1"
        
        player2CharacterList.displayAvailableCharacters(with: CharactersList())
        player2CharacterList.viewOwningPlayer = "Player 2"
        
        
        
        
        //MARK: - Check if players are ready
        
        
        
        let listenPlayersForReadiness = Notification.Name(rawValue: "PlayerIsReady")
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(setPlayersWhoAreReady(_:)),
            name: listenPlayersForReadiness, object: nil)
        

        
       
        
    }
    
    
    
}
