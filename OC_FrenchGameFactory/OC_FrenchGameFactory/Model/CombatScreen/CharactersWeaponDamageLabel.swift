//
//  CharactersWeaponDamageLabel.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 04/02/2022.
//

import UIKit

class CharactersWeaponDamageLabel: UILabel {


    
    var weaponDamage = 0 {
        
        willSet{
            text = "Weapon: \(newValue)"
        }
    }

}
