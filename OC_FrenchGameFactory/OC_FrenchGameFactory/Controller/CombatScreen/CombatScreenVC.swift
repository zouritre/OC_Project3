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
    @IBOutlet weak var player2Char3Button: UILabel!
    
    
    
    
    
    
    
    
    
    //MARK: - Variables

    
    
    
    var gameSession = GameSession(players: [])
    
    
    
    
    
    
    
    
    
    //MARK: - View Did Load
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        print(gameSession)
    }
    

}
