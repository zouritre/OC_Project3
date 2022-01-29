//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    
    
    
    
    //MARK: - IBOutlets
    
    
    @IBAction func StartGame(_ sender: UIButton) {
        
        if verifyCustomNamesValidity(for: player1CharacterList, and: player2CharacterList) {
            
            let player1 = confirmPlayersChoices(playerName: "Player 1", charactersList: player1CharacterList)
            print("\(player1.name): \(player1.characters)")
            let player2 = confirmPlayersChoices(playerName: "Player 2", charactersList: player2CharacterList)
            print("\(player2.name): \(player2.characters)")
        }
        else {
            
            duplicateNames.removeAll()
        }
        
        
    }
    
    
    
    @IBOutlet weak var StartGameButton: UIButton!
    
    
    
    @IBOutlet weak var player2CharacterList: CharacterListTextView!
    
    
    
    @IBOutlet weak var player1CharacterList: CharacterListTextView!
    
    
    
    
    
    //MARK: - Variables
    
    
    
    var player1IsReady : Bool = false
    
    var player2IsReady : Bool = false
    
    var duplicateNames : [String] = []
    
    
    
    
    
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
    
    
    
    
    
    //MARK: - Check Players Characters Informations
    
    
    
    func confirmPlayersChoices(playerName: String, charactersList: CharacterListTextView) -> Player {
        
        
        
        var player = Player(name: playerName, characters: [])
        
        for (customName, character) in charactersList.chosenCharacters{
            
            var character = character
            
            character.customName = customName.text
            player.characters.append(character)
        }
        
        return player
        
        
        
    }
    
    
    
    func getPlayerCharactersCustomNames(listOf player: CharacterListTextView){
        
        
        
        for (customName, _) in player.chosenCharacters{
            
            
            
            duplicateNames.append(customName.text)
            
            
            
        }
        
        
        
    }
    
    
    func foundDuplicateCustomNames (compare player1: CharacterListTextView, with player2: CharacterListTextView) -> Bool{
        
        
        var foundDuplicate : Bool = false
        
        func findDuplicates (in listOf: CharacterListTextView){
            
            for (playerCustomName, _) in listOf.chosenCharacters{
                
                var copyOfDuplicateNames = duplicateNames
                
                let customNameFirstAppearance = copyOfDuplicateNames.firstIndex(of: playerCustomName.text)
                
                copyOfDuplicateNames.remove(at: customNameFirstAppearance!)
                
                if copyOfDuplicateNames.first(where: { $0 == playerCustomName.text}) != nil {
                    foundDuplicate = true
                    playerCustomName.backgroundColor = .red
                    playerCustomName.textColor = .white
                    print("found duplicate")
                }
                else {
                    playerCustomName.backgroundColor = .tintColor
                    playerCustomName.textColor = .white
                    print("no duplicate found")
                }
            }
            
        }
        
        findDuplicates(in: player1)
        findDuplicates(in: player2)
        
        return foundDuplicate
    }
    
    
    
    func foundIncorrectFormatingForCustomNames(for player: CharacterListTextView) -> Bool{

        var incorrectFormating : Bool = false
        for (customName, _) in player.chosenCharacters{
            if customName.text.count < 1 {
                incorrectFormating = true
                customName.backgroundColor = .red
                print("incorrect format")
            }
            else {
                customName.backgroundColor = .white
                print("correct format")
            }
        }
        
        
        
        return incorrectFormating
        
        
        
    }
    
    
    
    
    func verifyCustomNamesValidity(for player1: CharacterListTextView, and player2: CharacterListTextView) -> Bool {
        
        
        
        var correctNames: Bool = true
        
        getPlayerCharactersCustomNames(listOf: player1)
        getPlayerCharactersCustomNames(listOf: player2)
        
        print(duplicateNames)
        
        let foundIncorrectFormatingForPlayer1CustomNames = foundIncorrectFormatingForCustomNames(for: player1)
        
        let foundIncorrectFormatingForPlayer2CustomNames = foundIncorrectFormatingForCustomNames(for: player2)
        
        
        
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
    
    
    
    func alert(title: String) {
        
        
        
        let alert = UIAlertController(title: title, message: "They have been marked in red", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    //MARK: - Notification Receiver
    
    
    
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
