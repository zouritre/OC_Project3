//
//  UpdateCharactersStats.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 02/02/2022.
//

import Foundation
import UIKit


class UpdataCharactersStats {
    
    var player1Char1HP: UILabel!
    
    var player1Char1WeaponDamage: UILabel!
    
    var player1Char2HP: UILabel!
    
    var watchPlayer1Char1HP : Int {
        willSet{
            
        }
        didSet{
            player1Char1HP.text = "Health: \(watchPlayer1Char1HP - oldValue)"
        }
    }
    
    var watchPlayer1Char1WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player1Char1WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
    
    var watchPlayer1Char2HP : Int {
        get{
            return 1
        }
        set{
            player1Char2HP.text = "Health: \(newValue)"
        }
    }
    
    var watchPlayer1Char2WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player1Char2WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
    
    var watchPlayer1Char3HP : Int {
        get{
            return 1
        }
        set{
            player1Char3HP.text = "Health: \(newValue)"
        }
    }
    
    var watchPlayer1Char3WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player1Char3WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
    
    
    var watchPlayer2Char1HP : Int {
        get{
            return 1
        }
        set{
            player2Char1HP.text = "Health: \(newValue)"
        }
    }
    
    var watchPlayer2Char1WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player2Char1WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
    
    var watchPlayer2Char2HP : Int {
        get{
            return 1
        }
        set{
            player2Char2HP.text = "Health: \(newValue)"
        }
    }
    
    var watchPlayer2Char2WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player2Char2WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
    
    var watchPlayer2Char3HP : Int {
        get{
            return 1
        }
        set{
            player2Char3HP.text = "Health: \(newValue)"
        }
    }
    
    var watchPlayer2Char3WeaponDamage : Int {
        get{
            return 1
        }
        set{
            player2Char3WeaponDamage.text = "Weapon Damage: \(newValue)"
        }
    }
}
