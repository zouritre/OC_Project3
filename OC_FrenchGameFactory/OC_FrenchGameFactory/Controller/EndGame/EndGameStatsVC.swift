//
//  EndGameStatsVCViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 08/02/2022.
//

import UIKit

class EndGameStatsVC: UIViewController {
    
    var gameSessionStats = GameSession()
    
    
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    
    
    
    
    
    private func setupUI() {
        
        let winner = UILabel()
        winner.textAlignment = .center
        winner.text = "\(gameSessionStats.winner!) won the game!"
        
        let rounds = UILabel()
        rounds.text = "Rounds : \(gameSessionStats.actualRound)"
        
        mainStackView.addArrangedSubview(winner)
        mainStackView.addArrangedSubview(rounds)
        
        for player in gameSessionStats.players {
            
            
            let playerStats = UIStackView()
            playerStats.axis = .horizontal
            playerStats.distribution = .fillProportionally
            
            let playerName = UILabel()
            playerName.text = player.name
            
            playerStats.addArrangedSubview(playerName)
            
            let charactersStats = UIStackView()
            charactersStats.axis = .vertical
            charactersStats.distribution = .fillEqually
            
            
            for character in player.characters {
                
                let stats = UIStackView()
                stats.axis = .horizontal
                stats.alignment = .fill
                stats.distribution = .fillEqually
                
                let characterName = UILabel()
                characterName.textAlignment = .center
                characterName.text = character.customName
                
                stats.addArrangedSubview(characterName)
                
                let healthAndWeapon = UIStackView()
                healthAndWeapon.axis = .vertical
                healthAndWeapon.distribution = .fillEqually
                
                let health = UILabel()
                health.text = "Health: \(character.health)"
                
                let weapon = UILabel()
                weapon.text = "Weapon: \(character.weapon.damage)"
                
                healthAndWeapon.addArrangedSubview(health)
                healthAndWeapon.addArrangedSubview(weapon)
                
                stats.addArrangedSubview(healthAndWeapon)
                
                charactersStats.addArrangedSubview(stats)

            }
            
            
            playerStats.addArrangedSubview(charactersStats)
            
            mainStackView.addArrangedSubview(playerStats)
            
        }
        
        
    }
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupUI()
        
    }
    

}
