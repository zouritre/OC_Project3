//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    class GameSession{
        init(){
        }
    }
    var sessionStarted = GameSession()
    class Characters{
        var name : String
        var health: Int
        var weapon: Weapon
        var ability: String
        init(name : String, health: Int, weapon: Weapon, ability: String){
            self.name = name
            self.health = health
            self.weapon = weapon
            self.ability = ability
        }
    }
    class Weapon{
        
    }


}
