//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 30/01/2022.
//

import UIKit


class CombatScreenVC: UIViewController {
    
    
    
    
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
    internal var gameSession = GameSession(players: [])
    
///  Sent to CharactersActionsPopoverVC to display the list of allies if the "Heal" button is pressed or the list of foes if "Attack" button is pressed depending of the selected character
    private var alliesAndFoes: [String:Player] = [:]
    
///    Apply this value on targetted character Health depending if "Heal" button is pressed (perform addition for healing) or "Attack" button is pressed (perform substraction)
    private var selectedCharacter = Character()
    
    private var selectedCharacterButton = CharactersButton()
    
//    Below variables contains match every character of each players with his corresponding UI elements
    
    private var player1Character1 : charactersStatsUIElements!
    
    private var player1Character2 : charactersStatsUIElements!
    
    private var player1Character3 : charactersStatsUIElements!
    
    private var player2Character1 : charactersStatsUIElements!

    private var player2Character2 : charactersStatsUIElements!

    private var player2Character3 : charactersStatsUIElements!
    
//    Match very characters corresponding UI elements to their respective owning player to be processed at at game start in setupCharactersStats()
    private var player1UIElements : [charactersStatsUIElements] = []
    
    private var player2UIElements : [charactersStatsUIElements] = []

    
    
    
    
    
    
  
    
   //MARK: - Segue when Characters button pressed
    
    
    
    
    
///    Show CharactersActionsPopoverVC as popover/modal when a character is selected to perform an action
    @IBAction func showCharActions(_ sender: CharactersButton) {
        
        selectedCharacterButton = sender
        
        sender.backgroundColor = .orange
        
        selectedCharacter = sender.correspondingCharacter
        
        alliesAndFoes["Ally"] = selectedCharacter.owningPlayer
        
        alliesAndFoes["Foe"] = selectedCharacter.opponent
        
        performSegue(withIdentifier: "selectCharActions", sender: self)
    
    
    
    }
    
    
    
    
    
    
    
    
     
    //MARK: - Setup UI with every player characters stats
    
    
    

    private func setupCharactersStats(){
        
        
        
//        Match every character with their corresponding UI elements and push them to an array respective to their owning player
        
        player1Character1 = charactersStatsUIElements(characterHPLabel: player1Char1HP, chararacterWeaponDamageLabel: player1Char1WeaponDamage, characterButton: player1Char1Button)
        
        player1UIElements.append(player1Character1)
        
        player1Character2 = charactersStatsUIElements(characterHPLabel: player1Char2HP, chararacterWeaponDamageLabel: player1Char2WeaponDamage, characterButton: player1Char2Button)
        
        player1UIElements.append(player1Character2)
        
        player1Character3 = charactersStatsUIElements(characterHPLabel: player1Char3HP, chararacterWeaponDamageLabel: player1Char3WeaponDamage, characterButton: player1Char3Button)
        
        player1UIElements.append(player1Character3)
        
        
        
        player2Character1 = charactersStatsUIElements(characterHPLabel: player2Char1HP, chararacterWeaponDamageLabel: player2Char1WeaponDamage, characterButton: player2Char1Button)
        
        player2UIElements.append(player2Character1)
        
        player2Character2 = charactersStatsUIElements(characterHPLabel: player2Char2HP, chararacterWeaponDamageLabel: player2Char2WeaponDamage, characterButton: player2Char2Button)
        
        player2UIElements.append(player2Character2)
        
        player2Character3 = charactersStatsUIElements(characterHPLabel: player2Char3HP, chararacterWeaponDamageLabel: player2Char3WeaponDamage, characterButton: player2Char3Button)
        
        player2UIElements.append(player2Character3)
        
        
        
        for player in gameSession.players {
            
            
            
            if player.name == "Player 1" {
                
                
                
                setLabelValues(playerUIElements: player1UIElements, player: player)
                
                
                
            }
            
                
                
            else if player.name == "Player 2" {
                
                
                
                setLabelValues(playerUIElements: player2UIElements, player: player)
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
    
    private func setLabelValues (playerUIElements: [charactersStatsUIElements], player: Player) {
        
        
        
        for (index, character) in player.characters.enumerated() {
            
            
            
            playerUIElements[index].characterButton.correspondingCharacter = character
            playerUIElements[index].characterHPLabel.hp = character.health
            playerUIElements[index].chararacterWeaponDamageLabel.weaponDamage = character.weapon.damage
                
                
        
        }
        
        
    }
    
    
    
    @objc func updateTargettedCharacterUIs(_ sender: Notification){


        if let dict = sender.userInfo as NSDictionary? {



            if let target = dict["target"] as? Character{

                
                selectedCharacterButton.backgroundColor = .systemBlue
                
                print("Targetted Character: \(target.customName)")
                
                dismiss(animated: true, completion: nil)



            }


        }
        
        
    }
    
    
    
    
    
    //MARK: - View Did Load
    
    
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        setupCharactersStats()
        
        
        NotificationCenter.default.addObserver(
            
            self, selector: #selector(updateTargettedCharacterUIs(_:)),
            
            name: Notification.Name("targettedCharacter"), object: nil)
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        
        if segue.destination is CharactersActionsPopoverVC {
            
            
            
            let vc = segue.destination as? CharactersActionsPopoverVC
            
//            print("Allies: \(alliesAndFoes["Ally"]!)")
//            print("Foes: \(alliesAndFoes["Foe"]!)")
                
            vc?.alliesAndFoes = alliesAndFoes
        
        
        
        }
        
        
        
    }
    
    

}
