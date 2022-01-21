//
//  CharacterList.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

class CharacterList{    //Store a list of every character existing in the game for easy retrieve
    static var characterList: [Character] {
        var characterList : [Character] = []
        characterList.append(Raisin())
        characterList.append(Kiwi())
        characterList.append(Orange())
        characterList.append(Citron())
        return characterList
    }
    init(){
    }
}
