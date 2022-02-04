//
//  CharactersButton.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 04/02/2022.
//

import UIKit

class CharactersButton: UIButton {

    var correspondingCharacter = Character() {
        willSet{
            setTitle(newValue.customName, for: .normal)
        }
    }

}
