//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 30/01/2022.
//

import UIKit


class CombatScreenVC: UIViewController {
    
    
    
    
    //MARK: - IBOutlets
    
    
    
    
    @IBOutlet weak var actualRound: UILabel!
    
    @IBOutlet weak var chestAvailable: UIButton!
    
    
    
    
    
    
    
    
    //MARK: - IBOutlets Player 1
    
    
    
    
    @IBOutlet weak var player1Char1WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player1Char1HP: CharactersHPLabel!
    @IBOutlet weak var player1Char1Button: CharactersButton!
    
    @IBOutlet weak var player1Char2WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player1Char2HP: CharactersHPLabel!
    @IBOutlet weak var player1Char2Button: CharactersButton!
    
    @IBOutlet weak var player1Char3WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player1Char3HP: CharactersHPLabel!
    @IBOutlet weak var player1Char3Button: CharactersButton!
    
    
    
    
    
    
    
    
    
    //MARK: - IBOutlets Player 2
    
    
    
    
    @IBOutlet weak var player2Char1WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player2Char1HP: CharactersHPLabel!
    @IBOutlet weak var player2Char1Button: CharactersButton!
    
    @IBOutlet weak var player2Char2WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player2Char2HP: CharactersHPLabel!
    @IBOutlet weak var player2Char2Button: CharactersButton!
    
    @IBOutlet weak var player2Char3WeaponDamage: CharactersWeaponDamageLabel!
    @IBOutlet weak var player2Char3HP: CharactersHPLabel!
    @IBOutlet weak var player2Char3Button: CharactersButton!
    
   
    
    
    
    
    

    
    //MARK: - Variables

    
    
    
///    Contains all informations about the current state of the game
    internal var gameSession = GameSession()
    
///  Sent to CharactersActionsPopoverVC to display the list of allies if the "Heal" button is pressed or the list of foes if "Attack" button is pressed depending of the selected character
    private var alliesAndFoes: [String:Player] = [:]
    
    private var characterWhoPlayThisRound = Character()
    
    private var characterWhoPlayThisRoundIndex : Int! {
        
        didSet{
            
            if characterWhoPlayThisRoundIndex > gameSession.players[0].characters.count-1 {
                characterWhoPlayThisRoundIndex = 0
                
            }
        }
    }

    
    
    
    
    
    
  
    
   //MARK: - Segue when Characters button pressed
    
    
    
    
    
///    Show CharactersActionsPopoverVC as popover/modal when a character is selected to perform an action
    @IBAction func showCharActions(_ sender: CharactersButton) {
        
        
        characterWhoPlayThisRound.UIelements.characterButton.backgroundColor = .orange
        
//        Store the currently selected character owning player and foe with their updated stats from gameSession variable to be later sent to CharactersActionsPopoverVC
        alliesAndFoes["Ally"] = gameSession.players.filter({$0.name == characterWhoPlayThisRound.owningPlayer.name})[0]
        
        
        alliesAndFoes["Foe"] = gameSession.players.filter({$0.name == characterWhoPlayThisRound.opponent.name})[0]
        
//        Show a popover wich display the available actions to perform by the selected character: Heal or Attack
        performSegue(withIdentifier: "selectCharActions", sender: self)
    
    
    }
    
    
    
    
    
    
    
    
     
    //MARK: - Setup UI with every player characters stats
    
    
    
/// Set combat screen UI elements to display player's characters stats at game start
    private func setupCharactersStats(){
        
        
        var player1Character1 : charactersStatsUIElements!
        
        var player1Character2 : charactersStatsUIElements!
        
        var player1Character3 : charactersStatsUIElements!
        
        var player2Character1 : charactersStatsUIElements!

        var player2Character2 : charactersStatsUIElements!

        var player2Character3 : charactersStatsUIElements!
        
        
        var player1UIElements : [charactersStatsUIElements] = []
        
        var player2UIElements : [charactersStatsUIElements] = []
        
        
//        Match every character with their corresponding UI elements and push them to an array respective to their owning player
        
        player1Character1 = charactersStatsUIElements(characterHPLabel: player1Char1HP, characterWeaponDamageLabel: player1Char1WeaponDamage, characterButton: player1Char1Button)
        
        player1UIElements.append(player1Character1)
        
        player1Character2 = charactersStatsUIElements(characterHPLabel: player1Char2HP, characterWeaponDamageLabel: player1Char2WeaponDamage, characterButton: player1Char2Button)
        
        player1UIElements.append(player1Character2)
        
        player1Character3 = charactersStatsUIElements(characterHPLabel: player1Char3HP, characterWeaponDamageLabel: player1Char3WeaponDamage, characterButton: player1Char3Button)
        
        player1UIElements.append(player1Character3)
        
        
        setUIelementsToCharacters(for: gameSession.players[0], UIelements: player1UIElements)

        
        
        
        player2Character1 = charactersStatsUIElements(characterHPLabel: player2Char1HP, characterWeaponDamageLabel: player2Char1WeaponDamage, characterButton: player2Char1Button)
        
        player2UIElements.append(player2Character1)
        
        player2Character2 = charactersStatsUIElements(characterHPLabel: player2Char2HP, characterWeaponDamageLabel: player2Char2WeaponDamage, characterButton: player2Char2Button)
        
        player2UIElements.append(player2Character2)
        
        player2Character3 = charactersStatsUIElements(characterHPLabel: player2Char3HP, characterWeaponDamageLabel: player2Char3WeaponDamage, characterButton: player2Char3Button)
        
        player2UIElements.append(player2Character3)
        
        
        setUIelementsToCharacters(for: gameSession.players[1], UIelements: player2UIElements)
        
//        store the central bar views in Game Session
        let gameSessionUIelements = GameSessionUIelements(actualRound: actualRound, chestAvailable: chestAvailable)
        
        gameSession.uiElements = gameSessionUIelements
        
        
    }
    
///     Set every Character object
    private func setUIelementsToCharacters(for player: Player, UIelements: [charactersStatsUIElements]) {
        
        for (index, _) in player.characters.enumerated() {
            
//            for each UI elements characterButton in the array define their correspondingCharacter variable before pushing them to the character UIelements variable
            UIelements[index].characterButton.correspondingCharacter = player.characters[index]

            player.characters[index].UIelements = UIelements[index]
        }
        
    }
    
    
//    When a character is selected as a target from the CharactersActionsPopoverVC update the target UI elements depending of the action taken
    @objc func updateTargettedCharacterUIs(_ sender: Notification){


        if let dict = sender.userInfo as NSDictionary? {


            if let target = dict["target"] as? Character{
                
//                Dismiss the popover after a target have been selected from CharactersActionsPopoverVC
                dismiss(animated: true, completion: nil)
                
                
                if target.owningPlayer.name == characterWhoPlayThisRound.owningPlayer.name {
                    
                    
                    makeDesiredAction(to: target, action: "Heal")

                    
                }
                
                else {
                    
                    
                    makeDesiredAction(to: target, action: "Attack")
                    
                    
                }
                

            }


        }
        
        
    }
    
    /// Update the targetted character health UI depending on the action chosen by the player and check if game is finished
    private func makeDesiredAction(to target: Character, action: String) {
        
        
        let getTargetOwningPlayerFromGameSession = gameSession.players.filter({$0.name == target.owningPlayer.name})
        let getTargetCharacterFromGameSession = getTargetOwningPlayerFromGameSession[0].characters.filter({$0.customName == target.customName})[0]
        
        
        switch action {
            
        case "Heal": getTargetCharacterFromGameSession.health += characterWhoPlayThisRound.weapon.damage
            
        case "Attack": getTargetCharacterFromGameSession.health -= characterWhoPlayThisRound.weapon.damage
            
        default: return
            
        }
        
        
        if getTargetCharacterFromGameSession.health <= 0 {
            
//            Prevent the health UI to display negative numbers
            getTargetCharacterFromGameSession.health = 0
            
            getTargetCharacterFromGameSession.UIelements.characterButton.backgroundColor = .red
            
            
        }
        
        
        characterWhoPlayThisRound.UIelements.characterButton.isEnabled = false
        characterWhoPlayThisRound.UIelements.characterButton.backgroundColor = .systemGray
        
        checkIfGameIsFinish()
        
        if gameSession.isFinished {
            
            print("Game Over!")
            
        }
        
        else {
            
            gameSession.actualRound += 1
            
            setNextCharacterToPlay()
            
        }
        
    }
    

    private func checkIfGameIsFinish () {
        
        
        switch characterWhoPlayThisRound.owningPlayer.name {
            
        case gameSession.players[0].name: checkIfAllCharactersAreDead(for: gameSession.players[1])
            
            
        case gameSession.players[1].name: checkIfAllCharactersAreDead(for: gameSession.players[0])
            
            
        default: return
            
        }
        
    }
    
    
    private func checkIfAllCharactersAreDead(for player: Player){
        
        
        let getAllCharactersAlive = player.characters.filter({$0.health > 0})
        
        gameSession.isFinished = (getAllCharactersAlive.count == 0) ? true : false
    }
    
    
    
    private func setNextCharacterToPlay () {
        
        characterWhoPlayThisRoundIndex! += 1
        
        switch characterWhoPlayThisRound.owningPlayer.name {
            
        case gameSession.players[0].name:
            
            enableUIsForNextCharacterToPlay(for: gameSession.players[1])
            
        case gameSession.players[1].name:
            
            enableUIsForNextCharacterToPlay(for: gameSession.players[0])
            
        default: return
            
        }
    }
    
    
    func enableUIsForNextCharacterToPlay(for player: Player) {
        
        if player.characters[characterWhoPlayThisRoundIndex!].health == 0 {
            
//            Skip this character, not enabling his button on the UI, if the character is dead
            characterWhoPlayThisRound = player.characters[characterWhoPlayThisRoundIndex!]
            
            setNextCharacterToPlay()
            
        }
        
        else {
            
//            Enable the character UI if he's still alive (health > 0 )
            player.characters[characterWhoPlayThisRoundIndex!].UIelements.characterButton.isEnabled = true
            player.characters[characterWhoPlayThisRoundIndex!].UIelements.characterButton.backgroundColor = .systemBlue
            
            characterWhoPlayThisRound = player.characters[characterWhoPlayThisRoundIndex!]
            
        }
    
    }
    
    
/// Select a random player character to start the first round
    private func setFirstPlayerToStartPlaying(){
        
        let getRandomPlayer: Player = gameSession.players.randomElement()!
        
        let getRandomCharacterIndex = getRandomPlayer.characters.indices.randomElement()
        
        getRandomPlayer.characters[getRandomCharacterIndex!].UIelements.characterButton.isEnabled = true
        getRandomPlayer.characters[getRandomCharacterIndex!].UIelements.characterButton.backgroundColor =  .systemBlue
        
        characterWhoPlayThisRound = getRandomPlayer.characters[getRandomCharacterIndex!]
        characterWhoPlayThisRoundIndex = getRandomCharacterIndex!
        
    }
    
    
    //MARK: - View Did Load
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
//        When the combat screen appear, populate the UI with the selected player's characters stats
        setupCharactersStats()
        
        setFirstPlayerToStartPlaying()
        
        gameSession.actualRound += 1
        
        
//        Listen for notifications from the CharactersActionsPopoverVC
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateTargettedCharacterUIs(_:)),
            name: Notification.Name("targettedCharacter"), object: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        if segue.destination is CharactersActionsPopoverVC {
            
            
            let vc = segue.destination as? CharactersActionsPopoverVC
                
            vc?.alliesAndFoes = alliesAndFoes
        
        
        }
        
        
    }
    

}
