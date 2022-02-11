//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    
    
    
    
    
    
    
    
        //MARK: - IBOutlets
    
    
    
    
//    "Fight!" button
    @IBAction func StartGame(_ sender: UIButton) {
        
        
//        Verify if players chosen characters custom names are not empty and not duplicated
        if verifyCustomNamesValidity(for: player1CharacterList, and: player2CharacterList) {
            
//            if the custom names respect the correct pattern then create a player object for each players with their chosen characters
            
            player1 = confirmPlayersChoices(playerName: "Player 1", charactersList: player1CharacterList)
            
            player2 = confirmPlayersChoices(playerName: "Player 2", charactersList: player2CharacterList)
            
            setAllyAndOpponent(for: player1, opponent: player2)
            setAllyAndOpponent(for: player2, opponent: player1)
            
            performSegue(withIdentifier: "goToCombatScreen", sender: self)
            
            
        }
        
        
        else {
            
//            If an error occurred during character selection reset the array containing every custom names chosen by players to avoid infinite appending everytime they click on "Fight!" button
            
            charactersCustomName.removeAll()
            
            
        }
        
        
    }
    
    
    @IBOutlet weak var StartGameButton: UIButton!
    
    @IBOutlet weak var player2CharacterList: CharacterListStackView!
    
    @IBOutlet weak var player1CharacterList: CharacterListStackView!
    
    
    
    
    
    
    
    
    
    //MARK: - Variables
    
    
    
    
    var player1 : Player = Player(name: "", characters: [])
    
    var player2: Player = Player(name: "", characters: [])
    
    var player1IsReady : Bool = false
    
    var player2IsReady : Bool = false
    
    let listenNotificationForPlayersReadiness = Notification.Name(rawValue: "PlayerIsReady")
    
//    Store every custom names chosen by players for their characters to check for duplicates
    var charactersCustomName : [String] = []
    
    var foundDuplicate : Bool = false
    
    
    
    
    
    
    
    //MARK: - Check Players Characters Informations
    
    
    
    
    /// Return a player object with a custom player name and a custom list of characters they chose
    /// - Parameters:
    ///   - playerName: Player's name on wich to add the characters from specified CharacterListStackView
    ///   - charactersList: A custom StackView containing all the characters selected by a player
    /// - Returns: A player object in wich character variable of his instance is populated by the characters list specified in CharacterListStackView
    private func confirmPlayersChoices(playerName: String, charactersList: CharacterListStackView) -> Player {
        
        
        var player = Player(name: playerName, characters: [])
        
        
        for (customNameTextView, character) in charactersList.chosenCharacters{
            
            
            let character = character
            
            character.customName = customNameTextView.text
             
            player.characters.append(character)
            
            
        }
        
        
        return player
        
        
    }
    
    
    /// Match each chosen character with their owning player and opponent for processing in combat screen
    /// - Parameters:
    ///   - player: Player who owns the character
    ///   - opponent: Player foe of the character
    private func setAllyAndOpponent(for player: Player, opponent: Player) {
        
        
        for character in player.characters {
            
            
            character.owningPlayer = player
            character.opponent = opponent
            
            
        }
        
        
    }
    
    
    /// Append the custom characters name of a character list in the charactersCustomNames array
    /// - Parameter playerCharacterList: A custom StackView object wich contains the characters chosen by a player
    private func getPlayerCharactersCustomNames(for playerCharacterList: CharacterListStackView){
        
        
        for (customNameTextView, _) in playerCharacterList.chosenCharacters{
            
            
            charactersCustomName.append(customNameTextView.text)
            
            
        }
        
        
    }
    
    
    
    /// Check if there are duplicate names among the player's custom names they chose for their characters
    /// - Parameters:
    ///   - player1CharacterList: The custom StackView containing player1's chosen characters
    ///   - player2CharacterList: The custom StackView containing player2's chosen characters
    /// - Returns: True if a duplicate name has been found after comparing the two players's  list of characters
    private func foundDuplicateCustomNames(compare player1CharacterList: CharacterListStackView, with player2CharacterList: CharacterListStackView) -> Bool{
        
        
        findDuplicates(for: player1CharacterList)
        findDuplicates(for: player2CharacterList)
        
        
        return foundDuplicate
        
        
    }
    
    
    /// Compare the custom names of a character list with those store in the charactersCustomNames array and find if it appears at least 2 times
    /// - Parameter playerCharacterList: A custom StackView containing a list of a player's chosen characters
    func findDuplicates(for playerCharacterList: CharacterListStackView){
        
        
        for (customNameTextView, _) in playerCharacterList.chosenCharacters{
            
            
//                Create a mock array of charactersCustomName to preserve it's original state wich is needed for other processings
            var copyOfDuplicateNames = charactersCustomName
            
//                Get the first index of copyOfDuplicateNames where the actual custom name customNameTextView.text appear
            let customNameOriginalAppearance = copyOfDuplicateNames.firstIndex(of: customNameTextView.text)
            
//                Delete the first element corresponding to the actual customNameTextView.text
            copyOfDuplicateNames.remove(at: customNameOriginalAppearance!)
            
            
//                Check if a second element matching customNameTextView.text is present (duplicate)
            if copyOfDuplicateNames.first(where: { $0 == customNameTextView.text}) != nil {
                
                
                foundDuplicate = true
                
                customNameTextView.backgroundColor = .red
                customNameTextView.textColor = .white
                
                
            }
            
            
            else {
                
                
//                    Check passed successfully
                
                customNameTextView.backgroundColor = .tintColor
                customNameTextView.textColor = .white
                
                
            }
            
            
        }
        
        
    }
    
    
    /// Check if custom names are at least 1 character long. If it's not, set the custom name textView background color to red

    /// - Parameter player: A custom StackView representing a player's list of chosen characters
    /// - Returns: True if the custom name given to a character is empty
    func foundIncorrectFormatingInCustomNames(for player: CharacterListStackView) -> Bool{
        

        var incorrectFormating : Bool = false
        
        
        for (customNameTextView, _) in player.chosenCharacters{
            
            
            if customNameTextView.text.count < 1 {
                
                
                incorrectFormating = true
                
                customNameTextView.backgroundColor = .red
                customNameTextView.textColor = .white
                
                
            }
            
            
            else {
                
                
                customNameTextView.backgroundColor = .white
                customNameTextView.textColor = .black
                
                
            }
            
            
        }
        
        
        return incorrectFormating
        
        
    }
    
    
    /// Perform a full check of each players's characters custom names formatting. Send true if all check have passed successfully
    /// - Parameters:
    ///   - player1: A custom StackView containing a list of a payer's chosen characters
    ///   - player2: A custom StackView containing a list of a payer's chosen characters
    /// - Returns: True if the name formatting is correct
    func verifyCustomNamesValidity(for player1: CharacterListStackView, and player2: CharacterListStackView) -> Bool {
        
        
        var correctNames: Bool = true
        
        getPlayerCharactersCustomNames(for: player1)
        getPlayerCharactersCustomNames(for: player2)
        
        let foundIncorrectFormatingForPlayer1CustomNames = foundIncorrectFormatingInCustomNames(for: player1)
        
        let foundIncorrectFormatingForPlayer2CustomNames = foundIncorrectFormatingInCustomNames(for: player2)
        
        
        if foundIncorrectFormatingForPlayer1CustomNames || foundIncorrectFormatingForPlayer2CustomNames{
            
            
            correctNames = false
            
            alert(title: "Empty names detected")
            
            
        }
        
        
        else {
            
            
            let foundDuplicateCustomNames = foundDuplicateCustomNames(compare: player1, with: player2)
            
            
            if foundDuplicateCustomNames {
                
                
                correctNames = false
                
                alert(title: "Duplicated names detected")
                
                
            }
            
            
        }
        
        
        return correctNames
        
        
    }
    
    
    /// Create a simple alert with a dynamic title

    /// - Parameter title: A custom title for the alert
    func alert(title: String) {
        
        
        let alert = UIAlertController(title: title, message: "They have been marked in red", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Notification Receiver
    
    
    
    
    /// If each players have selected exactly 3 characters, enable the "Fight!" button, otherwise disable the button.

    @objc func setPlayersWhoAreReady (_ sender: Notification) {
        
        
        if let dict = sender.userInfo as NSDictionary? {
            
            
            if let ready = dict["Player 1"] as? Bool{
                
                
                player1IsReady = ready
                
                
            }
            
            
            if let ready = dict["Player 2"] as? Bool{
                
                
                player2IsReady = ready
                
                
            }
            
            
        }
        
        
        if player1IsReady && player2IsReady {
            
            
            StartGameButton.isEnabled = true
            
            
        }
        
        
        else {
            
            
            StartGameButton.isEnabled = false
        
        
        }
        
        
    }
    
    

    


    
    
    
    //MARK: - Dismiss Keyboard Outside TextViews
    
    
    
    
    /// Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        
        
//        Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
        
    }
    
    
    /// Hide keyboard when clicking outside textViews to avoid UI freeze when  trying to interact with other elements
    func dismissKeyboardOutsideTextView(){
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not to interfere and cancel other interactions.
        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        
    }
    
    
    //MARK: - viewDidLoad
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        Prevent UI freeze when TextViews are focused
        dismissKeyboardOutsideTextView()
        
        
//        Populate the empty character list StackView for each players when the app starts
        player1CharacterList.displayAvailableCharacters(with: CharactersList())
        player1CharacterList.viewOwningPlayer = "Player 1"
        
        player2CharacterList.displayAvailableCharacters(with: CharactersList())
        player2CharacterList.viewOwningPlayer = "Player 2"
        
        
        
        
        
        
        
        
        
        //MARK: - Observe when players are ready
        
        
        
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(setPlayersWhoAreReady(_:)),
            name: listenNotificationForPlayersReadiness, object: nil)
        

        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        if segue.destination is CombatScreenVC {
            
            
            let vc = segue.destination as? CombatScreenVC
                
            vc?.gameSession.players = [player1, player2]
        
        
        }
        
        
    }
    
}
