//
//  CharacterList.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation
import UIKit

class CharacterList: UIStackView{    //Store a list of every character existing in the game for easy retrieve
    
//        Create as much buttons and custom name text fields as there are playable characters in the game
//        And set their default names on the buttons
    func displayAvailableCharacters(){
        for character in Characters.list{
            let row = self.createStackView(axis: NSLayoutConstraint.Axis.horizontal, alignement: UIStackView.Alignment.fill, distribution: UIStackView.Distribution.fillEqually, spacing: 2, baselineRelative: false) // Create a custom  horizontal StackView
            let customButton1 = CreateButton()
            
            row.addArrangedSubview(customButton1.customButton(for: character)) // Add a custom Button to that StackView
            row.addArrangedSubview(self.createTextView()) // add a TextView next to the button
            
            addArrangedSubview(row)  // Add the customly filled StackView to CharacterList vertical StackView as a row
        }
                    
    }
    
//    Create a customizable stackView
    private func createStackView(axis: NSLayoutConstraint.Axis, alignement: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat, baselineRelative: Bool) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = alignement
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.isBaselineRelativeArrangement = baselineRelative
        
        return stackView
    }
    
//    Create a simple textView
    private func createTextView() -> UITextView {
        let textView = UITextView()
        textView.isScrollEnabled = false
        
        return textView
    }
}
