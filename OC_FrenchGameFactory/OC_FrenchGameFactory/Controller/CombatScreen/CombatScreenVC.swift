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
    
    @IBOutlet weak var player1Char2WeaponDamage: UILabel!
    @IBOutlet weak var player1Char2HP: UILabel!
    
    @IBOutlet weak var player1Char3WeaponDamage: UILabel!
    @IBOutlet weak var player1Char3HP: UILabel!
    
    
    
    
    
    
    
    
    
    //MARK: - IBOutlets Player 2
    
    
    
    
    @IBOutlet weak var player2Char1WeaponDamage: UILabel!
    @IBOutlet weak var player2Char1HP: UILabel!
    
    @IBOutlet weak var player2Char2WeaponDamage: UILabel!
    @IBOutlet weak var player2Char2HP: UILabel!
    
    @IBOutlet weak var player2Char3WeaponDamage: UILabel!
    @IBOutlet weak var player2Char3HP: UILabel!
    
   
    
    
    
    
    
    
    
   //MARK: - Show action on Character button pressed
    
    
    
    
    @IBAction func showCharActions(_ sender: UIButton) {
        
        
        
        getCharacterOwningPlayer(name: sender.currentTitle!)
        
        performSegue(withIdentifier: "selectCharActions", sender: self)
    
    
    
    }
    
    
    
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
    
    
    
    
    
    
    
    
    
    //MARK: - Variables

    
    
    
    var gameSession = GameSession(players: [])
    
    var alliesAndFoes: [String:Player] = [:]
    
    var selectedAllyWeaponDamage: Int = 0
    
    var selectedAllyOwningPlayer: Player = Player(name: "", characters: [])
    
    
    
    
    
    
    
    
    //MARK: - Setup UI with selected characters stats
    
    
    
    
    func setupCharactersStats(){
        
    }
    
    
    //MARK: - View Did Load
    
    
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        
        if segue.destination is CharactersActionsPopoverVC {
            
            
            
            let vc = segue.destination as? CharactersActionsPopoverVC
            
            print("Allies: \(alliesAndFoes["Ally"]!)")
            print("Foes: \(alliesAndFoes["Foe"]!)")
                
            vc?.alliesAndFoes = alliesAndFoes
        
        
        
        }
        
        
        
    }
    
    

}
