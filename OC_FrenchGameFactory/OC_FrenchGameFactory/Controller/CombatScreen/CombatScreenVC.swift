//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 30/01/2022.
//

import UIKit


class CombatScreenVC: UIViewController {
    
    
    
    
    //MARK: - IBOutlets Player 1
    
    
    
    
    @IBOutlet weak var player1Char1WeaponDamage: UILabel!
    @IBOutlet weak var player1Char1HP: UILabel!
    @IBOutlet weak var player1Char1Button: UIButton!
    
    @IBOutlet weak var player1Char2WeaponDamage: UILabel!
    @IBOutlet weak var player1Char2HP: UILabel!
    @IBOutlet weak var player1Char2Button: UIButton!
    
    @IBOutlet weak var player1Char3WeaponDamage: UILabel!
    @IBOutlet weak var player1Char3HP: UILabel!
    @IBOutlet weak var player1Char3Button: UIButton!
    
    
    
    
    
    
    
    
    
    //MARK: - IBOutlets Player 2
    
    
    
    
    @IBOutlet weak var player2Char1WeaponDamage: UILabel!
    @IBOutlet weak var player2Char1HP: UILabel!
    @IBOutlet weak var player2Char1Button: UIButton!
    
    @IBOutlet weak var player2Char2WeaponDamage: UILabel!
    @IBOutlet weak var player2Char2HP: UILabel!
    @IBOutlet weak var player2Char2Button: UIButton!
    
    @IBOutlet weak var player2Char3WeaponDamage: UILabel!
    @IBOutlet weak var player2Char3HP: UILabel!
    @IBOutlet weak var player2Char3Button: UIButton!
    
   
    
    
    
    
    

    
    //MARK: - Variables

    
    
    
///    Contains all informations about the current state of the game
    var gameSession = GameSession(players: [])
    
///  Sent to CharactersActionsPopoverVC to display the list of allies if the "Heal" button is pressed or the list of foes if "Attack" button is pressed depending of the selected character
    var alliesAndFoes: [String:Player] = [:]
    
///    Apply this value on targetted character Health depending if "Heal" button is pressed (perform addition for healing) or "Attack" button is pressed (perform substraction)
    var selectedAllyWeaponDamage: Int = 0
    
    var selectedAllyOwningPlayer: Player = Player(name: "", characters: [])
    
//    Below variables contains match every character of each players with his corresponding UI elements
    
    var player1Character1 : UpdateCharactersStats!
    
    var player1Character2 : UpdateCharactersStats!
    
    var player1Character3 : UpdateCharactersStats!
    
    var player2Character1 : UpdateCharactersStats!

    var player2Character2 : UpdateCharactersStats!

    var player2Character3 : UpdateCharactersStats!
    
//    Match very characters corresponding UI elements to their respective owning player to be processed at at game start in setupCharactersStats()
    var player1UIElements : [UpdateCharactersStats] = []
    
    var player2UIElements : [UpdateCharactersStats] = []

    
    
    
    
    
    
  
    
   //MARK: - Characters button pressed
    
    
    
    
    
//    Show CharactersActionsPopoverVC as popover/modal when a character is selected to perform an action
    @IBAction func showCharActions(_ sender: UIButton) {
        
        
        
        getCharacterOwningPlayer(name: sender.currentTitle!)
        
        performSegue(withIdentifier: "selectCharActions", sender: self)
    
    
    
    }
    
    
///    When a character is selected to perform an action, get his owning (ally) player and his opponent player (foe) and store it in alliesAndFoes variable
    func getCharacterOwningPlayer(name: String){
        
        
        
        var foundAlly = false
        
        
        
        for player in gameSession.players {
        
            
            
            if foundAlly {
            
                
                
                alliesAndFoes["Foe"] = player
                
                
                
            }
            
            
            
            for character in player.characters {
            
                
                
                if character.customName == name {
                
                    
                    
                    alliesAndFoes["Ally"] = player
                    
                    foundAlly = true
                    selectedAllyWeaponDamage = character.weapon.damage
                    selectedAllyOwningPlayer = player
                    
                    break
                
                
                
                }
                
                
                
            }
            
            
            
            if foundAlly == false {
            
                
                
                alliesAndFoes["Foe"] = player
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
     
    //MARK: - Setup UI with every player characters stats
    
    
    

    func setupCharactersStats(){
        
        
        
        func setLabelValues (playerUIElements: [UpdateCharactersStats], player: Player) {
            
            
            
            for (index, character) in player.characters.enumerated() {
                
                
                
                playerUIElements[index].characterButton.setTitle(character.customName, for: .normal)
                playerUIElements[index].characterHPLabel.text = "Health: \(character.health)"
                playerUIElements[index].chararacterWeaponDamageLabel.text = "Weapon: \(character.weapon.damage)"
                    
                    
            
            }
            
            
        }
        
        
//        Match every character with their corresponding UI elements and push them to an array respective to their owning player
        
        player1Character1 = UpdateCharactersStats(characterHPLabel: player1Char1HP, chararacterWeaponDamageLabel: player1Char1WeaponDamage, characterButton: player1Char1Button)
        
        player1UIElements.append(player1Character1)
        
        player1Character2 = UpdateCharactersStats(characterHPLabel: player1Char2HP, chararacterWeaponDamageLabel: player1Char2WeaponDamage, characterButton: player1Char2Button)
        
        player1UIElements.append(player1Character2)
        
        player1Character3 = UpdateCharactersStats(characterHPLabel: player1Char3HP, chararacterWeaponDamageLabel: player1Char3WeaponDamage, characterButton: player1Char3Button)
        
        player1UIElements.append(player1Character3)
        
        
        
        player2Character1 = UpdateCharactersStats(characterHPLabel: player2Char1HP, chararacterWeaponDamageLabel: player2Char1WeaponDamage, characterButton: player2Char1Button)
        
        player2UIElements.append(player2Character1)
        
        player2Character2 = UpdateCharactersStats(characterHPLabel: player2Char2HP, chararacterWeaponDamageLabel: player2Char2WeaponDamage, characterButton: player2Char2Button)
        
        player2UIElements.append(player2Character2)
        
        player2Character3 = UpdateCharactersStats(characterHPLabel: player2Char3HP, chararacterWeaponDamageLabel: player2Char3WeaponDamage, characterButton: player2Char3Button)
        
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
    
    
    
    
    
    
    
    
    
    //MARK: - View Did Load
    
    
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        
        
        setupCharactersStats()
        
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
