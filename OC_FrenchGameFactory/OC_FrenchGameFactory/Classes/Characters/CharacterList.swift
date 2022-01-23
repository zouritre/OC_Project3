//
//  CharacterList.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation
import UIKit

class CharacterList{    //Store a list of every character existing in the game for easy retrieve
    internal static var characterList: [Character] {
        var characterList : [Character] = []
        characterList.append(Raisin())
        characterList.append(Kiwi())
        characterList.append(Orange())
        characterList.append(Citron())
        return characterList
    }
    internal static func displayAvailableCharacters(in vStackView: UIStackView){
        //Create as much buttons as there are playable characters in the game
        //And set their default names on the buttons
        for character in CharacterList.characterList{
            let row = self.createStackView(axis: NSLayoutConstraint.Axis.horizontal, alignement: UIStackView.Alignment.fill, distribution: UIStackView.Distribution.fillEqually, spacing: 2, baselineRelative: false)
            let customButton1 = CreateButton()
            
            row.addArrangedSubview(customButton1.customButton(for: character))
            row.addArrangedSubview(self.createTextView())
            
            vStackView.addArrangedSubview(row)
        }
                    
    }
    private static func createStackView(axis: NSLayoutConstraint.Axis, alignement: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat, baselineRelative: Bool) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = alignement
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.isBaselineRelativeArrangement = baselineRelative
        
        return stackView
    }
    private static func createTextView() -> UITextView {
        let textView = UITextView()
        textView.isScrollEnabled = false
        
        return textView
    }
}
