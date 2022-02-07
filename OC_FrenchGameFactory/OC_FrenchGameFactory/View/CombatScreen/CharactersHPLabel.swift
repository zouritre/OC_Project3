//
//  CharactersHPLabel.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 04/02/2022.
//

import UIKit

class CharactersHPLabel: UILabel {


    var hp : Int = 0 {
        
        willSet{
            text = "Health: \(newValue)"
        }
    }

}
