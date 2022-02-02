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
    
    @IBOutlet weak var player2Char2WeaponDamage: UILabel!
    @IBOutlet weak var player2Char2HP: UILabel!
    
    @IBOutlet weak var player2Char3WeaponDamage: UILabel!
    @IBOutlet weak var player2Char3HP: UILabel!
    
    
   
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
    
    
    
    
    
    
    
    
    //MARK: - View Did Load
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var watchPlayer1Char1HP : Int {
            get{
                return 1
            }
            set{
                player1Char1HP.text = "Health: \(newValue)"
            }
        }
        
        watchPlayer1Char1HP = 1
        print(gameSession)
        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        
        if segue.destination is CombatScreenVC {
            
            
            
            let vc = segue.destination as? CombatScreenVC
                
            vc?.alliesAndFoes = alliesAndFoes
        
        
        
        }
        
        
        
    }
    
    

}
